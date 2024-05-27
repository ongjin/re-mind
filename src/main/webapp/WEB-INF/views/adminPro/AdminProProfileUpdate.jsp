<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main >
   <h2>${loginPro.professionName} 상담사 프로필 </h2>
   <form action="../update/${loginPro.professionNo}" method="post" enctype="multipart/form-data" role="form" onsubmit="return getCheckBoxVal()">

       <section class="proflieWrap">
           <article class="proInfoWrap">
               <div class="profile">
                   <h3>등록일자</h3>
                   <p>${loginPro.professionEnrollDate}</p>
               </div>
               <div class="profile" >
                   <h3>상담사 이름</h3>
                   <p>${loginPro.professionName}</p>
               </div>
               <div class="profile">
                   <h3>상담사 전화번호</h3>
                   <p>${proHospital.hospitalPhone}</p>
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
               <input type="file" accept=".png" name="proProfile" id="" onchange="loadImg(this)" style="display: none">
               <div class="imgBox" style="position: relative;" >
               	<img alt="" src="${contextPath}${proInfo.imagePath}/${proInfo.imageName}">
               	<i class="fas fa-times deleteImg" style=" position: absolute; top: 10px;  right: 10px;"></i>
               	
               	<c:if test="${empty proInfo.imageName}">
               		<span class ="imgDec" style="position: absolute; top: 120px; right: 30px;"> 클릭하여 프로필 사진 추가</span>
               	</c:if>
               	
               </div>
               <p style="font-size: 15px; margin-top: 20px;">500x500 이상의 뒷배경이 투명인 png파일을 올려주세요</p>
               <a href="https://www.remove.bg/ko" target="_blank">투명배경 만들기</a>
           </article>
       </section>
       
       <section class="proDescrpiton">
           <article class="proInfo">
               <h3>태그추가하기</h3>
               <div class="checkBoxWrap">
               
               		<c:forEach items="${category}"  var="c">
               			<div class="checkBox" >
                   			<input type="checkbox" name="worryCategoryOne" value="${c.worryCategoryCode}" id="${c.worryName}">
                  			<label for="${c.worryName}">${c.worryName}</label>
                   		</div>
                   </c:forEach>
             		<input type="hidden" name="worryCategoryCode" id="worryCategory" value=""/>
               </div>
           </article>

           <article class="proInfo">
               <h3>하고싶은 말</h3>
               <textarea name="professionIntro" id="professionIntro" rows="8" style="overflow: auto;">${proInfo.professionIntro}</textarea>
           </article>

           <article class="proInfo">
               <h3>상담사 소개</h3>
               <textarea name="professionStory" id="professionStory"  rows="8" style="overflow: auto;">${proInfo.professionStory}</textarea>
           </article>
           
           <article class="proInfo">
               <h3>경력</h3>
               <textarea name="professionCarrer" id="professionCarrer"  rows="8" style="overflow: auto;">${proInfo.professionCarrer}</textarea>
           </article>
       </section>


       <section class="priceWrap">
           <h3>가격 정보</h3>
	           <c:forEach items="${price}" var="p">
	           
		           <article class="proPrice">
	                   <label for = "${p.counselCategoryCode}">
	                   		<c:choose>
	                   			<c:when test="${p.counselCategoryCode == 1}">채팅상담</c:when>
	                   			<c:when test="${p.counselCategoryCode == 2}">화상상담</c:when>
	                   			<c:otherwise> 전화상담</c:otherwise>
	                   		</c:choose>
	                   </label>
	                   <input type="number" name="counselPrice" value="${p.counselPrice}" id="${p.counselCategoryCode}">원 
		           </article>
	           </c:forEach>
       </section>
       
       <button style="margin-bottom: 150px;">수정하기</button>
   </form>
</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>

<script type="text/javascript">

	$(function() {
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
	
	//submit시 고민카테고리 코드 문자열 만들기
    function getCheckBoxVal(){
        var worryCategoy = "" // 문자열 선언
 
        $('input:checkbox[name=worryCategoryOne]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
        	worryCategoy += this.value + ",";
        });
        
        
        $('#worryCategory').val(worryCategoy.slice(0,-1));
        return true;
        
    }

</script>




