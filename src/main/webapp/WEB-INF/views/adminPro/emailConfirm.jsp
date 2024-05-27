<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main>
    <h1> 이메일 인증 완료 </h1>

        <div style="text-align: center;">
            아래 링크로 이동하여 상담사 등록을 마무리해주세요 <br>
        	<a href="proRegisterDetail/${loginPro.professionNo}" style="margin-top: 30px; font-size: 25px; font-weight: 600;">상담사 정보 등록하기</a>
        </div>

</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>





