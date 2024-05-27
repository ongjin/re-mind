/*
// 각 입력 값이 유효성 검사를 진행했는지 기록할 객체
const signUpCheckObj = {
    "id" : false,
    "name" : false,
    "nickname" : false,
    "pwd1" : false,
    "pwd2" : false,
    "phone3" : false
}

function validate(){ 

    for( key  in signUpCheckObj ){

        if( !signUpCheckObj[key] ){
            
            let message;

            switch(key){
            case "id" : message = "아이디가 유효하지 않습니다."; break;
            case "name" : message = "이름이 유효하지 않습니다."; break;
            case "nickname" : message = "닉네임이 유효하지 않습니다."; break;
            case "pwd1" : message = "비밀번호가 유효하지 않습니다."; break;
            case "pwd2" : message = "비밀번호가 일치하지 않습니다."; break;
            case "phone3" : message = "전화번호가 유효하지 않습니다."; break;
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
	
	  $.ajax({ 
            url : "idDupCheck",                       

            data : {"inputId" : inputId},               

            success : function(result){

                if(result  ==  0){ 
                    checkId.innerText = "사용 가능한 아이디 입니다.";
                    checkId.style.color = "green";
                    signUpCheckObj.id = true;
              
                }else{
	
                    checkId.innerText = "이미 사용중인 아이디 입니다.";
                    checkId.style.color = "red";
                    signUpCheckObj.id = false;
                }
            },
          
            error : function(){
            },
            complete : function(){
            }

        });
	
	} else{
		$(checkId).text("유효하지 않은 아이디 입니다.").css("color", "red");

        signUpCheckObj.id = false;
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

    const regExp = /^([a-zA-Z0-9ㄱ-ㅎ|ㅏ-ㅣ|가-힣]).{1,10}$/;
        
    const checkNickNm = document.getElementById("checkNickNm");

 	if(inputNickNm.length == 0){ 

        $(checkNickNm).text("");

        signUpCheckObj.nickname = false; 

    } else if( regExp.test(inputNickNm) ){ 
	
	  $.ajax({ 
            url : "nickNmDupCheck",                       

            data : {"inputNickNm" : inputNickNm},               

            success : function(result){

                if(result  ==  0){ 
                    checkNickNm.innerText = "사용 가능한 아이디 입니다.";
                  	checkNickNm.style.color = "green";
                    signUpCheckObj.nickname = true;
              
                }else{
	
                    checkNickNm.innerText = "이미 사용중인 아이디 입니다.";
                    checkNickNm.style.color = "red";
                    signUpCheckObj.nickname = false;
                }
            },
          
            error : function(){
            },
            complete : function(){
            }

        });
	
	} else{
		$(checkNickNm).text("유효하지 않은 닉네임 입니다.").css("color", "red");

        signUpCheckObj.nickname = false;
	}
	
});

// 비밀번호 1
document.getElementById("pwd1").addEventListener("input", (e) => {

    const inputPw = e.target.value; 

    const regExp = /^[a-zA-Z\d\!\@\#\-\_]{6,20}$/;

    const checkPwd1 = document.getElementById("checkPwd1"); 

    if(inputPw.length == 0){ 
        checkPwd1.innerText = "";
        signUpCheckObj.pwd1 = false;
    
    }else if(regExp.test(inputPw)){ 
        checkPwd1.innerText = "유효한 비밀번호 입니다.";
        checkPwd1.style.color = "green";
        signUpCheckObj.pwd1 = true;

    }else{
        checkPwd1.innerText = "유효하지 않은 비밀번호 입니다.";
        checkPwd1.style.color = "red";
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

    // 현재 입력 중인 번호 자리에 작성된 값의 길이가 4를 초과할 경우
    // -> 전화번호를 4글자 초과해서 작성함
    if(  $(this).val().length > 4  ){

        // 글자수 제한 처리
        // -> 초과된 부분을 잘라서 없앰
        const num = $(this).val().slice(0,4); // 4자리만 남음

        // 잘라서 4자리만 남은 값을 
        // 현재 입력중인 input 태그의 value로 대입
        $(this).val(num);
    }

    // 각각 입력된 번호 얻어오기
    const inputPhone2 = document.getElementById("phone2").value;
    const inputPhone3 = document.getElementById("phone3").value;

    // 정규 표현식
    const regExp2 = /^\d{3,4}$/;
    const regExp3 = /^\d{4}$/;

    // 출력용 span태그
    const checkPhone = document.getElementById("checkPhone");

    if( inputPhone2.length == 0  && inputPhone3.length == 0){ // 둘다 빈칸일 경우
        checkPhone.innerText = "";
        signUpCheckObj.phone3 = false;

    }else if(regExp2.test(inputPhone2) && regExp3.test(inputPhone3) ){ // 둘다 유효

        checkPhone.innerText = "유효한 전화번호 입니다.";
        checkPhone.style.color = "green";
        signUpCheckObj.phone3 = true;

    }else{ // 둘 중 하나라도 유효 X

        checkPhone.innerText = "유효하지 않은 전화번호 입니다.";
        checkPhone.style.color = "red";
        signUpCheckObj.phone3 = false;

    }


});



 
// 인증번호 이메일 전송
$(".mailCheckBtn").click(function(){
    
    var email = $(".idEmail").val();        // 입력한 이메일
    
       $.ajax({
        
        type:"GET",
        url:"mailCheck",
        data : email
                
    });
    
});


*/