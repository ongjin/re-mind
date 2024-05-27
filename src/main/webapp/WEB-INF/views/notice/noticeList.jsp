<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

          <article class="main_content">
                
                
                <p class="incidence">
                   4 건
                </p>
                
                <table class="notice_board">
                    <thead>
                        <tr>
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                   
                    <tbody>
                    <c:choose>
						
						<c:when test="${empty noticeList}"> 
							<tr>
								<td colspan="3">게시글이 존재하지 않습니다.</td>
							</tr>
						</c:when>
						
						<c:otherwise>
							<c:forEach items="${noticeList}" var="notice">
								<tr>
									<td>${notice.noticeNo}</td>
									<td class="boardTitle">
										<a href="${contextPath}/notice/view/${notice.noticeNo}">
													${notice.noticeTitle} </a></td>
									<td>${notice.createDate}</td>
                        		<tr>
                        	</c:forEach>
                         </c:otherwise>
					</c:choose>	
										
                    </tbody>
                </table>
                

                    <ul class="pagination">
                     <li class="select_pg"> <a>1</a></li>
                    </ul>

            </article>
</main>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>