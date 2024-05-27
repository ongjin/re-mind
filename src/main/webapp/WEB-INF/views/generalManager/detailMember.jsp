<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.css"/>
    <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
    <script src="https://cdn.datatables.net/t/bs-3.3.6/jqc-1.12.0,dt-1.10.11/datatables.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/generalManager/gmHeader.css">
    <title></title>
</head>

<body>
<main>
    <h3 style="text-align: center; margin-top: 30px; font-size: 24px; font-weight: bold;" class="dark-brown">회원 상세</h3>

    <div style="margin-top: 30px; border: 1px solid #ccc; padding: 20px;">
        <div style="text-align: center;">
            <c:choose>
                <c:when test="${member.imagePath == null}">
                    <img src="${contextPath}/resources/images/basicProfile.png" width="9%" height="9%">
                </c:when>
                <c:otherwise>
                    <img src="${contextPath}/${member.imagePath}${member.imageName}" width="9%" height="9%">
                </c:otherwise>
            </c:choose>
        </div>
        <div>
            <div class="divTable">
                <span class="firstSpan">가입 일자</span>
                <span class="secondSpan">${member.memberDate}</span>
            </div>
            <div class="divTable">
                <span class="firstSpan">회원 상태</span>
                <c:choose>
                    <c:when test="${member.statusCode == 0}">
                        <span class="secondSpan">가입</span>
                    </c:when>
                    <c:when test="${member.statusCode == 1}">
                        <span class="secondSpan">탈퇴</span>
                    </c:when>
                    <c:otherwise>
                        <span class="secondSpan">정지</span>
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="divTable">
                <span class="firstSpan">회원 이름</span>
                <span class="secondSpan">${member.memberName}</span>
            </div>
            <div class="divTable">
                <span class="firstSpan">회원 닉네임</span>
                <span class="secondSpan">${member.memberFName}</span>
            </div>
            <div class="divTable">
                <span class="firstSpan">회원 이메일</span>
                <span class="secondSpan">${member.memberId}</span>
            </div>
            <div class="divTable">
                <span class="firstSpan">회원 성별</span>
                <span class="secondSpan">${member.memberGender}</span>
            </div>
            <div class="divTable">
                <span class="firstSpan">회원 전화번호</span>
                <span class="secondSpan">${member.memberPhone}</span>
            </div>
            <div class="divTable">
                <span class="firstSpan">회원 주소</span>
                <c:set var="item" value="${fn:split(member.memberAddress, ',,')}"/>
                <span class="secondSpan">
                    <c:forEach var="word" items="${item}">
                        ${word}
                    </c:forEach>
                </span>
            </div>
        </div>
    </div>
</main>

<script>

</script>
<jsp:include page="gmFooter.jsp"/>
