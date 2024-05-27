package edu.kh.mind.board.model.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.mind.adminPro.model.exception.InsertCertificationFailException;
import edu.kh.mind.board.model.dao.SecretDAO;
import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Empathy;
import edu.kh.mind.board.model.vo.Image;
import edu.kh.mind.board.model.vo.Scrap;
import edu.kh.mind.board.model.vo.WorryCategory;
import edu.kh.mind.common.util.Util;


@Service
public class SecretServiceImpl implements SecretService {

	@Autowired
	private SecretDAO dao;

	
	@Override
	public List<Board> selectSecretList(Map<String, String> param) {
		param.put("boardCategoryCode", "104");
		
		if(param.get("memberNo") != null) {
			
			String muteMember  = dao.selectMuteMember(param);
			param.put("muteMember", muteMember);
			
			System.out.println(param.get("muteMember"));
			
		}
		
		List<Board> result =  dao.selectSecretList(param);
		
		return result;
	}
	
	
	
	
	@Override
	public int countSecretList() {
		return dao.countSecretList();
	}

	
	@Override
	public int insertSecretBoard(Board board, List<MultipartFile> images, String webPath, String serverPath) {
		
		
		board.setBoardContent(Util.XSS((String)board.getBoardContent()));
		board.setBoardContent(Util.changeNewLine((String)board.getBoardContent()));
		
		board.setBoardCategoryCode(104);
		
		System.out.println(images);
		
		int boardNo= dao.insertSecretBoard(board);
		
		System.out.println(boardNo);
		
		if(boardNo>0) {
			//실제 업로드도니 이미지를 분별하여 list<Boardimages> imgList에 담기
			List<Image> imgList = new ArrayList<Image>();
			
			for(int i = 0 ; i<images.size(); i++) {
				//i == images index == level
				
				//각 인덱스 요소에 파일이 업로드 되었는지 검사
				if(!images.get(i).getOriginalFilename().equals("")) {
					//업로드가 된 경우 MultipartFile에서 DB저장에 필요한 데이터를 추출 -> add BoardImage -> add imgList
					
					Image img = new Image();
					img.setImagePath(webPath); //web access
					img.setImageOriginal(images.get(i).getOriginalFilename()); //OriginalFileName
					//image rename
					img.setImageName(Util.fileRename(images.get(i).getOriginalFilename()));
					img.setImageLevel(i);
					img.setBoardNo(boardNo); //return from dao 
					
					
					System.out.println(img.toString());
					imgList.add(img); //add to List
				}// end if
			}//end for
			System.out.println("------------------------");
			System.out.println(imgList);
			
			
			int result = 0;
			//upload images if there are infomation about imgList
			if(!imgList.isEmpty()) {
				
				for(int i = 0; i <imgList.size(); i++) {
					System.out.println("------------------------");
					System.out.println(imgList.get(i));
					result += dao.insertImgList(imgList.get(i));
				}
				
				System.out.println(result);
				//삽입 성공한 행의 개수와 imgList 개수가 같을 경우 파일을 서버에 저장 
				//1순위로 확인할 것 : servers -> fin server -> Overview -> serve module 확인 
				
				
				// images : MultipartFile List : 실제 파일 + 정보 
				// imgList : BoardImage List, DB에 저장할 파일 정보
				if(result == imgList.size()) {
					for(int i = 0; i <imgList.size(); i++) {
						
						//업로드된 파일이 있는 images의 인덱스 요소를 얻어와 지정된 경로와 이름으로 파일로 변환하여 저장
						try {
							images.get(imgList.get(i).getImageLevel())
							.transferTo(new File(serverPath+"/"+ imgList.get(i).getImageName()));
						} catch (Exception e) {
							e.printStackTrace();
							
							throw new InsertCertificationFailException("파일 변환중 문제 발생");
							
							//파일 변환이 실패할 경우 사용자 정의 예외 발생
						}
					}
				}else {
					//업로드된 이미지 수와 삽입된 행의 수가 다를경우 
					//사용자 정의 예외 발생
				  throw new InsertCertificationFailException();
				  
				}
			}
		}
		return boardNo;
	}

	// 수정화면 전환용
	@Override
	public Board selectBoard(int boardNo) {
		Board board = dao.selectBoard(boardNo);
		
		board.setBoardContent( Util.changeNewLine2( board.getBoardContent() )  );
		return board;
	}


	@Override
	public int updateBoard(Board board) {

		board.setBoardContent( Util.XSS( board.getBoardContent() ));
		board.setBoardContent( Util.changeNewLine( board.getBoardContent() ));
		
		return dao.updateBoard(board);
	}


	@Override
	public Board selectBoard(int boardNo, int memberNo) {
	
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("boardNo", boardNo);
		map.put("memberNo", memberNo);
		
		Board board = dao.selectBoard(map);
		
		// 게시글 상세조회 성공 && 게시글 작성자 != 회원번호 
		if( board != null && board.getMemberNo() != memberNo) {
			
			// 조회수 증가 
			int result = dao.increaseReadCount(boardNo);
			
			// 조회 수 증가 성공 시
			// 미리 조회된 board의 readCount를 + 1 (DB동기화)
			if(result > 0) {
				board.setReadCount( board.getReadCount() + 1 );
			}
		}
		
		return board;
	}


	@Override
	public int deleteBoard(int boardNo) {
		return dao.deleteBoard(boardNo);
	}
	
	
	@Override
	public int boardScrap(Scrap scrap) {
		Scrap selectScrap = dao.selectScrap(scrap);
		System.out.println(selectScrap);
		
		int result = 0;
		if(selectScrap == null) {
			result = dao.insertScrap(scrap);
			
			System.out.println(scrap);
			if(result > 0) {
				result = 1;
			}else {
				result = 0;
			}
		}else {
			result = dao.deleteScrap(scrap);
			if(result > 0){
				result =2;
			}else {
				result =0;
			}
		}
		

		return result;
	}
	
	
	// 회원 차단 
	@Override
	public int memberBlock(HashMap<String, Integer> map) {
		return dao.memberBlock(map);
	}




	@Override
	public int insertEmpathy(Empathy empathy) {
		
		Empathy selectEmpathy = dao.selectEmpathy(empathy);
		
		int result = 0;
		if(selectEmpathy == null) {
			result = dao.insertEmpathy(empathy);
			
			if(result > 0) {
				result = 1;
			}else {
				result = 0;
			}
		}else {
			result = dao.deleteEmpathy(empathy);
			if(result > 0){
				result =2;
			}else {
				result =0; 
			}
		}
		

		return result;
	}




	@Override
	public int countEmpathy(Empathy empathy) {
		return dao.countEmpathy(empathy);
	}

	
	
	
	
	

	
	
}
