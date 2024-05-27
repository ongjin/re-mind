<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<div id="letter_area_wrap">

    <div class="top_title_wrap">
        <h2 class="title">상담 문의</h2>
    </div>
    
    <div class="letter_box">
        <textarea style="resize: none" id="proPostText"></textarea>
        <button id="proReview" onclick="proLetter();">문의 하기</button>
    </div>
    
</div>

<script>

	// 클릭시
	function proLetter(){
		
		letterContent = $("#proPostText").val();
		
		console.log(letterContent);
		
		$.ajax({
			url :  "${contextPath}/pro/proLetterInsert",
			type : "POST",
			// 쪽지내용, 회원번호, 전문가번호
			data : {"letterContent":letterContent,
				"professionNo":professionNo,"memberNo":memberNo},
		
			success:function(result){
				if (result > 0){
					
					alert("문의 등록이 완료되었습니다.");
					
					// 모달창 닫기
					$("#letter_area_wrap").css("display","none");
					$(".close_popup_btn").css("display","none");
					
				}
			},
		
		});

	}

</script>