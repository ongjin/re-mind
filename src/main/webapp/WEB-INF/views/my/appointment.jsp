<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>


<article class="main_content">
	<div class="appointment">
		<div class="title">상담 예약 조회</div>
		<div class="select-area">
			<select class="reservation_select">
				<option value="0">전체</option>
				<option value="1">상담 예약</option>
				<option value="4">상담 완료</option>
				<option value="3">상담 취소</option>
			</select>
		</div>
		<div class="appointment_list">
			<ul>
			</ul>
		</div>
	</div>

</article>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
	const today = new Date();
	$(function () {
		// 상담 예약 조회
		reservationList(0);

		// 상담 예약 selectBox
		$(".reservation_select").on("change", function () {
			reservationList($(this).val());
		})

		/*const reservationCancel = document.querySelectorAll(".reservationCancel");
		for(let i =0; i< reservationCancel.length; i++) {
			reservationCancel[i].addEventListener("click", () => {
				const _this = $(this);
				if(confirm("예약 취소하시겠습니까?")) {

					$.ajax({
						url : "appointmentCancel",
						type : "POST",
						data : {
							"reservationNo" : _this.data("value")
						},
						success : function (result) {
							if (result == 1) {
								swal({title : "예약 취소 되었습니다.", icon  : "success"});

								const div = $("<div class='status_div'>");
								div.text("예약 취소");
								_this.parent().html(div);
							} else {
								swal({title : "취소할 수 없습니다.", icon  : "error"});
							}
						},
						error : function () {

						}
					});
				}
			});
		}*/
	});




	// 예약 취소
	// $(".reservationCancel").on("click", function () {
	// 	console.log("TEST");
	//
	// 	const _this = $(this);
	// 	if(confirm("예약 취소하시겠습니까?")) {
	//
	// 		$.ajax({
	// 			url : "appointmentCancel",
	// 			type : "POST",
	// 			data : {
	// 				"reservationNo" : _this.data("value")
	// 			},
	// 			success : function (result) {
	// 				if (result == 1) {
	// 					swal({title : "예약 취소 되었습니다.", icon  : "success"});
	//
	// 					const div = $("<div class='status_div'>");
	// 					div.text("예약 취소");
	// 					_this.parent().html(div);
	// 				} else {
	// 					swal({title : "취소할 수 없습니다.", icon  : "error"});
	// 				}
	// 			},
	// 			error : function () {
	//
	// 			}
	// 		});
	// 	}
	//
	// })



	// 상담 예약 조회
	function reservationList(reservationStatusCode) {
		$.ajax({
			url : contextPath + "/my/appointment",
			type : "POST",
			data : {"reservationStatusCode" : reservationStatusCode},
			dataType : "JSON",
			success : function (data) {
				ajaxDom(JSON.stringify(data));
			},
			error : function () {

			}
		})
	}

	// list dom
	function ajaxDom(data) {
		const appointListUl = $(".appointment_list > ul");
		appointListUl.empty();

		const theadLi = $("<li>");
		const theadDiv = [];

		for(let i=0; i<5; i++) {
			theadDiv[i] = $("<div>");
			switch(i) {
				case 0 : theadDiv[i].text("예약 날짜"); break;
				case 1 : theadDiv[i].text("예약 시간"); break;
				case 2 : theadDiv[i].text("상담사"); break;
				case 3 : theadDiv[i].text("상담 유형"); break;
				default : theadDiv[i].text("상태");

			}
			theadLi.append(theadDiv[i]);

		}
		appointListUl.append(theadLi);

		const reservationList = JSON.parse(data);
		if (reservationList.length > 0) {
			$.each(reservationList, function (key, value) {
				const tbodyLi = $("<li>");
				tbodyLi.data("test", "123123");

				const liDiv_1 = $("<div class='img_div'>");
				const tbodyImg = $("<img>");
				tbodyImg.attr("src", "${contextPath}/resources/images/sample1.jpg");
				liDiv_1.append(tbodyImg[key]);
				tbodyLi.append(liDiv_1);

				const liDiv_2 = $("<div class='date_div'>");
				liDiv_2.text(value.reservationEnrollDate);
				tbodyLi.append(liDiv_2);

				const liDiv_3 = $("<div class='time_div'>");
				liDiv_3.text(value.reservationEnrollTime + ":00");
				tbodyLi.append(liDiv_3);

				const liDiv_4 = $("<div class='profession_div' style='cursor:pointer;'>");
				liDiv_4.text(value.professionName);
				liDiv_4.attr("onclick", "inputProfession(" + value.professionNo + ")");
				tbodyLi.append(liDiv_4);

				const liDiv_5 = $("<div class='category_div'>");
				liDiv_5.text(value.counselCategoryNm);

				if (dateFormat(today) == value.reservationEnrollDate && value.counselCategoryNo == 1) {
					console.log(dateFormat(today) + " : " + value.reservationEnrollDate);
					console.log(today.getHours() + " : " + (value.reservationEnrollTime - 1) + " : " +  (Number)(value.reservationEnrollTime + 2));
					console.log("-----------------------------");
					if (today.getHours() >= (value.reservationEnrollTime - 1) && today.getHours() < (Number)(value.reservationEnrollTime + 2)) {
						liDiv_5.addClass("chatting");
						liDiv_5.text("입장하기");
						liDiv_5.attr("onclick", "inputChat(" + value.reservationNo + ")");
					}
				}
				tbodyLi.append(liDiv_5);

				const liDiv_6 = $("<div class='status_div'>");
				if (value.reservationStatusCode == 1) {
					// const tbodyButton = $("<button type='button' class='reservationCancel'>");
					const tbodyButton = $("<div class='reservationCancel' style='display:inline-block; cursor:pointer;'>");
					tbodyButton.data("value", value.reservationNo);
					tbodyButton.text("취소");

					liDiv_6.text("예약 | ");
					liDiv_6.append(tbodyButton);

				} else if (value.reservationStatusCode == 3) {
					liDiv_6.text("취소 완료");

				} else {
					liDiv_6.text("상담 완료");

				}
				tbodyLi.append(liDiv_6);
				appointListUl.append(tbodyLi);

			})

			const reservationCancel = document.querySelectorAll(".reservationCancel");
			for(let i =0; i< reservationCancel.length; i++) {
				reservationCancel[i].addEventListener("click", () => {
					const _this = $(reservationCancel[i]);
					if(confirm("예약 취소하시겠습니까?")) {

						$.ajax({
							url : "appointmentCancel",
							type : "POST",
							data : {
								"reservationNo" : _this.data("value")
							},
							success : function (result) {
								if (result == 1) {
									swal({title : "예약 취소 되었습니다.", icon  : "success"});

									const div = $("<div class='status_div'>");
									div.text("취소 완료");
									_this.parent().html(div);
								} else {
									swal({title : "취소할 수 없습니다.", icon  : "error"});
								}
							},
							error : function () {

							}
						});
					}
				});
			}
		} else {
			const noneData = $("<li>");
			noneData.css("width", "100%").css("text-align", "center");
			noneData.text("조회 목록이 없습니다.");
			appointListUl.append(noneData);
		}
	}


	// 상담사 상세
	function inputProfession(professionNo) {
		location.href = contextPath + "/pro/proView/" + professionNo;
	}

	// 채팅 입장
	function inputChat(reservationNo) {
		location.href = contextPath + "/chat/room/" + reservationNo;
	}


</script>


