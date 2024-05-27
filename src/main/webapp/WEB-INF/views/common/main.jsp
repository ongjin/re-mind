<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!-- header include -->
<jsp:include page="header.jsp"></jsp:include>
<!-- 메인 배너 -->
<article class="main_banner">
    <div>
        <p class="main_banner_p1">마음 속 이야기를 들어주는</p>
        <p class="main_banner_p2 animate__backInDown">RE:MIND</p>
        <button class="main_banner_btn" type="button" onclick="location.href='${contextPath}/pro/proList';">
            상담 예약
        </button>
    </div>
</article>

<!-- 메인 컨텐트1 -->
<article class="main_content1">
    <p>나의 상태가 궁금하다면 ?</p>
    <div>
        <p>무료 자가진단</p>
    </div>
    <div>
        <div>
            <div class="main_content1_cir" data-type="1">
                <img alt="" src="${contextPath}/resources/images/main/depression.png">
            </div>
            <p>우울증</p>
        </div>
        <div>
            <div class="main_content1_cir" data-type="2">
                <img alt="" src="${contextPath}/resources/images/main/Anxiety.png">
            </div>
            <p>불안장애</p>
        </div>
        <div>
            <div class="main_content1_cir" data-type="5">
                <img alt="" src="${contextPath}/resources/images/main/stress.png">
            </div>
            <p>스트레스</p>
        </div>
        <div>
            <div class="main_content1_cir" data-type="6">
                <img alt="" src="${contextPath}/resources/images/main/panic.png">
            </div>
            <p>자존감</p>
        </div>
        <div>
            <div class="main_content1_cir" data-type="3">
                <img alt="" src="${contextPath}/resources/images/main/bulimia.png">
            </div>
            <p>폭식증</p>
        </div>
        <div>
            <div class="main_content1_cir" data-type="4">
                <img alt="" src="${contextPath}/resources/images/main/Alcoholism.png">
            </div>
            <p>알콜중독</p>
        </div>
    </div>
</article>

<!-- 메인 컨텐트2 -->
<article class="main_content2">
    <div class="main_content2_bc"></div>
    <div class="main_content2_content">
        <div>
            <p>자신의 이야기를 들려주세요.</p>
            <div>
                <p>커뮤니티</p>
            </div>
        </div>
        <div>
            <c:forEach items="${listBoard}" var="board">
                <div class="main_content2_content_board" data-category_code="${board.boardCategoryCode}"
                     data-board_no="${board.boardNo}">
                        <%--<button>#우울증</button>--%>
                    <button type="button"
                            onclick="locationPath(${board.boardCategoryCode}, ${board.boardNo})">${board.boardCategoryName}</button>
                        <%--<p>${board.boardTitle}</p>--%>
                    <p>${board.boardContent}</p>
                </div>
            </c:forEach>
        </div>
    </div>
</article>

<!-- 모바일 메인 컨텐트2 -->
<article class="mb_main_content2">
    <div class="main_content2_bc"></div>
    <div class="mb_main_content2_content">
        <div>
            <p>자신의 이야기를 들려주세요.</p>
            <div>
                <p>커뮤니티</p>
            </div>
        </div>
        <!-- Swiper -->
        <div class="swiper1 mySwiper1">
            <div class="swiper-wrapper"
                 style="justify-content: space-between; left:calc(50% - 140px); overflow: hidden;">
                <c:forEach items="${listBoard}" var="board">
                    <div class="swiper-slide">
                        <div class="mb_main_content2_content_board">
                            <button type="button"
                                    onclick="locationPath(${board.boardCategoryCode}, ${board.boardNo})">${board.boardCategoryName}</button>
                            <p>${board.boardContent}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</article>

<!-- 메인 컨텐트 3 -->
<article class="main_content3">
    <p>나에게 딱 맞는 전문가</p>
    <p>무료 상담으로 자신에게 맞는 전문가를 찾아보세요</p>
    <%--${profession}--%>
    <c:forEach items="${profession}" var="profession" begin="1" end="1">
        <div>
            <div>
                <span>${profession.professionName}</span>
                <p>당신의 삶은 누가 통제합니까?</p>
                <p>누구든지 자신의 삶의 빛을 스스로 찾을 수 있습니다.</p>
                <span>#우울증</span> <span>#스트레스</span> <span>#가족/인간관계</span>
                <div>
                    <button onclick="window.location.href=contextPath + '/pro/proView/${profession.professionNo}'"><i
                            class="fas fa-phone-alt"></i> 전화상담
                    </button>
                    <button onclick="window.location.href=contextPath + '/pro/proView/${profession.professionNo}'"><i
                            class="fas fa-comments"></i> 실시간 채팅
                    </button>
                </div>
            </div>

            <!-- 이미지 영역 -->
            <div>
                <div style="background:url(${contextPath}${profession.imagePath}/${profession.imageName}) no-repeat center center; background-size: cover;"></div>
                <!-- <img src="http://dailymedi.com//wys2/file_attach/2020/02/02/1580643966-18.jpg"/>
                    백그라운드 이미지로 대체 ( 누끼를 딴 규격에 맞는 프로필 사진을 참조)
                -->
            </div>
        </div>
    </c:forEach>
</article>

<!-- 모바일 메인 컨텐트 3 -->
<article class="mb_main_content3">
    <p>나에게 딱 맞는 전문가</p>

    <!-- Swiper -->
    <div class="swiper2 mySwiper2" style="overflow: hidden;">
        <div class="swiper-wrapper">
            <%-- 프로필 시작--%>
            <c:forEach items="${profession}" var="profession" begin="1" end="3">
                <div class="swiper-slide profile">
                    <div class="mb_main_profile">
                        <!-- 이미지 영역 -->
                        <div class="mb_main_profile_img">
                            <div style="background:url(${contextPath}${profession.imagePath}/${profession.imageName}) no-repeat center center; background-size: cover;"></div>
                        </div>
                        <div class="mb_main_profile_content">
                            <span>${profession.professionName}</span>
                            <p>당신의 삶은 누가 통제합니까?</p>
                            <p>누구든지 자신의 삶의 빛을 스스로 찾을 수 있습니다.</p>
                            <span>#우울증</span> <span>#스트레스</span> <span>#가족/인간관계</span>
                            <div>
                                <button onclick="window.location.href=contextPath + '/pro/proView/${profession.professionNo}'">
                                    <i class="fas fa-phone-alt"></i> 전화상담
                                </button>
                                <button onclick="window.location.href=contextPath + '/pro/proView/${profession.professionNo}'">
                                    <i class="fas fa-comments"></i> 실시간 채팅
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            <%-- 프로필 끝--%>

        </div>
        <div class="swiper-button-next" style="top:1750px; color: #E5D4C5; width: 30px;"></div>
        <div class="swiper-button-prev" style="top: 1750px; color: #E5D4C5; width: 30px;"></div>
        <!-- <div class="swiper-pagination" style="top: 3080px;"></div> -->
        <!-- 슬라이드 페이지네이션 -->
    </div>


</article>

<article class="main_content4">
    <div class="main_content4_bc"></div>
    <div class="main_content4_content">

        <c:forEach items="${noticeList}" var="notice" varStatus="status">
            <c:if test="${status.index == 0}">
                <div class="main_content4_content_left">
                <div>새소식</div>
                <div>
            </c:if>

            <div class="main_content4_content_left_item" data-notice_no="${notice.noticeNo}">
                <div>
                    <span>${notice.noticeNo}</span>
                    <span>${notice.createDate}</span>
                </div>
                <div>
                    <p>
                            ${notice.noticeTitle}
                            <%--                                    지역사회서비스 제공 기관 / 바우처 서비스--%>
                    </p>
                </div>
            </div>
            <c:if test="${status.index == 2}">
                </div>
                </div>
                <div class="main_content4_content_left">
                <div>새소식</div>
                <div>
            </c:if>
            <c:if test="${status.last}">
                </div>
                </div>
            </c:if>
        </c:forEach>
        <div>
            <div class="main_content4_content_postit">
                <div>이달의 연구</div>
                <div>잊고 있었던 가치나 자신에 대한 생각을 해볼 수 있도록
                    스스로를 돌아보는 질문에 답변을 해보세요.
                </div>
            </div>
        </div>

        <%--        <div class="main_content4_content_left">
                    <div>새소식</div>
                    <div>
                        <div class="main_content4_content_left_item">
                            <div>
                                <span>23</span>
                                <span>2022.01</span>
                            </div>
                            <div>
                                <p>
                                    지역사회서비스 제공 기관 / 바우처 서비스
                                </p>
                            </div>
                        </div>

                        <div class="main_content4_content_left_item">
                            <div>
                                <span>23</span>
                                <span>2022.01</span>
                            </div>
                            <div>
                                <p>
                                    지역사회서비스 제공 기관 / 바우처 서비스
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="main_content4_content_left">
                    <div>새소식</div>
                    <div>
                        <div class="main_content4_content_left_item">
                            <div>
                                <span>23</span>
                                <span>2022.01</span>
                            </div>
                            <div>
                                <p>
                                    지역사회서비스 제공 기관 / 바우처 서비스
                                </p>
                            </div>
                        </div>

                        <div class="main_content4_content_left_item">
                            <div>
                                <span>23</span>
                                <span>2022.01</span>
                            </div>
                            <div>
                                <p>
                                    지역사회서비스 제공 기관 / 바우처 서비스
                                </p>
                            </div>
                        </div>

                        <div class="main_content4_content_left_item">
                            <div>
                                <span>23</span>
                                <span>2022.01</span>
                            </div>
                            <div>
                                <p>
                                    지역사회서비스 제공 기관 / 바우처 서비스
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <div class="main_content4_content_postit">
                        <div>마인드 포스트잇</div>
                        <div>잊고 있었던 가치나 자신에 대한 생각을 해볼 수 있도록
                            스스로를 돌아보는 질문에 답변을 해보세요.
                        </div>
                    </div>
                </div>--%>
    </div>
</article>

<!-- 모바일 화면 메인 컨텐트4 -->
<article class="mb_main_content4">
    <div class="mb_main_content4_content">
        <c:forEach items="${noticeList}" var="notice" varStatus="status">
        <c:if test="${status.index == 0}">
    	    <div class="mb_main_content4_content_left">
            <div>새소식</div>
       	</c:if>
	            <div>
	                <div class="mb_main_content4_content_left_item">
	                    <div>
	                        <span>${notice.noticeNo}</span>
	                        <span>${notice.createDate}</span>
	                    </div>
	                    <div>
	                        <p>
	                            ${notice.noticeTitle}
	                        </p>
	                    </div>
	                </div>
	
            	</div>
        </c:forEach>
 	</div>
        <div>
            <div class="mb_main_content4_content_postit2">
                <div>이달의 연구</div>
                <div>잊고 있었던 가치나 자신에 대한 생각을 해볼 수 있도록
                    스스로를 돌아보는 질문에 답변을 해보세요.
                </div>
            </div>
        </div>
    </div>
</article>


<!-- footer include -->
<jsp:include page="footer.jsp"></jsp:include>
