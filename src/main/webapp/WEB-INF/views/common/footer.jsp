<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

        </section>
    <!-- 메인 -->
    </main>

    <footer>
    <!-- 푸터 -->
    <section class="footer_wrap">
        <article>
            <p>Copyright © KH Information Educational Institute A-Class</p>
            <p>
		    <a href="http://jigsaw.w3.org/css-validator/check/referer">
		        <img style="border:0;width:88px;height:31px"
		            src="http://jigsaw.w3.org/css-validator/images/vcss"
		            alt="올바른 CSS입니다!" />
		    </a>
</p>
     
        </article>
    </section>
    </footer>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>

    <!-- Swiper JS -->
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

    <script>
        <!-- 전역 변수 -->
        const contextPath = "${contextPath}";
    </script>
    <script src="${contextPath}/resources/js/common/common.js"></script>
    <script src="${contextPath}/resources/js/common/main.js"></script>

    <script src="${contextPath}/resources/js/google/googleAPI.js"></script>


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


</body>
</html>
