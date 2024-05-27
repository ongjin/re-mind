<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<div id="letter_area">
    <div class="top_title_wrap">
        <h2 class="title">쪽지</h2>
    </div>
    <form action="">
        <div class="letter_box">
            <textarea style="resize: none"></textarea>
            <button>보내기</button>
        </div>
    </form>
</div>
