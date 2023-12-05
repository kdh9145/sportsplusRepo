package com.sportsplus.app.controller;

import java.io.IOException;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Controller;

@Controller
@ServerEndpoint("/chat/{category}")
public class ChatController {

    @OnOpen
    public void onOpen(Session session, @PathParam("category") String category) {
        session.getUserProperties().put("category", category);
    }
    
    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        Set<Session> sessions = session.getOpenSessions();
        for (Session s : sessions) {
            if (s.isOpen() && s.getUserProperties().get("category").equals(session.getUserProperties().get("category"))) {
            	s.getBasicRemote().sendText(message);
            }
        }
    }
}