<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/my/myBoardList.css">
<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
    <div class="board-page">게시글 내역</div>
    <div class="div-btn-info">
        <div class="db-line"></div>
        <div class="div-btn" id="select_myBoardList">내가 쓴 게시글</div>
        <div class="div-btn" id="select_myReplyList" <%--onclick="selectMyReplyList()"--%>>내가 쓴 댓글</div>
        <div class="div-btn" id="select_myScrapList">스크랩 한 글</div>
        <div class="div-btn" id="select_myEmpathyList">공감 한 글</div>
    </div>
    <!-- <hr> -->

    <table>
        <thead>
        <tr>
            <th class="thead-th">글번호</th>
            <th class="thead-th">카테고리</th>
            <th class="thead-th">작성일</th>
            <th class="thead-th">조회수</th>
        </tr>
        </thead>
        <tbody>
<%--            <c:choose>--%>

<%--                <c:when test="${empty myBoardList && empty selectMyReplyList}">--%>
<%--                    &lt;%&ndash; 조회된 게시글 목록이 없을 때 &ndash;%&gt;--%>
<%--                    <tr>--%>
<%--                        <td colspan="4">게시글이 존재하지 않습니다.</td>--%>
<%--                    </tr>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <c:forEach items="${myBoardList}" var="myBoard">--%>
<%--                        &lt;%&ndash; 조회된 게시글 목록이 있을 때 &ndash;%&gt;--%>
<%--                        <tr class="board-view">--%>
<%--                            <td>${myBoard.boardNo}</td>--%>
<%--                            <td>${myBoard.boardTitle}--%>
<%--                                    &lt;%&ndash; <a href="${contextPath}/mind/board/view/${myBoard.boardNo}">&ndash;%&gt;--%>
<%--                                    &lt;%&ndash; 상제조회 페이지 완성시 &ndash;%&gt;--%>
<%--                            </td>--%>
<%--                            <td>${myBoard.createDate}</td>--%>
<%--                            <td>${myBoard.readCount}</td>--%>
<%--                        </tr>--%>
<%--                    </c:forEach>--%>
<%--                </c:otherwise>--%>

<%--            </c:choose>--%>

        </tbody>
    </table>

    <div class="board-info">
        <%-- <div>너무 힘들어요...</div>    제목 --%>
        <%-- <div>덕구 2021.01.14 조회 100</div> 닉네임 작성일 조회 수 --%>
        <%-- <div>자유게시판</div>     게시판 카테고리 명 --%>
            <c:choose>
                <c:when test="${empty myBoardList}">
                    <%-- 조회된 게시글 목록이 없을 때 --%>
                    <div>조회된 목록이 없습니다.</div>
                </c:when>
                <c:otherwise>
                    <c:forEach items="${myBoardList}" var="myBoard">
                        <%-- 조회된 게시글 목록이 있을 때 --%>
                        <div class="board-list">
                            <div class="div-img">
                             <img src="data:image/jpeg;base64,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">
<%--                                <img src="../../../resources/images/profile1.png"/>--%>
                            </div>
                            <div class="board-content">
                                  <div>${myBoard.boardTitle}
<%--                                    <a href="${contextPath}/mind/board/view/${myBoard.boardNo}">--%>
                                      <%-- 상제조회 페이지 완성시 --%>
                                  </div>
                                  <div>${myBoard.memberFn} ${myBoard.createDate} 조회수  ${myBoard.readCount}</div>
                                  <div>${myBoard.boardCategoryName}</div>
                            </div>
                            <div class="opImg">
                                <img src="${contextPath}/resources/images/my/options.png">
                                <div>수정하기</div>
                                <div>삭제하기</div>
                            </div>
                        </div>
                        <hr>
                    </c:forEach>
                </c:otherwise>
            </c:choose>
            <%--<div class="opImg">
                <img src="${contextPath}/resources/images/my/options.png">
                <div>수정하기</div>
                <div>삭제하기</div>
            </div>--%>
        <%--<div class="board-list">
            <div class="div-img">
                <img src="data:image/jpeg;base64,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">
            </div>
            <div class="board-content">
                <div>너무 힘들어요...</div>
                <div>덕구 2021.01.14 조회 100</div>
                <div>자유게시판</div>
            </div>

            <div class="opImg">
                <img src="${contextPath}/resources/images/my/options.png">
                <div>수정하기</div>
                <div>삭제하기</div>
            </div>
        </div>
        <hr>--%>
    </div>


    <div id="pagination"></div>

</article>


<%--<div class="my-5">--%>
<%--    <ul class="pagination">--%>

<%--        <c:if test="${pagination.startPage != 1 }">--%>
<%--            <li><a class="page-link" href="myBoardList?cp=1${c}${s}">&lt;&lt;</a></li>--%>
<%--            <li><a class="page-link"--%>
<%--                   href="myBoardList?cp=${pagination.prevPage}${s}">&lt;</a></li>--%>
<%--        </c:if>--%>

<%--        &lt;%&ndash; 페이지네이션 번호 목록 &ndash;%&gt;--%>
<%--        <c:forEach begin="${pagination.startPage}"--%>
<%--                   end="${pagination.endPage}" step="1" var="i">--%>
<%--            <c:choose>--%>
<%--                <c:when test="${i == pagination.currentPage}">--%>
<%--                    <li><a class="page-link"--%>
<%--                           style="color: black; font-weight: bold;">${i}</a></li>--%>
<%--                </c:when>--%>

<%--                <c:otherwise>--%>
<%--                    <li><a class="page-link" href="myBoardList?cp=${i}${c}${s}">${i}</a></li>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
<%--        </c:forEach>--%>

<%--        <c:if test="${pagination.endPage != pagination.maxPage }">--%>
<%--            <li><a class="page-link"--%>
<%--                   href="myBoardList?cp=${pagination.nextPage}${c}${s}">&gt;</a></li>--%>
<%--            <li><a class="page-link"--%>
<%--                   href="myBoardList?cp=${pagination.maxPage }${s}">&gt;&gt;</a></li>--%>
<%--        </c:if>--%>
<%--    </ul>--%>
<%--</div>--%>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script>
    <!-- 세션에 올라가있는 loinMember -->
    const memberNo = ${loginMember.memberNo};

</script>
<script src="${contextPath}/resources/js/my/myBoardList.js"></script>
