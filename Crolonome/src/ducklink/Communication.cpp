#include "ducklink/Communication.h"
#include <Arduino.h>
#include "PinLayout.h"

Communication communication(&Serial2);

Communication::Communication(HardwareSerial* serial) : receiveState_(Communication::eRcvState::START_1), serial_(serial) {}

void Communication::init(int baudrate) { serial_->begin(baudrate); }

Communication::eMessageStatus Communication::checkMessages(Message& msg) {
    msg.clear();
    uint8_t byte;
    size_t readLen;
    if (receiveState_ == Communication::eRcvState::START_1) {
        rcvBuffer_.clear();
        checksum_ = 0;
        if (serial_->available()) {
            readLen = serial_->readBytes(&byte, 1);
            if (readLen == 1 && byte == 0xFF) {
                receiveState_ = Communication::eRcvState::START_2;
            }
        }
    }
    if (receiveState_ == Communication::eRcvState::START_2) {
        if (serial_->available()) {
            readLen = serial_->readBytes(&byte, 1);
            if (readLen == 1) {
                if (byte == 0xFF) {
                    receiveState_ = Communication::eRcvState::LEN;
                } else {
                    receiveState_ = Communication::eRcvState::START_1;
                }
            }
        }
    }
    if (receiveState_ == Communication::eRcvState::LEN) {
        if (serial_->available()) {
            readLen = serial_->readBytes(&byte, 1);
            if (readLen == 1) {
                nbBytesExpected_ = byte;
                receiveState_ = Communication::eRcvState::PAYLOAD;
            }
        }
    }
    if (receiveState_ == Communication::eRcvState::PAYLOAD) {
        while(serial_->available() > 0 && nbBytesExpected_ > 0) {
            serial_->readBytes(&byte, 1);
            checksum_ ^= byte;
            rcvBuffer_.push(byte);
            nbBytesExpected_--;
        }
        if(nbBytesExpected_ == 0) {
            receiveState_ = Communication::eRcvState::CHECKSUM;
        }
    }
    if (receiveState_ == Communication::eRcvState::CHECKSUM) {
        if (serial_->available()) {
            readLen = serial_->readBytes(&byte, 1);
            if (readLen == 1) {
                receiveState_ = Communication::eRcvState::START_1;
                if (byte == checksum_) {
                    EmbeddedProto::Error err = msg.deserialize(rcvBuffer_);
                    if (err == EmbeddedProto::Error::NO_ERRORS) {
                        return Communication::eMessageStatus::NEW_MSG;
                    } else {
                        return Communication::eMessageStatus::COM_ERROR;
                    }
                } else {
                    return Communication::eMessageStatus::COM_ERROR;
                }
            }
        }
    }
    return Communication::eMessageStatus::NO_MSG;
}

void Communication::sendError(::protoduck::Error::Errors e, uint32_t param) {
    Message msg;
    msg.set_msg_type(Message::MsgType::STATUS);
    auto& error = msg.mutable_error();
    error.set_error(e);
    error.set_param(param);
    send(msg);
}

void Communication::sendHMI() {
    Message msg;
    msg.set_msg_type(Message::MsgType::STATUS);
    auto& hmi = msg.mutable_hmi();
    bool color = digitalRead(COLOR);
    bool tirette = digitalRead(TIRETTE);
    hmi.set_color(color);
    hmi.set_tirette(tirette);
    // led and display not set.
    send(msg);
}

void Communication::sendResistance() {
    Message msg;
    msg.set_msg_type(Message::MsgType::STATUS);
    auto& res = msg.mutable_resistance();
    auto value = analogRead(R_MEAS);
    res.set_value(value);
    send(msg);
}

void Communication::send(Message msg) {
    msg.set_source(Message::Agent::DIFF);
    msg.set_msg_type(Message::MsgType::STATUS);
    BytesWriteBuffer sendBuffer;
    sendBuffer.clear();
    msg.serialize(sendBuffer);
    uint8_t header[] = {0xFF, 0xFF, 0};
    header[2] = sendBuffer.get_size();
    uint8_t* data = sendBuffer.get_data();
    uint8_t checksum = 0;
    for (size_t i = 0; i < sendBuffer.get_size(); i++) {
        checksum ^= data[i];
    }
    serial_->write(header, 3);
    serial_->write(data, sendBuffer.get_size());
    serial_->write(&checksum, 1);
}
