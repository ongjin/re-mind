<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.11.4/datatables.min.css"/>

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main>
    <h1>상담사 예약 목록</h1>


    <table id="table_id" class="display">
        <thead>
        <tr>
            <th>예약번호</th>
            <th>예약자 성명</th>
            <th>예약상태</th>
            <th>예약날짜</th>
            <th>예약시간</th>
            <th>예약구분</th>
        </tr>
        </thead>
        <tbody style="text-align:center;">
        </tbody>
    </table>
</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>

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

    const today = new Date();

    $(function () {
        createTable();
    })

    function createTable() {
        $.ajax({
            url: "reservationList",
            type: "GET",
            success: function (data) {
                $('#table_id').DataTable({
                    language: lang_kor,
                    data: data,
                    columns: [
                        { data: "reservationNo"},
                        { data: null,
                        	render: function(data){
                        		
                        		return '<a href="reservationDetail/'+ data.memberNo +'">'+data.memberName+'</a>';
                        	}
                        },
                        { data: null,
                            render: function(data){
                            	
                            	let book = '';
                            	const statusCode = data.reservationStatusCode; 
                            	 // 1:예약신청, 2:예약결정, 3:예약취소, 4:상담완료
                            	 
                            	 switch(statusCode){
                            	 	case 1 : book ='예약신청'; break;
                            	 	case 2 : book ='예약결정'; break;
                            	 	case 3 : book ='예약취소'; break;
                            	 	case 4 : book ='상담완료'; break;
                            	 	default : book ='에러'; break;
                            	 }
                            	console.log(book)
                            	console.log(statusCode)
                            	
                                return book;
                            }
                        },
                        { data: null,
                            render : function(data){
                                var d = new Date(data.reservationEnrollDate),

                                    month = '' + (d.getMonth() + 1) ,
                                    day = '' + d.getDate(),
                                    year = d.getFullYear();

                                if (month.length < 2) month = '0' + month;
                                if (day.length < 2) day = '0' + day;

                                return [year, month, day].join('-');
                            }},
                        { data: null,
                            render: function(data){
                                return data.reservationEnrollTime + ":00";
                            }},
                        { data: null,
                            render : function (data) {

                                let btn = data.counselCategoryNm;

                                const dataReservationEnrollDate = dateFormat(new Date(data.reservationEnrollDate));

                                if (dateFormat(today) == dataReservationEnrollDate && data.counselCategoryNo == 1) {
                                    console.log("start");
                                    if (today.getHours() >= (data.reservationEnrollTime - 1) && today.getHours() < (Number)(data.reservationEnrollTime + 2)) {
                                        console.log("second");
                                        btn = '<button type="button" onclick="inputChat(' + data.reservationNo + ')">입장하기</button>';
                                    }
                                }

                                return btn;
                            }
                        }

                    ]
                })
            }
        })
    }

    // 채팅 입장
    function inputChat(reservationNo) {
        location.href = contextPath + "/adminPro/chat/room/" + reservationNo;
    }

</script>




