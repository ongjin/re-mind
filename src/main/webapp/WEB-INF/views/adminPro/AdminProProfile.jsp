<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main>
   <h2>상담사 프로필</h2>

       <section class="proflieWrap">
           <article class="proInfoWrap">
               <div class="profile">
                   <h3>등록일자</h3>
                   <p> ${loginPro.professionEnrollDate}</p>
               </div>
               <div class="profile" >
                   <h3>상담사 이름</h3>
                   <p> ${loginPro.professionName}</p>
               </div>
               <div class="profile">
                   <h3>상담사 전화번호</h3>
                   <p>${loginPro.professionPhone}</p>
               </div>
               <div class="profile">
                   <h3>상담사 이메일</h3>
                   <p>${loginPro.professionId}</p>
               </div>
               <div class="profile">
                   <h3>병원명</h3>
                   <p>${proHospital.hospitalName}</p>
               </div>
               <div class="profile">
                   <h3>병원 주소</h3>
                   <p>${proHospital.hospitalAddress}</p>
               </div>
           </article>
           <article class="profailPic">
               <h3 style="text-align: center;">프로필 이미지</h3>
               <div class="imgBox" >
               	<img alt="" src="${contextPath}${proInfo.imagePath}/${proInfo.imageName}">
               </div>
           </article>
       </section>
       
       <section class="proDescrpiton">
           <article class="proInfo">
               <h3>상담태그</h3>
               <div class="worryCategory">
					${worryCategory.worryName}
               </div>
           </article>

           <article class="proInfo">
               <h3>하고싶은 말</h3>
               <div class= proInfoDiv style="text-align: left; border: 1px solid #ededed; height: 150px; overflow: auto;">${proInfo.professionIntro}</div>
           </article>

           <article class="proInfo">
               <h3>상담사 소개</h3>
               <div class= proInfoDiv style="text-align: left; border: 1px solid #ededed; height: 150px; overflow: auto;">${proInfo.professionStory}</div>
           </article>
           
           <article class="proInfo">
               <h3>경력</h3>
               <div class= proInfoDiv style="text-align: left; border: 1px solid #ededed; height: 150px; overflow: auto;">${proInfo.professionCarrer}</div>
           </article>
       </section>


       <section class="priceWrap">
           <h3>가격 정보</h3>
			<c:forEach items="${price}" var="p">
	           
		           <article class="proPrice">
	                   <label for = "${p.counselCategoryCode}">
	                   		<c:choose>
	                   			<c:when test="${p.counselCategoryCode == 1}">채팅상담 : </c:when>
	                   			<c:when test="${p.counselCategoryCode == 2}">화상상담 :</c:when>
	                   			<c:otherwise> 전화상담 :</c:otherwise>
	                   		</c:choose>
	                   </label>
	                   <div style="display: inline-block; margin-left: 10px; margin-bottom: 10px;"> ${p.counselPrice}원 </div>
		           </article>
	           </c:forEach>

           
       </section>
       
       <button onclick="location.href='../update/${loginPro.professionNo}'" style="margin-bottom: 150px;">수정하기</button>

</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>

<script type="text/javascript">

/* 	$(function() {
		$(".imgBox").on("click", function() {
	
			$(".imgDec").text("");
			$("[type=file]").click();
			
			// 타입이 file인 요소 중 몇번째 인덱스 요소를 선택하여 클릭
		});
	
	});
	
	$(".deleteImg").on("click",function(e){
		  //event 발생 객체 : 이벤트에 관련된 모든 객체

		  //이벤트 버븥링(감싸고 있는 요소의 이벤트가 전파됨) 을 방지 
		  e.stopPropagation();
		  $(this).prev().removeAttr("src") //미리보기 이미지 삭제 
		  $("input[name=proProfile]").val("")
		  $(".imgDec").text("클릭하여 프로필 사진 추가")
		  
		  
		})
		
		
	function loadImg(input) {
		if (input.files && input.files[0]) {

			var reader = new FileReader();
		
			reader.readAsDataURL(input.files[0]);
			
			reader.onload = function(e) {

				$(".imgBox").children("img").attr("src", e.target.result);
				$(".imgDec").text("")
			}
		}
	}
	
	$(function () {
		const emotionRecordData = JSON.stringify(${emotionRecordData});

		if (emotionRecordData != undefined) {
			const emotionDiary = JSON.parse(emotionRecordData);
			
			let index = 0;		}
		
	} */
	

</script>




