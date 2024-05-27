<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="self_banner">
  <div>누구나 마음 속에 수많은 고민들이 있습니다.</div>
  <div>도움이 필요할 땐 언제든지 마음연구소와 함께하세요!</div>
</article>
<article class="self_content">
  <div class="self_content_title">
    <div>나의 마음건강을 체크해보세요.</div>
    <div>심리 자가진단 테스트</div>
  </div>
  <form method="POST" class="self_content_form">
    <div class="self_content_option">
      <div class="self_content_option1">
        <div id="type_1" data-type="1" class="selfTest_op <c:if test="${type == '1'}">active</c:if>">우울증</div>
        <div id="type_2" data-type="2" class="selfTest_op <c:if test="${type == '2'}">active</c:if>">불안장애</div>
        <div id="type_3" data-type="3" class="selfTest_op <c:if test="${type == '3'}">active</c:if>">폭식증</div>
        <div id="type_4" data-type="4" class="selfTest_op <c:if test="${type == '4'}">active</c:if>">알코올의존</div>
        <div id="type_5" data-type="5" class="selfTest_op <c:if test="${type == '5'}">active</c:if>">스트레스</div>
      </div>
      <div class="self_content_option2">
        <div id="type_6" data-type="6" class="selfTest_op <c:if test="${type == '6'}">active</c:if>">자존감</div>
        <div id="type_7" data-type="7" class="selfTest_op <c:if test="${type == '7'}">active</c:if>">인터넷중독</div>
        <div style="color: rgb(0 0 0 / 0.5); cursor: no-drop;">추가준비중</div>
        <div style="color: rgb(0 0 0 / 0.5); cursor: no-drop;">추가준비중</div>
        <div style="color: rgb(0 0 0 / 0.5); cursor: no-drop;">추가준비중</div>
      </div>
    </div>
    <div class="selfTest"></div>
    <!-- 버튼 -->
    <div class="selfTest_btn">
      <button class="selfTest_prev_btn hidden" onclick="prev()" type="button">이전</button>
      <button id="selfTest_next_btn" class="selfTest_next_btn" onclick="next()" type="button">다음</button>
    </div>
    <button type="button" class="mb_selfTest_btn">테스트 진행</button>
  </form>
  <button type="button" class="hidden" id="selfTest_result_btn" onclick="resultScore()">테스트 결과</button>
</article>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
  let type = false;
  if ("${type}" != null) {
    type = "${type}";
  }

</script>

<script src="${contextPath}/resources/js/selftest/selftest.js"></script>
