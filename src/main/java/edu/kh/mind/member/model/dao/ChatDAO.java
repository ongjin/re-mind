package edu.kh.mind.member.model.dao;

import edu.kh.mind.member.model.vo.ChatJoin;
import edu.kh.mind.member.model.vo.ChatMessage;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class ChatDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public int existsChat(ChatJoin chat) {
        return sqlSession.selectOne("chatMapper.existsChat", chat);
    }

    public List<ChatMessage> selectChatMessage(ChatJoin chat) {
        return sqlSession.selectList("chatMapper.selectChatMessage", chat);
    }

    public int insertMessage(ChatMessage cm) {
        return sqlSession.insert("chatMapper.insertMessage", cm);
    }

}
