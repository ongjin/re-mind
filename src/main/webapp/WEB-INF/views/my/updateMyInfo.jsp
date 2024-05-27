<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/my/updateMyInfo.css">
<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
    <div class="update-mypage">회원정보 수정</div>
    <form action="updateMyInfoo" name="updateForm" method="POST" enctype="multipart/form-data" onsubmit="return memberUpdateValidate();" role="form">
        <div class="update-img">

    <%--        if(item.imagePath == undefined)//기본프로필이 없으면--%>
    <%--        pro_profile_img2 = $('<img src="'+contextPath+'/resources/images/basicProfile.png" class="profile">');--%>
    <%--        else // 있으면 경로로 이미지이름 추가로 가져와야됨--%>
    <%--        pro_profile_img2 = $('<img src="'+contextPath+item.imagePath+'/'+item.imageName+'" class="profile">');--%>
            <c:choose>
                <c:when test="${empty memberImage.imagePath}">
                    <label for="chooseFile">
                        <img src="${contextPath}/resources/images/basicProfile.png">
                    </label>
                </c:when>
                <c:otherwise>
                    <label for="chooseFile">
                        <img src="${contextPath}${memberImage.imagePath}/${memberImage.imageName}">
                    </label>
                </c:otherwise>
            </c:choose>
        <input type="file" id="chooseFile" name="images" accept="image/*" onchange="loadFile(this)" style="display: none;">
        </div>
        <table class="table">
            <tr>
                <td>이름</td>
                <td>${loginMember.memberName}</td>
            </tr>
            <tr>
                <td>이메일</td>
                <td>${loginMember.memberId}</td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td>
                    <input class="pass" name="memberPw" type="password" placeholder="비밀번호를 입력해주세요.">
                    <div></div>
                </td>
            </tr>
            <tr>
                <td>닉네임</td>
                <td><input class="nickname" name="mobile_memberFName" type="text" value="${loginMember.memberFName}"></td>
            </tr>
            <tr>
                <c:set var="ph" value="${fn:split(loginMember.memberPhone, '-') }"/>
                <td>휴대전화</td>
                <td>
                    <input class="ph" type="text" value="${ph[0]}" readonly>
                    - <input class="ph" type="text" value="${ph[1]}" readonly>
                    - <input class="ph" type="text" value="${ph[2]}" readonly>
                </td>
            </tr>
        </table>

        <div class="update-info">
            <div class="update-img">
                <c:choose>
                    <c:when test="${empty memberImage.imagePath}">
                        <img src="${contextPath}/resources/images/basicProfile.png">
                    </c:when>
                    <c:otherwise>
                        <img src="${contextPath}${memberImage.imagePath}/${memberImage.imageName}">
                    </c:otherwise>
                </c:choose>
            </div>
            <div>프로필 사진 변경</div>

            <div class="updateName">이름</div>
            <div>${loginMember.memberName}</div>
            <hr>
            <div class="updateNN">닉네임</div>
            <div><input class="nickname" name="memberFName" type="text" value="${loginMember.memberFName}"></div>
            <hr>
            <div class="updateEmail">이메일</div>
            <div>${loginMember.memberId}</div>
            <hr>
            <div class="updatePhone">전화번호</div>
            <div>
                <input class="ph" type="text" value="${ph[0]}" readonly> -
                <input class="ph" type="text" value="${ph[1]}" readonly> -
                <input class="ph" type="text" value="${ph[2]}" readonly>
            </div>
            <hr>
            <div class="updatePW">비밀번호</div>
            <div class="pwResult">
                입력 : <input type="password" name="memberPw" class="pass"> <span class="pwSpan">유효성</span><br>
<%--                <button>비밀번호 변경</button>--%>
            </div>
        </div>

        <div class="csdiv">
            <button id="update" type="submit">수정</button>
            <button id="cancel" type="reset">취소</button>
        </div>
    </form>
</article>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<%--<script src="${contextPath}/resources/js/my/updateMyInfo.js"></script>--%>
<script>
    const updateCheckObj = {
        // passWord: false,
        memberFName:true
    }

    $(".pass").on("input", function (){
        const index = $(".pass").index($(this));
        // const reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;

        let pw = $(this).val();

        // if(pw.trim().length < 7)    updateCheckObj.passWord = false;
        // else                        updateCheckObj.passWord = true;

        // if(reg.test(pw)){
        //     if(index == 0)  updateCheckObj.passWord = true;
        //     else            updateCheckObj.passWord = true;
        // }else{
        //     if(index == 0)  updateCheckObj.passWord = false;
        //     else            updateCheckObj.passWord = false;
        // }
    });

    function loadFile(input) {
        var file = input.files[0];	//선택된 파일 가져오기

        if (input.files && input.files[0]) {
            fileClone = $(input).clone(); // 백업 객체에 복제본 추가

            var reader = new FileReader();
            reader.readAsDataURL(input.files[0]);
            reader.onload = function (e) {
                $(".update-img img").attr("src", e.target.result);
            }

        }else{
            $(input).before(fileClone.clone());
            $(input).remove(); // 원본 삭제
        }
        name.textContent = file.name;
    }

    $(".nickname").on("input", function (){
        // if($(this).val().length < 3)
        //     updateCheckObj.memberFName = false;
        // else
        //     updateCheckObj.memberFName = true;
    });

    function memberUpdateValidate(){

        for( key in updateCheckObj ){
            if(!updateCheckObj[key])
                return false;
        }
    }


</script>