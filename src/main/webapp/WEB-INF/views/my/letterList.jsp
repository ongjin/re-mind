<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/my/letterList.css">

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.4/datatables.min.css"/>
<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
    <div class="message-page">쪽지</div>
    <hr>

    <table id="table_id" class="display">
        <thead>
            <tr>
                <th class="thead-th">보낸사람</th>
                <th class="thead-th">내용</th>
                <th class="thead-th">날짜</th>
            </tr>
        </thead>
        <tbody>
<%--            <tr class="message-view">--%>
<%--                <td>이덕희</td>--%>
<%--                <td>안녕하세요</td>--%>
<%--                <td>2022.01.01</td>--%>
<%--            </tr>--%>
<%--            <tr class="message-view">--%>
<%--                <td>관리자</td>--%>
<%--                <td>안녕하세요. 가입을 축하드립니다.</td>--%>
<%--                <td>2021.11.21</td>--%>
<%--            </tr>--%>
<%--            <tr class="message-view">--%>
<%--                <td>user01</td>--%>
<%--                <td>안녕하세요 반가워요 반가워요 반가워요 반가워요</td>--%>
<%--                <td>2021.05.17</td>--%>
<%--            </tr>--%>
        </tbody>
    </table>


    <div class="message-info">
        <div class="message-list">
            <div class="message-btn">
                <div style="width: 90%;">이덕희 상담사님</div>
                <button style="float: right;">삭제</button>
            </div>
            <div>2022.01.22</div>
            <div>안녕하세요. 상담 신청해주셔서 감사합니다~</div>
            <hr>
        </div>

        <div class="message-list">
            <div class="message-btn">
                <div style="width: 90%;">이덕희 상담사님</div>
                <button style="float: right;">삭제</button>
            </div>
            <div>2022.01.22</div>
            <div>안녕하세요. 상담 신청해주셔서 감사합니다~</div>
            <hr>
        </div>

        <div class="message-list">
            <div class="message-btn">
                <div style="width: 90%;">이덕희 상담사님</div>
                <button style="float: right;">삭제</button>
            </div>
            <div>2022.01.22</div>
            <div>안녕하세요. 상담 신청해주셔서 감사합니다~</div>
            <hr>
        </div>
    </div>

</article>




<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>


<script src="${contextPath}/resources/js/my/letterList.js"></script>

<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.4/datatables.min.js"></script>

<script type="text/javascript">
    var lang_kor = {
        "decimal" : "",
        "emptyTable" : "데이터가 없습니다.",
        "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
        "infoEmpty" : "0개",
        "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
        "infoPostFix" : "",
        "thousands" : ",",
        "lengthMenu" : "_MENU_ 개씩 보기",
        "loadingRecords" : "로딩중...",
        "processing" : "처리중...",
        "search" : "검색 : ",
        "zeroRecords" : "검색된 데이터가 없습니다.",
        "paginate" : {
            "first" : "첫 페이지",
            "last" : "마지막 페이지",
            "next" : "다음",
            "previous" : "이전"
        },
        "aria" : {
            "sortAscending" : " :  오름차순 정렬",
            "sortDescending" : " :  내림차순 정렬"
        }
    };
    $(function () {
        createTable();
    })

    function createTable() {

        $.ajax({
            url: "myLetterList",
            type: "GET",
            success: function (data) {
                console.log(data);
                $('#table_id').DataTable({
                    language: lang_kor,
                    data: data,
                    columns: [
                        {data: "professionName"},
                        {data: "letterContent"},
                        {data: "letterDate"}
                    ]
                })
            }
        });
    }

</script>
