<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/my/counselor.css">
<!-- header include -->
<style>
    .swal-button {
        padding: 7px 19px;
        border-radius: 2px;
        background-color: #FFF;
        font-size: 12px;
        color: black;
        border: 3px solid black;
        border-radius: 10px;
    }


</style>
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
    <div class="wish-page">찜한 상담사</div>

    <table>

        <c:choose>

            <c:when test="${empty counselorList}">
                <%-- 조회된 내찜사 목록이 없을 때 --%>
                <tr>
                    <td colspan="1">목록이 존재하지 않습니다.</td>
                </tr>
            </c:when>
            <c:otherwise>
                <c:forEach items="${counselorList}" var="counselor">

                    <%-- 조회된 게시글 목록이 있을 때 --%>
                    <tr>
                        <td>
<%--                            <div style="display: none">${counselor.professionNo}</div>--%>
                            <c:choose >
                                <c:when test="${empty counselor.imagePath}">
                                    <img class="profile" src="${contextPath}/resources/images/basicProfile.png">
                                </c:when>
                                <c:otherwise>
                                    <img class="profile" src="${contextPath}${counselor.imagePath}/${counselor.imageName}"/>
                                </c:otherwise>
                            </c:choose>
                                <%--                        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg==">--%>
                        </td>
                        <td>
                            <div class="bold14px">
                                <span class="bold14px">${counselor.professionName}</span>
                                <span class="bold12ccc">MASTER</span>
                                    ${counselor.reviewAvg}(${counselor.reviewCount})

                                <div class="starpoint_box">
                                    <label for="starpoint_1" class="label_star" title="1"><span class="blind">1점</span></label>
                                    <label for="starpoint_2" class="label_star" title="2"><span class="blind">2점</span></label>
                                    <label for="starpoint_3" class="label_star" title="3"><span class="blind">3점</span></label>
                                    <label for="starpoint_4" class="label_star" title="4"><span class="blind">4점</span></label>
                                    <label for="starpoint_5" class="label_star" title="5"><span class="blind">5점</span></label>
                                    <label for="starpoint_6" class="label_star" title="6"><span class="blind">6점</span></label>
                                    <label for="starpoint_7" class="label_star" title="7"><span class="blind">7점</span></label>
                                    <label for="starpoint_8" class="label_star" title="8"><span class="blind">8점</span></label>
                                    <label for="starpoint_9" class="label_star" title="9"><span class="blind">9점</span></label>
                                    <label for="starpoint_10" class="label_star" title="10"><span class="blind">10점</span></label>
                                    <input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
                                    <input type="radio" name="starpoint" id="starpoint_2" class="star_radio">
                                    <input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
                                    <input type="radio" name="starpoint" id="starpoint_4" class="star_radio">
                                    <input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
                                    <input type="radio" name="starpoint" id="starpoint_6" class="star_radio">
                                    <input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
                                    <input type="radio" name="starpoint" id="starpoint_8" class="star_radio">
                                    <input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
                                    <input type="radio" name="starpoint" id="starpoint_10" class="star_radio">
                                    <span class="starpoint_bg" style="width:${counselor.reviewAvg*10}%"></span>
                                </div>

                                    <%-- <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg=="
                                          width="14" height="14" alt="작은 별점 2점 이미지">--%>

                                    <%--                    4.96(666)--%>
                            </div>
                            <div class="pro-content">
                                    ${counselor.proIntro}
                                    <%--                    말하다보면 편안해지는 마법같은 상담--%>
                                    <%--                    말하다보면 편안해지는 마법같은 상담--%>
                                    <%--                    말하다보면 편안해지는 마법같은 상담--%>
                                    <%--                    말하다보면 편안해지는 마법같은 상담--%>
                            </div>
                            <div class="bold14px">
                                    ${counselor.priceMin}원부터~
                                    <%--            75,000원부터--%>
                            </div>
                        </td>
                        <td>
                            <img class="lovewish"
                                 src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRK1CC8pJ2AvDkkM2wwkVuU5GSQZdVLPj7kg&usqp=CAU"
                                 alt=""
                                 onclick="deleteCounselor(${counselor.professionNo})" >
                        </td>
                    </tr>
                </c:forEach>
            </c:otherwise>

        </c:choose>
        <%--<tr>
            <td>
                <img class="profile"
                     src="data:image/jpeg;base64,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">
            </td>
            <td>
                <div class="bold14px">
                    <span class="bold14px">김수한</span>
                    <span class="bold12ccc">마스터</span>
                    <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAAcCAYAAAB2+A+pAAAAAXNSR0IArs4c6QAAArVJREFUSA2tVs1rE0EUf28TWr8uBQU/AqLGhAh+QWhrTECwePJiC1r0IHit4MU/Qw8evAoe9OZRTwqCNVEpaC+Wpqle4gfiURobdvN8b9JdZ7a7k822C8u++b3fx87sZFqAlBc1jpfkTikHJ60Qer1pdac0SB9MOANyp7wwjY7eF49Q1/0iWhzJHsWJ5a/D+qSbcdedDoL0OgAHF+mCUVtivR6cFzCGXmqaLx4EcNtEoLSIQADZHFaXvweuCYrhZ0zeFT9U/FXNWIIsgzJ8MNL/7+tbRWF+L+Y51FLTQmEvdLyfvLYZ3Y9NPNiZ2Y/l5m8dt9VZqufPAmZ22UhBb92bCodKTzBc781Ro/gy4NoK8tZQHXsePSWiMzbudvUQ8RO/5nUHz60swdjoBKJzr79DtyvC9BFvyVBZnGl8Y6oXLvL5+5hnf8iUbW3Es/wGjnMTK81XvpOxq1XDGT3FxGc+YatP5SWeWqh4GjPWQ+hN/haPHxDQHh1PWiPgH+bewVrrUZQmNljIVD+WBw+fcPh4lDgO49APkKEbWFltxXPiOhs40YUszLcXOfzEAKpqc+hnqOZOI752bXzjG0cSP7bHGC9E9qLBAvQ10d0NdHDwGs7wbLNWF62puKzRoMhycDDRbKTSBibQ2DfXQukA/O3Kn8BNL8hCdTzycTkVfgc+LHqwYySH5aUf4Z4/3mToN9Sz414Nh/Lvssuhd6HauiS31ILpOqVhrY6Fa3sw0jVdoHYsOeNYW73PYXwE8s01CCa7Wb9CWr0ldWwwvS0d5l/ypC/gkIeQ2VfGWnPRx/ynwqQnnOCiyb5HABhFbDCQWmb2gl/oOJex2rqNlUbHUGsD6SmOcFnT/88kfrktwTTLBi8Ad5/E8yvPtQxrqbiiEW2C3W2Y0bt8js/qOQNMMRAP8YqS/gMbzegG1X8tjgAAAABJRU5ErkJggg=="
                         width="14" height="14" alt="작은 별점 2점 이미지">
                    4.96(666)
                </div>
                <div class="pro-content">
                    말하다보면 편안해지는 마법같은 상담
                </div>
                <div class="bold14px">
                    75,000원부터
                </div>
            </td>
            <td>
                <img class="lovewish"
                     src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRK1CC8pJ2AvDkkM2wwkVuU5GSQZdVLPj7kg&usqp=CAU"
                     alt="">
            </td>
        </tr>--%>
    </table>


</article>


<div class="my-5">
    <ul class="pagination">

        <c:if test="${pagination.startPage != 1 }">
            <li><a class="page-link" href="counselor?cp=1${c}${s}">&lt;&lt;</a></li>
            <li><a class="page-link"
                   href="counselor?cp=${pagination.prevPage}${s}">&lt;</a></li>
        </c:if>

        <%-- 페이지네이션 번호 목록 --%>
        <c:forEach begin="${pagination.startPage}"
                   end="${pagination.endPage}" step="1" var="i">
            <c:choose>
                <c:when test="${i == pagination.currentPage}">
                    <li><a class="page-link"
                           style="color: black; font-weight: bold;">${i}</a></li>
                </c:when>

                <c:otherwise>
                    <li><a class="page-link" style="color: black; font-weight: bold;"
                           href="counselor?cp=${i}${c}${s}">${i}</a></li>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <c:if test="${pagination.endPage != pagination.maxPage }">
            <li><a class="page-link"
                   href="counselor?cp=${pagination.nextPage}${c}${s}">&gt;</a></li>
            <li><a class="page-link"
                   href="counselor?cp=${pagination.maxPage }${s}">&gt;&gt;</a></li>
        </c:if>
    </ul>
</div>


<%-- session에 message 속성이 존재하는 경우 alert창으로 해당 내용을 출력 --%>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>

<script src="${contextPath}/resources/js/my/counselor.js"></script>

<script>

<%--<c:if test="${ !empty requestScope.counselorList }">--%>

<%--    <!-- 세션에 올라가있는 loinMember -->--%>
    const memberNo = ${loginMember.memberNo};

<%--    const professionNo = ${counselorList.professionNo};--%>
var flag;

var swal;
    function deleteCounselor(professionNo){

        swal({
            title: "정말 삭제하시겠습니까?",
            text: "",
            icon: "warning",
            buttons: ["NO", "YES"]
        }).then((YES) => {
            if (YES) {
                flag = true;
                $.ajax({
                    url:"deleteCounselor",
                    type:"POST",
                    data:{
                        "professionNo": professionNo,
                        "memberNo": memberNo},
                    success:function (result){
                        // console.log(url);
                        swal({
                            title : "온전히 삭제되었습니다.",
                            text : "",
                            icon : "success",
                            button : "확인"
                        })
                        setTimeout(function(){
                            location.reload();
                        },2000);
                    }
                });

            }else{
                flag = false;
                swal({
                    title : "취소하셨습니다.",
                    text : "",
                    icon : "success",
                    button : "확인"
                })
                // window.location.reload();

            }
        });

        Promise.all([swal]).then(function (){

            // console.log(flag);
        });


    };
</script>
