package edu.kh.mind.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import edu.kh.mind.board.model.vo.Board;
import edu.kh.mind.board.model.vo.Empathy;
import edu.kh.mind.board.model.vo.Report;
import edu.kh.mind.board.model.vo.Scrap;

public interface BoardService {


	List<Board> selectBoardList(Map<String, String> param);

	int insertFreeBoard(Board board, List<MultipartFile> images, String webPath, String serverPath);

	Board selectBoard(int boardNo, int memberNo);

	int updateBoard(Board board);

	Board selectBoard(int boardNo);

	int deleteBoard(int boardNo);


	int boardScrap(Scrap scrap);

	/**
	 *  메인 커뮤니티
	 * @return mainBoardList
	 */
    List<Board> selectMainBoardList();

	int countFreeList();

	int memberBlock(HashMap<String, Integer> map);

	int insertEmpathy(Empathy empathy);

	int countEmpathy(Empathy empathy);

	int insertReport(Report report);

	Report selectReport(Report report);

}
