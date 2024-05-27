package edu.kh.mind.selftest.model.dao;

import edu.kh.mind.selftest.model.vo.Selftest;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class SelftestDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;


    // 문항
    public List<Selftest> selectQ(Selftest selftest) {
        return sqlSession.selectList("selftestMapper.selectQ", selftest);
    }
    // 답변
    public List<Selftest> selectA(Selftest selftest) {
        return sqlSession.selectList("selftestMapper.selectA", selftest);
    }
    // 결과
    public List<Selftest> selectR(Selftest selftest) {
        return sqlSession.selectList("selftestMapper.selectR", selftest);
    }

    // 결과 조회
    public Selftest selectResult(Selftest selftest) {
        return sqlSession.selectOne("selftestMapper.selectResult", selftest);
    }
}
