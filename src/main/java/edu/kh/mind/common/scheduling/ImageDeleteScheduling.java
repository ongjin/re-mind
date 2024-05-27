package edu.kh.mind.common.scheduling;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContext;
import java.io.File;
import java.util.Arrays;
import java.util.List;

@Component
public class ImageDeleteScheduling {

    @Autowired
    private ServletContext servletContext; // 서블릿 컨테이너

    @Scheduled(cron = "0 * * * * *") // 모든 년월일시분, 요일 0초 == 매 분 0초마다
//    @Scheduled(cron = "0 0 * * * *") // 모든 년월일시, 요일 0분 0초 == 정시 마다
//    @Scheduled(cron = "0 0 0 * * *") // 모든 년월일, 요일 0시 0분 0초 == 자정마다
    public void imageDelete(){

        String serverPath = servletContext.getRealPath("/resources/images/");
        // -> 이미지가 저장되어 있는 실제 경로

        File[] imgArr = new File(serverPath).listFiles();

        List<File> serverImgList = Arrays.asList(imgArr);

        // --------------------------------------------------------------------------
        // DB에서 파일명 목록 조회

        /*List<String> dbImgList = boardService.selectImgList();

        if(!serverImgList.isEmpty() && !dbImgList.isEmpty() ) {

        	for(File img : serverImgList) {

        		String serverImgName
        			= img.toString().substring( img.toString().lastIndexOf("\\") + 1);

                if( dbImgList.indexOf(serverImgName) == -1){
                    System.out.println(serverImgName + " 삭제");
                    img.delete();
                }
        	}
        }*/


    }

}
