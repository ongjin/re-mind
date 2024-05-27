<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/>
    <link rel="stylesheet" href="#">
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/generalManager/gmHeader.css">
    <title></title>
</head>

<body>
<main>
    <h3 style="text-align: center; margin-top: 30px; font-size: 24px; font-weight: bold;" class="dark-brown">관리자 페이지</h3>
    <article class="dark-brown admin" style="margin: 30px 20px 0 0; float: left;">
        <ul>
            <li><a href="${contextPath}/generalManager/gm/member" class="underLine">회원 정보</a></li>
            <li><a href="${contextPath}/generalManager/gm/profession">전문가 정보</a></li>
            <li><a href="#">저것</a></li>
            <li><a href="#">있을</a></li>
            <li><a href="#">겁니다</a></li>
        </ul>
    </article>
</main>




