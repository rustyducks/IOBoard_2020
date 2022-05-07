#ifndef COMMUNICATION_H
#define COMMUNICATION_H

#include "generated/messages.h"

#include <HardwareSerial.h>

#include "ducklink/BytesReadBuffer.h"
#include "ducklink/BytesWriteBuffer.h"

class Arm;
class Hat;
class ProcedureManager;


// class Message<uint32_t hexa_poses_LENGTH, player_poses_LENGTH>

using Message = ::protoduck::Message<5, 4>;

#define NUM_MESSAGES 10

class Communication {
   public:
    Communication(HardwareSerial* communicationSerial);

    void init(int baudrate);

    enum eMessageStatus { NO_MSG, NEW_MSG, COM_ERROR };
    eMessageStatus checkMessages(Message& msg);
    void sendError(::protoduck::Error::Errors e, uint32_t param);
    void sendHMI();

   protected:
    void send(Message msg);

    enum eRcvState { START_1, START_2, LEN, PAYLOAD, CHECKSUM };
    eRcvState receiveState_;
    uint8_t nbBytesExpected_;
    uint8_t checksum_;
    BytesReadBuffer rcvBuffer_;
    HardwareSerial* serial_;
};

extern Communication communication;

#endif /* COMMUNICATION_H */
