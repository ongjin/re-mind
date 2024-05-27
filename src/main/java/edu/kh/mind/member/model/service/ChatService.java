package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.vo.ChatJoin;
import edu.kh.mind.member.model.vo.ChatMessage;

import java.util.List;

public interface ChatService {


    /**
     * 채팅방 입장
     * @param chat
     * @return list
     */
    List<ChatMessage> joinChat(ChatJoin chat);

    /**
     * 채팅 메시지 삽입
     * @param cm
     * @return result
     */
    int insertMessage(ChatMessage cm);

}
