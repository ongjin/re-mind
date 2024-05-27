package edu.kh.mind.pro.model.service;

import edu.kh.mind.board.model.vo.Image;
import edu.kh.mind.board.model.vo.WorryCategory;
import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.member.model.vo.ProfessionPrice;
import edu.kh.mind.member.model.vo.Review;
import edu.kh.mind.pro.model.vo.Letter;
import edu.kh.mind.pro.model.vo.Payment;
import edu.kh.mind.pro.model.vo.Reservation;
import edu.kh.mind.pro.model.vo.ReservationPayMent;

import java.util.List;
import java.util.Map;

public interface ProService {

    List<Profession> selectProfession(Map<String, Object> worryCtCd);

    // 총 가격 insert
    int priceInsert(ProfessionPrice pfp, ReservationPayMent rv);
    
    // 총가격 select
	int priceSelect(int payNo); 
	
	// reservation insert, paymant update
	int reservationUpdate(Payment payment, Reservation reservation);
	
	
	// 취소 버튼 눌렀을 경우
	int paymentDelete(int payNo);


    Profession selectPro(int professionNo);

    List<Profession> selectMemberProfession(int professionNo);
    
    // 후기 가지고 오기
	List<Review> reviewListSelect(int professionNo);
	
	// 별점 가지고오기
	List<Review> starPointSelect(int professionNo);
	
	// 상담사별 별점 평균
	int starPointAverage(int professionNo);

	int selectWishPro(Map<String, Integer> map);

	int updateWish(Map<String, Integer> map);
	
	// 상담 문의 쪽지 보내기
	int proLetterInsert(Letter letter);

	int selectProfessionCount();

	// 상담사 랜덤
	List<Profession> selectProRandom();

	// 상담사 이미지, 이름 가지고 오기
	Image proImageNameSelect(int professionNo);
	
	// 상담사 후기 더보기
	List<Review> reviewAdd(Review review);

	// 상담사 총 후기 count
	int listCountSelect(Review review);


	String setCategory(int professionNo);

	String proPriceSelect(int professionNo);
}
