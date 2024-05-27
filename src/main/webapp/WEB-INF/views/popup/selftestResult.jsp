<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

 <link rel="stylesheet" href="${contextPath}/resources/css/selftestResult.css">

        <div class="selftest_modal">
            <div class="selftest_modal_title">
            </div>
            <div class="selftest_modal_content">
            </div>
            <button id="selfTest_btn">확인</button>
        </div>
<script>
    $(".selftest_modal_title").text(titleHtml);
    $(".selftest_modal_content").html(resultHtml);

    $("#selfTest_btn").on("click", function () {
        // 모달 close
        modal.style.display = "none";
        popupWrap.style.display = "none";

        // 팝업 내용 지우기
        layerPopupContent.innerHTML = "";

        window.location.reload();
    });

</script>
