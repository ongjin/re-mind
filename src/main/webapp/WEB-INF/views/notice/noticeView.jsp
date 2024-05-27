<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

           <article class="main_content">
                <div class="notice_title">
                    <p>${notice.noticeTitle}</p>
                </div>
                <div class="notice_subject">
                    <span class="notice_date">
                        작성일 ${notice.createDate}
                    </span>
                </div>
                <div class="notice_content">
                    ${notice.noticeContent}
                </div>
                
              
                <div class="notice_button">
                    <button onclick="location.href='../list'">목록</button>
                </div>
          

            </article>
</main>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>

</body>
</html>