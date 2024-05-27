<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content22">
    <div id="reservation_confirm_wrap" class="float-left">
        <div id="reservation_confirm">
            <div id="pro_profile_wrap" style="height: 125px;">
                <img src="${contextPath}${proImg.imagePath}/${proImg.imageName}" class="float-left" style="width:125px; height: 125px;border-radius:50%;">
                <div class="reservation_confirm_proname float-left">
                    <p style="font-size: 13px; font-weight: 500; color:#a59999">추천상담사</p>
                    <h1>${proImg.professionName}상담사</h1>
                </div>
            </div>

            <div id="tuition" class="clear-both box_style">
                <div class="pro_reservation">
                    <table class="pro_reservation_select">
                        <tr>
                            <th>테라피 선택</th>
                            <td>
                                <select class="select_box" id="therapy_select" >
                                    <option value="0">선택</option>
                                    <option value="1">텍스트테라피</option>
                                    <option value="2">페이스테라피</option>
                                    <option value="3">보이스테라피</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>횟수</th>
                            <td>
                                <select class="select_box" id="therapy_count">
                                    <option value="0">선택</option>
                                    <option value="1">1회</option>
                                    <option value="3">3회</option>
                                    <option value="5">5회</option>
                                    <option value="20">20회</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>

            <div id="tuition_date" class="box_style">
                <p class="tuition_font">첫번째 상담 날짜 선택 <span class="tuition_sub">*두번째 상담부터는 마이페이지에서 지정해 주세요.</span></p>
                <div style="text-align: center; font-width: bold; margin: 50px 0;">
                    <div id="calendar_left" onclick="beforeCalendar();">
                    <img src="${contextPath}/resources/images/pro/left.png">
                    </div>
                    <div style="display: inline-block; font-size: 20px;" class="YM" id="ym">2022년 1월</div>
                    <div id="calendar_right" onclick="nextCalendar();">
                    <img src="${contextPath}/resources/images/pro/right.png">
                    </div>
                </div>
                <div class="calendar">
                    <table id="calendar">
                    </table>
                </div>
            </div>

            <div id="tuition_time_wrap" class="box_style">
                <p class="tuition_font">시간 선택</p>
                <div id="tuition_time">
                    <select id="time_select">
                        <option>선택</option>
                        <option>08:00</option>
                        <option>10:00</option>
                        <option>12:00</option>
                        <option>14:00</option>
                        <option>16:00</option>
                        <option>18:00</option>
                    </select>

                </div>
            </div>
            
       <!-- <div id="tuition_time_wrap" class="box_style">
                <p class="tuition_font">증상을 간략하게 작성해주세요</p>
                <div id="tuition_reason">
                	<textarea name="" rows="" cols=""></textarea>
                </div>
            </div> -->
        </div>
    </div>
    <div id="reservation_pay_wrap" class="float-right">
        <div id="reservation_pay">
            <div class="pro_price">
                <p class="float-left pro_price_title">테라피 선택</p>
                <p id="therapy_chk" class="float-right">선택</p>
            </div>

            <div class="pro_price clear-both">
                <p class="float-left pro_price_title">횟수 합계</p>
                <p id="therapy_count_chk" class="float-right">선택</p>
            </div>

            <div class="pro_price clear-both">
                <p class="float-left pro_price_title">첫번째 수강 날짜</p>
                <p id="date_chk" class="float-right">선택</p>
            </div>

            <div class="pro_price clear-both">
                <p class="float-left pro_price_title">시간</p>
                <p id="time_chk" class="float-right">선택</p>
            </div>
        </div>

        <div class="pro_price clear-both">
            <p class="float-left pro_price_title">수강료 합계</p>
            <p id="price" class="float-right">0<span>원</span></p>
        </div>

        <div class="final_pay clear-both">
            <button onclick="requestPay();">
                결제하기
            </button>
        </div>
    </div>
</article>


<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<!-- js -->
<script>
    const loginMemberNo = '${memberNo}';
    const loginMemberNm = '${memberNm}';
    const loginMemberId = '${memberId}';
    const loginMemberPhone = '${memberPhone}';
    
    let proPrice = "${proPrice}";
    
    let proPrice2 = proPrice.split(","); 
    
    let textTherapy = proPrice2[0];
	let faceTherapy = proPrice2[1];
	let voiceTherapy = proPrice2[2];

    
</script>
<script type="text/javascript" src="${contextPath}/resources/js/pro/pro.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
    const info = "${info}";
    console.log(info.memberName);

    const professionNo = "${professionNo}";

    // 2차원배열 주의!
    let backupTime = [];
    // 1차원배열
    let backupDate = [];

    $.ajax({
        url:contextPath + "/pro/proMemberSelect",
        dataType:"JSON",
        data:{"professionNo": professionNo},
        success:function (result){
            $.each(result, function (i, item){

                console.log(item);

                const timeLength = item.reservationEnrollTime.split(",").length;
                const date = item.reservationEnrollDate.split(" ")[0];
                const time = item.reservationEnrollTime.split(",");

                backupTime[i] = time;
                backupDate[i] = date;

                // 문자열 -> 시간 변환
                const getTime = new Date(Date.parse(date));

                const calTd = $("#calendar td");
                // 일
                // 자리 다찼으면 막아주기
                if(timeLength == 6){
                    calTd.eq(backupMonthFirstDay + 7 + Number.parseInt(date.split("-")[2]) - 1)
                        .css("color", "rgb(197, 202, 205)");
                }

              /*   $(".reservation_confirm_proname > h1").text(item.professionName + "상담사");

                console.log(item)
                
                $("#pro_profile_wrap > img").attr("src",contextPath+item.imagePath+ '/' + item.imageName).attr("class","float-left").attr("style","width:125px; height: 125px;border-radius:50%;"); */
            });
        },
        error:function (req, sta, er){
            console.log(sta);
        }
    });
</script>