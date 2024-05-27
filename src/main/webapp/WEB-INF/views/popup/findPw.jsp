<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<div id="find_password_area">
	<div class="top_title_wrap">
		<h2 class="title">비밀번호 찾기</h2>
	</div>
	<form action="">
		<div class="email_login_box">
			<div class="input_wrap">
				<div class="input_div">
					<div>이름</div>
					<input type="text" class="login_input">
				</div>
				<div class="input_div">
					<div>이메일</div>
					<input type="text" class="login_input">
				</div>
			</div>
			<div class="submit_area">
				<button type="button" class="login_btn">확인</button>
			</div>

			<div class="sign_up_wrap">
				<a href="#self">회원가입</a>
				<a href="#self">비밀번호 찾기</a>
			</div>
		</div>
	</form>
</div>
