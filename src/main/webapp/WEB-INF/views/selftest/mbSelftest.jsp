<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

    <article class="mb-selftest-top">
        <div class="mb-selftest-q">
            <span>01</span>
            <span></span>
            <span>총 10문항</span>
        </div>
        <div class="mb-selftest-q-content">  
            나는 내가 적어도 다른 사람만큼은 
            가치있는 사람이라고 느낀다.
        </div>
    </article>
    <article class="mb-selftest-bottom">
        <div class="mb-selftest-a">
            <div id="1" class="selfTest-result">대체로 그렇지 않다</div>
            <div id="2" class="selfTest-result">보통이다</div>
            <div id="3" class="selfTest-result">대체로 그렇다</div>
            <div id="4" class="selfTest-result">항상 그렇다</div>
        </div>
        <!-- 버튼 -->
        <div class="selfTest-btn">
            <button class="selfTest-prev-btn selfTestBtn">이전</button>
            <button class="selfTest-next-btn selfTestBtn">다음</button>
        </div>
    </article>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>

<script src="${contextPath}/resources/js/selftest/selftest.js"></script>
