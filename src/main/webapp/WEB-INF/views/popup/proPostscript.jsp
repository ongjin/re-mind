<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<div id="letter_area_wrap">
    <div class="top_title_wrap">
        <h2 class="title">상담 후기</h2>
    </div>

    <div>
	    <h3 id="starTitle">별점</h3>
		<div class="starpoint_wrap">
			  <div class="starpoint_box">
			    <label for="starpoint_1" class="label_star" title="1"><span class="blind">1점</span></label>
			    <label for="starpoint_2" class="label_star" title="2"><span class="blind">2점</span></label>
			    <label for="starpoint_3" class="label_star" title="3"><span class="blind">3점</span></label>
			    <label for="starpoint_4" class="label_star" title="4"><span class="blind">4점</span></label>
			    <label for="starpoint_5" class="label_star" title="5"><span class="blind">5점</span></label>
			    <label for="starpoint_6" class="label_star" title="6"><span class="blind">6점</span></label>
			    <label for="starpoint_7" class="label_star" title="7"><span class="blind">7점</span></label>
			    <label for="starpoint_8" class="label_star" title="8"><span class="blind">8점</span></label>
			    <label for="starpoint_9" class="label_star" title="9"><span class="blind">9점</span></label>
			    <label for="starpoint_10" class="label_star" title="10"><span class="blind">10점</span></label>
			    <input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_2" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_4" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_6" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_8" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
			    <input type="radio" name="starpoint" id="starpoint_10" class="star_radio">
			    <span class="starpoint_bg"></span>
			  </div>
		</div>
		<span id="reviewCount"></span>
    </div>
   	

    <div class="letter_box">
        <textarea style="resize: none" id="proPostText"></textarea>
        <button id="proReview" onclick="proReview();">후기 올리기</button>
    </div>
</div>

<script>

	var reviewCount;	// 점수
	var reviewContent;  // 후기 내용
	
	$(".label_star").on("click", function(){
		const index = $(".label_star").index($(this));
		reviewCount = $(this).attr("title");

		$("#reviewCount").html(reviewCount+"점");
	
		//$(".starpoint_box .star_radio ~ .starpoint_bg").css("width", ((index + 1) * 8) + "%");
		$(".starpoint_box .starpoint_bg").css("width", ((index + 1) * 10) + "%");

	});

	// 클릭시
	function proReview(){
		
		reviewContent = $("#proPostText").val();

		$.ajax({
			url :  "${contextPath}/my/reviewInsert",
			type : "POST",
			// 전문가 번호 필요
			data : {"reviewStarPoint":reviewCount,"reviewContent":reviewContent,"professionNo":professionNo,"reservationNo":reservationNo},

			success:function(result){
				if (result > 0){
					alert("후기 등록이 완료되었습니다.");
					
					location.reload();
				}
			},

		});
	}




</script>