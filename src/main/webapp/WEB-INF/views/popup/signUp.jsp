<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />
<link rel="stylesheet" href="${contextPath}/resources/css/${css}.css">


<div id="signup_area">
	<div class="top_title_wrap">
		<h2 class="title">회원가입</h2>
	</div>
	<form method="POST" action="signUp/signUp"  name="signUpForm" onsubmit="return validate();">
		<div class="signup_box">
			<div class="input_wrap">
				<div class="input_area left_area">
					<div class="input_div">
						 <div class="check_div"><label for="id">아이디</label> <div class="check" id="checkId"></div></div>
						<input type="text" name="memberId" id="id" placeholder="이메일" class="login_input idEmail" required>
					</div>
					<div class="input_div">
						<div><label for="idKey">아이디 확인</label> <div class="check" id="checkEmail"></div></div>
						<input type="text" id="idKey" placeholder="인증번호" class="login_input short" required>
						<button class="shortBtn mailCheckBtn" type="button" >인증번호 전송</button>
					</div>
					<div class="input_div">
						<div><label for="pw">비밀번호</label>  <div class="check" id="checkPwd1"></div></div>
						<input type="password" name="memberPw" id="pwd1" placeholder = "6~20글자"class="login_input" value="" required>
					</div>
					<div class="input_div">
						<div><label for="pw2">비밀번호 확인</label>  <div class="check" id="checkPwd2"></div></div>
						<input type="password" id="pwd2" class="login_input" value="" required>
					</div>
					<div class="input_div">
						<div><label for="name">이름</label><div class="check" id="checkName"></div></div>
						<input type="text"  name="memberName" id="name" class="login_input" value="" required>
					</div>
					<div class="input_div">
						<div><label for="nickname">닉네임</label> <div class="check" id="checkNickNm"></div></div>
						<input type="text" name="memberFName" id="nickname" placeholder = "2~20글자" class="login_input" value="" required>
					</div>
				</div>
					<div class="input_area right_area">
					<div class="input_div">
						<div>주소 우편번호</div>
						<input type="text" name="address" id="address_input_1" class="login_input short" required>
						<button class="shortBtn" type="button" onclick="execution_daum_address()">검색</button>
					</div>
					<div class="input_div">
						<div><label for="address1">도로명 주소</label></div>
						<input type="text" name="address" id="address_input_2" class="login_input" required>
					</div>
					<div class="input_div">
						<div><label for="address2">상세 주소</label></div>
						<input type="text" name="address" id="address_input_3" class="login_input" value="">
					</div>
					<div class="input_div">
						<div><label for="phone2">핸드폰 번호</label><div class="check" id="checkPhone"></div></div>
							<select class="custom-select" id="phone1" name="phone" required>
								<option>010</option>
								<option>011</option>
								<option>016</option>
								<option>017</option>
								<option>019</option>
							</select>
						<input type="text" name="phone" id="phone2" class="login_input phone" value="" required>
						<input type="text" name="phone" id="phone3" class="login_input phone" value="" required>
					</div>
					
					<div class="input_div">
						<div>성별</div>
						<div class="radio_area">
							<label for="male">
								<input type="radio" id="male" name="memberGender" value="남" checked> 남성
							</label>
							<label for="female">
								<input type="radio" id="female" name="memberGender" value="여"> 여성
							</label>
						</div>
					</div>
				</div>
			</div>

			<div class="submit_area" style="clear:both;">
				<button type="submit" class="signup_btn">가입하기</button>
			</div>
		</div>
	</form>
</div>

<%-- <script src="${contextPath}/resources/js/member/signUp.js"></script> --%>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script>

// 주소
function execution_daum_address(){
	new daum.Postcode({
	    oncomplete: function(data) {

	        var addr = ''; // 주소 변수
	        var extraAddr = ''; // 참고항목 변수
    	 
   	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
   	                    addr = data.roadAddress;
   	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
   	                    addr = data.jibunAddress;
   	                }
    	 
   	                if(data.userSelectedType === 'R'){
   	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
   	                        extraAddr += data.bname;
   	                    }
   	                    if(data.buildingName !== '' && data.apartment === 'Y'){
   	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
   	                    }
   	                    if(extraAddr !== ''){
   	                        extraAddr = ' (' + extraAddr + ')';
   	                    }
   	                    
   	                	addr += extraAddr;
   	                } else {
   	                	addr += ' ';
   	                }
   	 
   	                $("#address_input_1").val(data.zonecode);
   	                $("#address_input_2").val(addr);
       
   	                $("#address_input_3").focus();

	        }
	    }).open(); 
}

// 각 입력 값이 유효성 검사를 진행했는지 기록할 객체
const signUpCheckObj = {
    "id" : false,
    "idKey" : false,
    "name" : false,
    "nickname" : false,
    "pwd1" : false,
    "pwd2" : false,
    "phone3" : false
}

var code = ""; 

function validate(){ 

    for( key  in signUpCheckObj ){

        if( !signUpCheckObj[key] ){
            
            let message;

            switch(key){
            case "id" : message = "아이디가 유효하지 않습니다."; break;
            case "idKey" : message = "인증번호가 유효하지 않습니다."; break;
            case "name" : message = "이름이 유효하지 않습니다."; break;
            case "nickname" : message = "닉네임이 유효하지 않습니다."; break;
            case "pwd1" : message = "비밀번호가 유효하지 않습니다."; break;
            case "pwd2" : message = "비밀번호가 일치하지 않습니다."; break;
            case "phone3" : message = "다시 입력해주세요."; break;
            }

            alert(message);

            document.getElementById(key).focus(); 

            return false;

        }
    }
    
    const phone = document.getElementsByName("phone");
    const address = document.getElementsByName("address");

    const input1 = document.createElement("input");
    input1.setAttribute("type", "hidden");
    input1.setAttribute("name", "memberPhone");
    input1.value = phone[0].value + "-" + phone[1].value + "-" + phone[2].value;
    document.signUpForm.append(input1);

    // 우편번호가 작성되어 있을 때에만 
    if(address[0].value.trim().length > 0){
        const input2 = document.createElement("input");
        input2.setAttribute("type", "hidden");
        input2.setAttribute("name", "memberAddress");
        input2.value = address[0].value + ",," + address[1].value + ",," + address[2].value;
        document.signUpForm.append(input2);
    }   
 };
 
 // 아이디
 document.getElementById("id").addEventListener("input", function(e){
	
	const inputId = this.value;

    const regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
    
    const checkId = document.getElementById("checkId");

 	if(inputId.length == 0){ 

        $(checkId).text("");

        signUpCheckObj.id = false; 

    } else if( regExp.test(inputId) ){ 
	

        $.ajax({ // jQuery 방식의 ajax 
            url : "signUp/idDupCheck",                         

            data : {"inputId" : inputId},               
            type : "GET",                              
            success : function(result){

                if(result  ==  0){ 
                	$(checkId).text("사용 가능한 아이디입니다.").css("color", "green");
                    signUpCheckObj.id = true;
              
                }else{ 
                    
                	$(checkId).text("이미 사용중인 아이디입니다.").css("color", "red");
                    signUpCheckObj.id = false;
                }
            },
            error : function(){ },
            complete : function(){ }
        });
        
	  
	} else{
		$(checkId).text("유효하지 않은 아이디 입니다.").css("color", "red");
        signUpCheckObj.id = false;
	}
	
});
 


 /* 인증번호 이메일 전송 */
 $(".mailCheckBtn").click(function(){
     
     var email = $(".idEmail").val();        // 입력한 이메일
     
     $.ajax({
         
         type:"GET",
         url:"signUp/mailCheck?email=" + email,
 		success:function(data){
 			
 	          code = data;
 	          
 	         swal({"title" : "인증번호 전송 완료!" , 
                 "icon" : "success"});
 	          
         }        
         		
     });
     
 });

// 아이디 인증번호 
 $("#idKey").blur(function(){
 	
 	var inputCode = $("#idKey").val();
 	var checkResult = $("#checkEmail");
 	
 	if(inputCode.length == 0 ){
 		checkResult.html("");
 		signUpCheckObj.idKey = false;
 	
 	}else if(inputCode == code){                           
         checkResult.html("인증번호가 일치합니다.");
         checkResult.css("color","green");
 		 signUpCheckObj.idKey = true;
    }else{                                           
         checkResult.html("인증번호가 불일치합니다.");
         checkResult.css("color","red");
 		 signUpCheckObj.idKey = false;
    }   
     
 });


// 이름
$("#name").on("input", function(){

    const inputName = $(this).val(); // 입력 받은 이름
    const regExp = /^[가-힣]{2,5}$/;

    if( inputName.length == 0 ){
        $("#checkName").text("");

        signUpCheckObj.name = false;

    }else if(regExp.test(inputName)){ 
        $("#checkName").text("유효한 이름 입니다.").css("color", "green");
        
        signUpCheckObj.name = true;

    }else{ 
        $("#checkName").text("유효하지 않은 이름 입니다.").css("color", "red");

        signUpCheckObj.name = false;
    }
});


// 닉네임 
document.getElementById("nickname").addEventListener("input", function(e){
	
	const inputNickNm = this.value;

    const regExp = /^[가-힣]{2,5}$/;
    
    const checkNm = document.getElementById("checkNickNm");
        
 	if(inputNickNm.length == 0){ 

        $(checkNm).text("");

        signUpCheckObj.nickname = false; 

    } else if( regExp.test(inputNickNm) ){ 
	
	  $.ajax({ 
            url : "signUp/check",
            
            data : {"inputNickNm" : inputNickNm},               
            type : "GET",
            success : function(result){

                if(result  ==  0){ 
                	$(checkNm).text("사용 가능한 닉네임입니다.").css("color", "green");
                    signUpCheckObj.nickname = true;
              
                }else{

                	$(checkNm).text("이미 사용중인 닉네임입니다.").css("color", "red");
                    signUpCheckObj.nickname = false;
                }
            },
          
            error : function(){
            },
            complete : function(){
            }

        });
	
	} else{
		$(checkNm).text("유효하지 않은 닉네임 입니다.").css("color", "red");
        signUpCheckObj.nickname = false;
	}
	
});

// 비밀번호 1
document.getElementById("pwd1").addEventListener("input", (e) => {

    const inputPw = e.target.value; 

    const regExp = /^[a-zA-Z\d\!\@\#\-\_]{6,20}$/;

    const checkPwd1 = document.getElementById("checkPwd1"); 

    if(inputPw.length == 0){ 
    	$(checkPwd1).text("");
        signUpCheckObj.pwd1 = false;
    
    }else if(regExp.test(inputPw)){ 
    	$(checkPwd1).text("유효한 비밀번호입니다.").css("color", "green");
        signUpCheckObj.pwd1 = true;

    }else{
    	$(checkPwd1).text("유효하지 않은 비밀번호입니다.").css("color", "red");
        signUpCheckObj.pwd1 = false;
    }

});

// 비밀번호 2
$("#pwd2, #pwd1").on("input", function(){

    const pwd1 = document.getElementById("pwd1").value;
    const pwd2 = document.getElementById("pwd2").value;
    const checkPwd2 = document.getElementById("checkPwd2"); 

    if( pwd2.trim().length == 0 ){ 
        checkPwd2.innerText = "";
        signUpCheckObj.pwd2 = false;

    }else if(pwd1 == pwd2){ 
        checkPwd2.innerText = "비밀번호가 일치합니다.";
        checkPwd2.style.color = "green";
        signUpCheckObj.pwd2 = true;
        
    }else { 
        checkPwd2.innerText = "비밀번호가 일치하지 않습니다.";
        checkPwd2.style.color = "red";
        signUpCheckObj.pwd2 = false;
    }
});

// 핸드폰번호
$(".phone").on("input", function(){

    if(  $(this).val().length > 4  ){

        const num = $(this).val().slice(0,4); // 4자리만 남음

        $(this).val(num);
    }

    const inputPhone2 = document.getElementById("phone2").value;
    const inputPhone3 = document.getElementById("phone3").value;

    const regExp2 = /^\d{3,4}$/;
    const regExp3 = /^\d{4}$/;

    const checkPhone = document.getElementById("checkPhone");

    if( inputPhone2.length == 0  && inputPhone3.length == 0){ // 둘다 빈칸일 경우
        checkPhone.innerText = "";
        signUpCheckObj.phone3 = false;

    }else if(regExp2.test(inputPhone2) && regExp3.test(inputPhone3) ){

        checkPhone.innerText = "유효한 전화번호 입니다.";
        checkPhone.style.color = "green";
        signUpCheckObj.phone3 = true;

    }else{

        checkPhone.innerText = "다시 입력해주세요.";
        checkPhone.style.color = "red";
        signUpCheckObj.phone3 = false;

    }


});




</script>
