<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/my/muteMember.css">
<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
    <div class="mute-page">차단한 회원</div>


    <div class="mute-info">
        <table style="width: 100%;">
            <c:forEach items="${mList}" var="muteMember">
                <tr class="mute-tr">
                    <td class="mute-img">
                        <c:choose>
                            <c:when test="${empty muteMember.imageName}">
                                <img class="profile" src="${contextPath}/resources/images/basicProfile.png">
                            </c:when>
                            <c:otherwise>
                                <img class="profile" src="${contextPath}${muteMember.imagePath}${muteMember.imageName}">
                            </c:otherwise>
                        </c:choose>
                        </td>
                    <td class="mute-td">${muteMember.memberFName}</td>
                    <td><button class="mute-delete" id="${muteMember.muteNo}">해제</button></td>
                </tr>
            </c:forEach>
        </table>

    </div>

</article>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="${contextPath}/resources/js/my/muteMember.js"></script>