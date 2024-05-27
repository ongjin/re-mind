package edu.kh.mind.pro.model.service;

import edu.kh.mind.board.model.vo.Image;
import edu.kh.mind.board.model.vo.WorryCategory;
import edu.kh.mind.member.model.vo.Profession;

import edu.kh.mind.member.model.vo.ProfessionPrice;
import edu.kh.mind.member.model.vo.Review;
import edu.kh.mind.pro.model.dao.ProDAO;
import edu.kh.mind.pro.model.vo.Letter;
import edu.kh.mind.pro.model.vo.Payment;
import edu.kh.mind.pro.model.vo.Reservation;
import edu.kh.mind.pro.model.vo.ReservationPayMent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ExceptionHandler;

import java.util.List;
import java.util.Map;

@Service
public class ProServiceImpl implements ProService{

    @Autowired
    private ProDAO dao;


	@Override
    public List<Profession> selectProfession(Map<String, Object> worryCtCd) {
        return dao.selectProfession(worryCtCd);
    }


	@Override
	public int updateWish(Map<String, Integer> map) {

		int result = 0;
		if(map.get("wishCheck") > 0)
			result = dao.insertWish(map);
		else
			result = dao.deleteWish(map);

		return result;
	}

	@Override
	public String setCategory(int professionNo) {
		return dao.setCategory(professionNo);
	}

	@Override
	public int selectWishPro(Map<String, Integer> map) {
		return dao.selectWishPro(map);
	}

	@Override
	public int selectProfessionCount() {
		return dao.selectProfessionCount();
	}

	/**
	 * 상담사 랜덤
	 * @return
	 */
	@Override
	public List<Profession> selectProRandom() {
		return dao.selectProRandom();
	}

	// 총 금액 insert
    @Transactional
    @Override
    public int priceInsert(ProfessionPrice pfp, ReservationPayMent rv) {
    	
    	//****************************
        // 상담예약결제 insert
    	dao.reservationPaymentInsert(rv);
    	//****************************
    	
    	//****************************
    	// 전문가 번호 삽임
    	pfp.setProfessionNo(rv.getProfessionNo());
    	
    	// 전문가 번호, 테라피 번호로 select 가격
    	int price = dao.professionPriceSelect(pfp);
    	//****************************
    	
    	// 총금액 횟수 * 금액
    	int payAmount = rv.getTotalCnt() * price;

    	//상담 예약 결제 번호 결제 vo에 넣기
    	Payment pm = new Payment();    	
    	pm.setPayAmount(payAmount);
        pm.setReservationNo(rv.getReservationPayNo());
        
        // 결제 insert
        dao.paymentInsert(pm);
        
        return pm.getPayNo();
    }
    
    // 아임 포트와 비교할 총 금액 select
	@Override
	public int priceSelect(int payNo) {
		
		int price = dao.priceSelect(payNo);
		
		return price;
	}
	
	// 총 금액이 맞다면 payment update, reservation insert 진행
	@Override
	public int reservationUpdate(Payment payment, Reservation reservation) {
		
		// payment update
		dao.paymentUpdate(payment);
		
		reservation.setPayNo(payment.getPayNo());
		
		int result = dao.reservationInsert(reservation);

		// chat insert
		if (result > 0 && reservation.getCounselCategoryNm() == "텍스트테라피") {
			dao.insertChatting(reservation);

//[Reservation{reservationNo=130, reservationEnrollDate=2022-02-13, reservationEnrollTime=20, reservationStatusCode=0, reservationCancel='null', counselCategoryNo=1, reservationPayNo=183, counselCategoryNm='텍스트테라피', PayNo=183, memberNo=3, memberName='null', professionNo=24, professionName='null', statusCode=1}]

		}
		
		return result;
	}
	
	// 결제 취소버튼 눌렀을 경우
	@Transactional
	@Override
	public int paymentDelete(int payNo) {
		
		// payNo로 상담 예약 결제 번호 가지고 오기
		int reservationNo = dao.reservationNoSelect(payNo);
		
		// 상담예약 결제 삭제
		int result = dao.reservationPaymentDelete(reservationNo);
		
		int result2 = 0;
		
		if(result > 0) {
			// 결제 테이블 삭제
			result2 = dao.paymentDelete(payNo);
		}

		return result2;
	}
	
	@Override
	public List<Profession> selectMemberProfession(int professionNo) {
		return dao.selectMemberProfession(professionNo);
	}
	

	@Override
	public Profession selectPro(int professionNo) {
		return dao.selectPro(professionNo);
	}
	
	// 후기 select
	@Override
	public List<Review> reviewListSelect(int professionNo) {
		
		return dao.reviewListSelect(professionNo);
	}
	
	// 별점만 가지고오기
	@Override
	public List<Review> starPointSelect(int professionNo) {

		return dao.starPointSelect(professionNo);
	}
	
	// 상담사 별 후기 평점
	@Override
	public int starPointAverage(int professionNo) {
		return dao.starPointAverage(professionNo);
	}
	
	// 상담사 문의 쪽지 보내기
	@Override
	public int proLetterInsert(Letter letter) {
		return dao.proLetterInsert(letter);
	}
	
	// 상담사 이름, 사진 가지고 오기
	@Override
	public Image proImageNameSelect(int professionNo) {
		
		return dao.proImageNameSelect(professionNo);
	}
	
	// 후기 더보기
	@Override
	public List<Review> reviewAdd(Review review) {
		return dao.reviewAdd(review);
	}
	
	// 총 후기 count
	@Override
	public int listCountSelect(Review review) {
		// TODO Auto-generated method stub
		return dao.listCountSelect(review);
	}
	
	@Override
	public String proPriceSelect(int professionNo) {

		return dao.proPriceSelect(professionNo);
	}
}
