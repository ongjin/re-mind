<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
	<div class="appointmentPast">
		<div class="title">지난 상담 내역</div>
		<div class="appointmentPast_list">
			<ul>
				<li>
					<div>날짜</div>
					<div>시간</div>
					<div>상담사</div>
					<div>유형</div>
					<div>후기</div>
				</li>
				<c:forEach var="item" items="${rList}">
					<li>
						<div class="img_div"><img src="../../images/sample1.jpg"></div>
						<div class="date_div">${item.reservationEnrollDate}</div>
						
						<c:choose>
							<c:when test="${item.intEnrollDate < 10}">
								<div class="time_div">0${item.intEnrollDate}:00</div>
							</c:when>
							<c:otherwise>
								<div class="time_div">${item.intEnrollDate}:00</div>
							</c:otherwise>
						</c:choose>
						
						<div class="profession_div">${item.professionName}</div>
						<div class="category_div">${item.counselCategoryNm}</div>
						<!--  <div class="status_div"><a href="#">받기</a></div>--><!-- 상담 대기 일때 취소 가능-->
						<div class="review_div">
						<c:choose>
							<c:when test="${item.checkReview == 0}">
								<button type="button" class="btn" onclick="proPostscript(${item.professionNo},${item.reservationNo});">작성하기</button>
							</c:when>
							<c:otherwise>
								작성완료
							</c:otherwise>
						</c:choose>
						</div>
					</li>
				</c:forEach>
				
				
			</ul>
		</div>
	</div>


</article>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript">

	let professionNo;
	let reservationNo;
	
     function proPostscript(num,num2){
    	
    	professionNo = num;
    	reservationNo = num2;
    	
    	layerPopup("proPostscript");
    	$("#proPostText").val(professionNo)
    } 
    
</script>


