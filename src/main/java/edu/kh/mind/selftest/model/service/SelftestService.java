package edu.kh.mind.selftest.model.service;


import edu.kh.mind.selftest.model.vo.Selftest;

import java.util.List;
import java.util.Map;

public interface SelftestService {
    
    // 문항 응답 조회
    Map<String, Object> selectQ(Selftest selftest);

    // 결과 조회
    Selftest selectResult(Selftest selftest);
}
