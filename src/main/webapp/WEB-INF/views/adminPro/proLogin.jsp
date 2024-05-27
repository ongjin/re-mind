<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main style="padding-right: 260px;">
	<h1>상담사 로그인</h1>

    <form  action="proLogin" method="post" style="width: 240px; margin: auto; display: flex; justify-content: center;    flex-direction: column;">

        <label for="professionId"></label>아이디
        <input type="text" name="professionId" id="professionId" value="">

        <label for="professionPw" style="margin-top: 20px;"></label>비밀번호
        <input type="password" name="professionPw" id="professionPw" value="">

		<div style="    display: flex; align-items: center;  justify-content: space-between;">
       		<button style="margin-top: 20px;">로그인</button>
        	<button type="button" style="margin-top: 20px;" onclick="location.href='${contextPath}/adminPro/proRegister'"> 회원가입</button>
        </div>
    </form>

</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>




