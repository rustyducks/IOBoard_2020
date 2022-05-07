#include <Arduino.h>

#include "PinLayout.h"
#include "ducklink/Communication.h"
#include "Display.h"

uint32_t status_time = 0;

Message cmd;

unsigned long lastSent = 0;

void setup() {
    Serial.begin(115200);
    communication.init(115200);
    display.init();
    display.clearScreen();
    display.setBrightness(7);
    display.display(0);

}

void loop() {

    Communication::eMessageStatus msgStatus = communication.checkMessages(cmd);
    if (msgStatus == Communication::eMessageStatus::NEW_MSG) {
        if (cmd.msg_type() == Message::MsgType::COMMAND) {
            if(cmd.has_procedure()) {
                //protoduck::Procedure::Proc procedure = cmd.procedure().get_proc();
                //auto param = cmd.procedure().get_param();
                //auto arm_id = cmd.procedure().get_arm_id();
                //procedure_manager.queueProcedure(procedure, arm_id, param);
            } else if(cmd.has_hmi()) {
                //uint32_t led = cmd.hmi().get_led();
                uint32_t score = cmd.hmi().get_hmi_display();
                display.clearScreen();
                display.display(score);
                // LED
            }
        }
    }

    if(millis() - status_time > 200) {
        communication.sendHMI();
        status_time = millis();
    }    
}
