package edu.kh.mind.common.scheduling;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;


@Component
public class SchedulingTest {

   
   @Scheduled(fixedDelay = 3000) // 1000:1
   public void test() {

   }
   
}
