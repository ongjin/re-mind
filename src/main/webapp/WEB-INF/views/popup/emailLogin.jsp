<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<div id="email_login_area">
	<div class="top_title_wrap">
		<h2 class="title">이메일 로그인</h2>
	</div>
	<form method="POST" action="${contextPath}/emailLogin/emailLogin">
		<div class="email_login_box">
			<div class="input_wrap">
				<div class="input_div">
					<div>이메일</div>
					<input type="text" class="login_input" name="memberId" value="">
				</div>
				<div class="input_div">
					<div>비밀번호</div>
					<input type="password" class="login_input" name="memberPw" value="">
				</div>
			</div>
			<div class="submit_area">
				<button type="submit" class="login_btn">이메일로 로그인</button>
			</div>

			<div class="sign_up_wrap">
				<a href="javascript:layerPopup('signUp');">회원가입</a>
				<a href="${contextPath}/adminPro/">상담사 로그인</a>
			</div>
		</div>
	</form>
</div>
