package edu.kh.mind.selftest.model.service;

import edu.kh.mind.selftest.model.dao.SelftestDAO;
import edu.kh.mind.selftest.model.vo.Selftest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SelftestServiceImpl implements SelftestService {

    @Autowired
    private SelftestDAO dao;

    @Override
    public Map<String, Object> selectQ(Selftest selftest) {

        Map<String, Object> selectAll = new HashMap<>();
        List<Selftest> Answer = new ArrayList<>();
        List<Selftest> Result = new ArrayList<>();

       List<Selftest> Quest = dao.selectQ(selftest) ;
       if (!Quest.isEmpty()){
           Answer = dao.selectA(selftest);
           Result = dao.selectR(selftest);
       }
        selectAll.put("Quest", Quest);
        selectAll.put("Answer", Answer);
        selectAll.put("Result", Result);

        return selectAll;
    }

    // 결과 조회
    @Override
    public Selftest selectResult(Selftest selftest) {

        return dao.selectResult(selftest);
    }
}
