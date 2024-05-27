<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마음연구소 re:mind - 상담사 페이지</title>

    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/proPage/proPage.css">
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/${css}.css">


    <!-- 글꼴 -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap" rel="stylesheet">


    <!-- 아이콘 -->
    <script src="https://kit.fontawesome.com/5e0a99db98.js" crossorigin="anonymous"></script>

</head>
<body>
	<header>
	    <!-- 헤더 -->
	    <section class="header_wrap" style="  display: flex; align-items: center;">
	        <article class="header_logo_wrap">
	        	<a href="${contextPath}">
	            	<img src="${contextPath}/resources/images/remind_logo.png" alt="">
	            </a>
	        </article>
	
	
	        <!-- 헤더 메뉴 -->
	        <article class="header_menu_wrap">
	            <ul class="dep1">
	
	                
	                    <c:choose>
	                        <c:when test="${empty sessionScope.loginPro}">
	                        <li >
	                            <a href="${contextPath}/adminPro/" class="login_btn" style="">로그인</a>
	                        </li>
	                        </c:when>
	                        <c:otherwise>
	                        <li style="bottom: 27px;">
	                            ${sessionScope.loginPro.professionName}님<br>
	                            <a href="${contextPath}/adminPro/logout" class="logout_btn" style="margin-top: 10px;">로그아웃</a>
	                         </li>
	                        </c:otherwise>
	                    </c:choose>
	            </ul>
	        </article>
	    </section>
	</header>

	<main style="display: flex;">
	    <section class="main_wrap" style="width: 20%;">
	        <!-- 사이드 메뉴가 없는 부분은 지우고 사용 -->
		     <c:if test="${!empty sessionScope.loginPro}">
		         <section class="dark-brown side_menu">
		             <ul class="side_menu_dep1">
		                 <li class="w_side_menu"><a href="${contextPath}/adminPro/AdminProProfile/${loginPro.professionNo}">상담사 프로필</a></li>
		                 <li class="w_side_menu"><a href="${contextPath}/adminPro/proReservation">예약내역 조회</a> </li>
		                 <li class="w_side_menu"><a href="${contextPath}/adminPro/proWorryList">고민상담 게시판</a></li>
		                 
	                </ul>
		         </section>
	         </c:if>
		</section>
		