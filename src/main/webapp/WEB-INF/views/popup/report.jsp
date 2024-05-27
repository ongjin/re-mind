<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<link rel="stylesheet" href="${contextPath}/resources/css/${css}.css">


 <div class="report_modal" id="letter_area_wrap">
 
    <div class="top_title_wrap">
        <h2 class="title">신고하기</h2>
    </div>
 	<form action="insertReport" method="POST">
	 	<div class="letter_box">
	 		<div id="content_counter" style="text-align: right;">
	        	<p><span id = "content_count">0</span>/200</p>
	        </div>
	        
	 		<textarea class="report_textarea" name="reportContent" id="reportContent" rows="3" required></textarea>
		     
		</div>
	</form>
	<button type="button" class="study_submit_btn" id="proReview" onclick="insertReport();">신고</button>
 	
 
 
 </div>
 
 <script>
 $(".report_textarea").on("input" , function(){

	    let count = $(this).val().length;

	    if(count >= 200){
	        $("#content_count").css("color", "red");
	        
	        $(this).val( $(this).val().substr(0,200) );
	        
	        count = 200;

	    }else if( count < 200){
	        $("#content_count").css("color", "black");

	    }
	    $("#content_count").text(count);

	});
 

	// 클릭시
	function insertReport(){
		
		let reportContent = $("#reportContent").val();
		
		console.log(reportContent);
		
		const form = $("form")[0];
	 	const formData = new FormData(form);
	 	
	 	formData.append("boardNo",boardNo);
	 	formData.append("memberNo",loginMemberNo);
	 	formData.set("reportContent", reportContent);
		
		
		$.ajax({
			url :  "${contextPath}/free/insertReport",
			type : "POST",
			// 쪽지내용, 회원번호, 전문가번호
			data : formData,
			processData: false,
			contentType: false,
			success:function(result){
				
				if(!loginMemberNo){
					 swal({"title" : "로그인해주세요" , 
	                      "icon" : "error"});
				}else{
					if(result == 1 ){
						swal({"title" : "신고 되었습니다." , 
		                      "icon" : "success"});
					}else if(result ==2){
						swal({"title" : "다시시도해주세요." , 
		                      "icon" : "error"});
					}else if(result == 3){
						swal({"title" : "이미 신고된 게시글입니다." , 
							   "icon" : "error"});
					}
					
					/* 팝업 닫기 */
					$("#letter_area_wrap").css("display","none");
					$(".close_popup_btn").css("display","none");
	
				}
		
			},
			error: function (xhr, status, error) {
			    swal({"title" : "서버 연결 오류" , 
                      "icon" : "error"});
			}
		});
	}
</script>

