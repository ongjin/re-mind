<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- 구글 로그인 API  -->
<%--<meta name="google-signin-scope" content="profile email openid ">--%>
<meta name ="google-signin-client_id" content="251812285867-iarbblabr07shf2kvjjmuaoa3tuv6n8r.apps.googleusercontent.com">
<%-- 구글 api 사용을 위한 라이브러리 --%>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>



<div id="login_area">
	<div class="top_title_wrap">
		<h2 class="title">로그인</h2>
	</div>

	<div class="login_box">
		<div class="login_method">

			<%--         <a href="javascript:kakaoLogin();">카카오 로그인</a>--%>
<%--			<a href="javascript:kakaoLogin();">카카오 로그인</a>--%>
			<a href="javascript:naverLogin();">네이버 로그인</a>
<%--			<a href="javascript:googleLogin();">구글 로그인</a>--%>
			<a href="#" class="emailLogin">이메일 로그인</a>
		</div>
		<div class="sign_up_wrap">
			<span>아직 계정이 없으신가요?</span>
			<a href="javascript:layerPopup('signUp');">회원가입</a>
		</div>
	</div>
</div>

<script>
	function naverLogin(){
		$.ajax({
			url:contextPath+"/social/naverlogin",
			data:{"naver": "naver"},
		}).done(function (res){
			window.location.replace(res);
		});
	}
	function kakaoLogin(){
		$.ajax({
			url:contextPath+"/social/kakaoLogin",
			data:{"kakao": "kakao"},
		}).done(function (res){
			window.location.replace(res);
		});
	}
	function  googleLogin(){
		$.ajax({
			url:contextPath+"/social/googleLogin",
			data:{"google": "google"},
		}).done(function (res){
			window.location.replace(res);
		});
	}

	// 구글 로그인
	if (document.getElementById("googleLoginBtn") != null) {
		document.getElementById("googleLoginBtn").addEventListener("click", function (){
			//구글서버로 인증코드 발급 요청
			window.location.replace("https://accounts.google.com/o/oauth2/v2/auth?"+
				"client_id=251812285867-iarbblabr07shf2kvjjmuaoa3tuv6n8r.apps.googleusercontent.com&"+
				"redirect_uri=http://localhost:9000/mind/oauth_kakao/googleLogin&"+
				"response_type=code&"+
				"scope=email%20profile%20openid&"+
				"access_type=offline");
		});
	}

	// 이메일 로그인
	if (document.querySelector(".emailLogin") != null) {
		document.querySelector(".emailLogin").addEventListener("click", () => {
			layerPopup("emailLogin");
		});
	}

</script>
<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
