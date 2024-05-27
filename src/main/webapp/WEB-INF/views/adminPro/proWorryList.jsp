<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.4/datatables.min.css"/>

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main>
	<h1>고민게시판 목록</h1>
	
	<table id="table_id" class="display">
           <thead>
               <tr>
                   <th>게시판 번호</th>
                   <th>제목</th>
                   <th>고민 카테고리</th>
                   <th>작성일</th>
               </tr>
           </thead>
           <tbody>
           </tbody>
       </table>
</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>
 
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.11.4/datatables.min.js"></script>

<script type="text/javascript">
// var lang_kor = {
//         "decimal" : "",
//         "emptyTable" : "데이터가 없습니다.",
//         "info" : "_START_ - _END_ (총 _TOTAL_ 개)",
//         "infoEmpty" : "0개",
//         "infoFiltered" : "(전체 _MAX_ 개 중 검색결과)",
//         "infoPostFix" : "",
//         "thousands" : ",",
//         "lengthMenu" : "_MENU_ 개씩 보기",
//         "loadingRecords" : "로딩중...",
//         "processing" : "처리중...",
//         "search" : "검색 : ",
//         "zeroRecords" : "검색된 데이터가 없습니다.",
//         "paginate" : {
//             "first" : "첫 페이지",
//             "last" : "마지막 페이지",
//             "next" : "다음",
//             "previous" : "이전"
//         },
//         "aria" : {
//             "sortAscending" : " :  오름차순 정렬",
//             "sortDescending" : " :  내림차순 정렬"
//         }
//     };


$(function () {
	   createTable();
	})

function createTable(){
	$.ajax({
        url: "proWorryList",
        type: "POST",
         dataType : "json",
         success: function (data) {
             $('#table_id').DataTable({
                data: data,
                 columns: [
                     { data: "boardNo"},
                     { data: "boardTitle" },
                     { data: "worryCategoryName" },
                    { data: "createDate"},
                 ],
                 language: {
                     zeroRecords: "결과값이 없습니다."
                 }
             })
         }
     })
}

</script>




