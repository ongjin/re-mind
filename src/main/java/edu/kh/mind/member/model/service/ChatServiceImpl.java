package edu.kh.mind.member.model.service;

import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.dao.ChatDAO;
import edu.kh.mind.member.model.vo.ChatJoin;
import edu.kh.mind.member.model.vo.ChatMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatServiceImpl implements ChatService {

    @Autowired
    private ChatDAO dao;

    // 채팅방 입장
    public List<ChatMessage> joinChat (ChatJoin chat) {

        int result = dao.existsChat(chat);
        System.out.println("existsChat : " + result);

        if (result > 0) {
            chat.setChattingNo(result);
            List<ChatMessage> list = dao.selectChatMessage(chat);

            System.out.print("list : ");
            System.out.println(list);
            return list;
        } else {
            return null;
        }
    }


    public int insertMessage (ChatMessage cm) {

        int result = 0;

        if (cm.getMessage() == null) {

        } else {
            cm.setMessage((Util.XSS(cm.getMessage())));
            cm.setMessage(Util.changeNewLine(cm.getMessage()));

            System.out.println("----------------------------------------------");
            System.out.println(cm);


            result = dao.insertMessage(cm);
        }

        return result;
    }

}
