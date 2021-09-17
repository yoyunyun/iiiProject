package tw.iiihealth.drugs.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import tw.iiihealth.drugs.message.ChatMessage;

/**
 * 接收Client送來的WebSocket訊息及推送給前端的訊息
 */
@Controller
public class ChatController {
		 
    /**
     * 處理前端加入聊天室的訊息，並把訊息推送給前端
     */
    @MessageMapping("/join")
    @SendTo("/topic/public")
    public ChatMessage addUser(@Payload ChatMessage chatMessage, 
            SimpMessageHeaderAccessor headerAccessor) {
        // 把username加入WebSocket的Session
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        return chatMessage; // 返回時會將訊息送至/topic/public
    }
    @GetMapping("/chat")
	public String showContactForm() {
		
		return "drugs/index";
	}
    
    @GetMapping("/chatback")
	public String ShowContactForm() {
		
		return "drugs/index1";
	}
    
    /**
     * 處理前端送來的聊天訊息，並把訊息推送給前端
     */
    @MessageMapping("/chat")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
        return chatMessage; // 返回時會將訊息送至/topic/public
    }
    
}
