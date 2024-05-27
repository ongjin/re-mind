<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

          <article class="main_content">
              <h3 class="comunity_title">생각을 공유해보세요!</h3>
              <div class="study_title">
                  <p>수고했어 오늘도! <br> 
                     오늘의 하루를 한줄로 표현해보세요</p>
                 <button class="study_submit">작성하기</button>
              </div>
              <div class="study_content">
                  <div class="image_wrap" style="background: url(${contextPath}/resources/images/board/mindPost/연구소.png) 100% 100% / 100% 100% no-repeat;">

                  	<c:choose>
                  		<c:when test="${empty postList}">
                  		</c:when>
                  		<c:otherwise>
                  			<c:forEach items="${postList}" var="post">
	                  			<c:choose>
	                  			<c:when test="${post.itemImgNo == 1}">
		                  			<div class="item beaker1" style="left: ${post.coordLeft}px; top: ${post.coordTop}px; z-index:${post.postNo};" >
		                  				<c:if test="${loginMember.memberNo == post.memberNo }">
		                  				<i class="hidden far fa-trash-alt fa-sm"></i>
		                  				</c:if>
		                  				<p>${post.postContent}</p>
		                  				<p class="hidden nickname">${post.memberFname}</p>
		                  				<input class="postNo" value="${post.postNo}">
		                  			</div>
	                  			</c:when>
	                  			<c:when test="${post.itemImgNo == 2}">
		                  			<div class="item beaker2" style="left: ${post.coordLeft}px; top: ${post.coordTop}px; z-index:${post.postNo};">
		                  				<c:if test="${loginMember.memberNo == post.memberNo }">
		                  				<i class="hidden far fa-trash-alt fa-sm"></i>
		                  				</c:if>
		                  				<p>${post.postContent}</p>
		                  				<p class="hidden nickname">${post.memberFname}</p>
		                  				<input class="postNo" value="${post.postNo}">
		                  			</div>
	                  			</c:when>
	                  			<c:when test="${post.itemImgNo == 3}">
		                  			<div class="item beaker3" style="left: ${post.coordLeft}px; top: ${post.coordTop}px; z-index:${post.postNo};">
		                  				<c:if test="${loginMember.memberNo == post.memberNo }">
		                  				<i class="hidden far fa-trash-alt fa-sm"></i>
		                  				</c:if>
		                  				<p>${post.postContent}</p>
		                  				<p class="hidden nickname">${post.memberFname}</p>
		                  				<input class="postNo" value="${post.postNo}">
		                  			</div>
	                  			</c:when>
	                  			<c:when test="${post.itemImgNo == 4}">
		                  			<div class="item beaker4" style="left: ${post.coordLeft}px; top: ${post.coordTop}px; z-index:${post.postNo};">
		                  				<c:if test="${loginMember.memberNo == post.memberNo }">
		                  				<i class="hidden far fa-trash-alt fa-sm"></i>
		                  				</c:if>
		                  				<p>${post.postContent}</p>
		                  				<p class="hidden nickname">${post.memberFname}</p>
		                  				<input class="postNo" value="${post.postNo}">
		                  			</div>
	                  			</c:when>
	                  			
	                  			
	                  			</c:choose>
                  		
                  		
                  			</c:forEach>
                  		</c:otherwise>
                  	</c:choose>
                  	
                  
                  </div>
             </div>
              

             <ul class="pagination">
             	<c:if test="${pagination.startPage != 1 }">
					<li><a class="page-link" href="list?cp=1}${c}${s}">&lt;&lt;</a></li>
					<li><a class="page-link" href="list?cp=${pagination.prevPage}${c}${s}"">&lt;</a></li>
				</c:if>
				<%-- 페이지네이션 번호 목록 --%>
				<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" step="1"  var="i">
					<c:choose>
						<c:when test="${i == pagination.currentPage}">
							<li class="select_pg"><a>${i}</a></li>   
						</c:when>
						
						<c:otherwise>
							<li><a href="list?cp=${i}${c}${s}"">${i}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<c:if test="${pagination.endPage != pagination.maxPage }">
					<li><a class="page-link" href="list?cp=${pagination.nextPage}${c}${s}"">&gt;</a></li>
					<li><a class="page-link" href="list?cp=${pagination.maxPage}${c}${s}"">&gt;&gt;</a></li>
				</c:if>
               </ul>

            </article>  

</main>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/mindPost.js"></script>

</body>
</html>