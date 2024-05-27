<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<link rel="stylesheet" href="${contextPath}/resources/css/${css}.css">


 <div class="study_modal">
 	<div class="study_modal_title">
 		<h2>여러분 모두 고생하셨습니다! <br>종강 소감 말하기</h2>
 	</div>
 	
	<form action="insert" method="POST">
 	<div class="bg_select">
 	</div>
 	
 	<div class="beaker_radio">
 			<input type="radio"  id="beaker1" class="radioFirst" name="itemImgNo" value="1" checked="checked">
 			<div class="beaker">
 			<label for="beaker1"><img src="${contextPath}/resources/images/board/mindPost/beaker1.png"> </label>
 			</div>
 			
			<input type="radio"  id="beaker2" name="itemImgNo" value="2">
			 <div class="beaker">
 			<label for="beaker2"><img src="${contextPath}/resources/images/board/mindPost/beaker2.png"></label>
 			</div>
 		
			<input type="radio"  id="beaker3" name="itemImgNo" value="3">
			<div class="beaker">
 			<label for="beaker3"><img src="${contextPath}/resources/images/board/mindPost/beaker3.png"></label>
 			</div>
 		
			<input type="radio"  id="beaker4" name="itemImgNo" value="4">
			<div class="beaker">
 			<label for="beaker4"><img src="${contextPath}/resources/images/board/mindPost/beaker4.png"></label>
 			</div>
 	</div>
 	
 	<div class="study_write">
	     <textarea class="study_textarea" name="postContent" id="postContent" rows="3" required></textarea>
	      <div id="content_counter">
          <p><span id = "content_count">0</span>/15</p>
          </div>
	<button type="submit" class="study_submit_btn">작성</button>
	</div>
	
 	
 	</form>
 	
 
 
 </div>
 
 <script>
 $(".study_textarea").on("input" , function(){

	    let count = $(this).val().length;

	    if(count >= 15){
	        $("#content_count").css("color", "red");
	        
	        $(this).val( $(this).val().substr(0,15) );
	        
	        count = 15;

	    }else if( count < 15){
	        $("#content_count").css("color", "black");

	    }
	    $("#content_count").text(count);

	});
 
 
 </script>

