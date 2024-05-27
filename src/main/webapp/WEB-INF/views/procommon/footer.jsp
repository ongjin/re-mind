<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />


    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- sweetealert : 경고창 api -->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <%-- request scope에 "title"이라는 키 값이 존재하는 경우 --%>
    <c:if test="${!empty requestScope.title}">
        <script>
            swal({
                title : "${title}",
                text  : "${text}",
                icon  : "${icon}"
            });
        </script>
    </c:if>
 

    <script>
        // 전역 변수
        const contextPath = "${contextPath}";
    </script>
	<script src="${contextPath}/resources/js/adminPro/adminPro.js"></script>


</body>
</html>
