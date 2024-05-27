<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../procommon/header.jsp"></jsp:include>

<main>
    <h1>상담사 등록 신청 </h1>

    <form action="proRegister" method="post" onsubmit="return validate();">
        <div class="proWrap">
            <div class="label">
            아이디 
            </div>
            <input type="email" name="professionId" id="professionId" required placeholder="이메일을 입력해주세요"> 
            <div id="checkEmail"></div> <br>

            <div class="label">
            비밀번호 
            </div>
            <input type="password" name="professionPw" id="proPw" required >
            <div id="checkPw"></div> <br>
            

            <div class="label">
            비밀번호 확인 
            </div>
            <input type="password" name="proPwCheck" id="proPwCheck" required>
            <div id="checkPw2"></div> <br>
            
            <div class="label"> 이름</div>
            <input type="text" name="professionName" id="proName"  required> <br>

            <div class="label">생년월일</div>
            <input type="text" name="professionBirth" id="proBirth" required placeholder="0000/00/00"> <br>
            
            <div class="label">성별</div>
            <input type="radio" name="professionGender" id="proBirthF" value="여"><label for="proBirthF">여성</label>
            <input type="radio" name="professionGender" id="proBirthM" value="남" checked> <label for="proBirthM">남성</label><br>

            <div class="label">핸드폰 번호</div>
            <input type="text" name="professionPhone" id="proPhone" required placeholder="000-0000-0000"> <br>

            <br>
            <input type="checkbox" name="accept" id="accept" required>(필수) 서비스 이용 약관 및 개인정보 처리 이용방침에 동의 합니다. <br>
            <br>
            <br>
            <br>
        <button>등록하기</button>
        </div>
    </form>

</main>


<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>
