
// 문항 번호
let _questionNo = 0;
// 답변수
let _answerNo = 0;
// 점수
let _score = 0;
// 문항별 점수
let _answerScore = [];
// 카테 고리 번호
let _categoryNo;
// 문항 전체 수
let _fullQuestionCount = 0;
// 답변선택
let flag = false;
// 결과 title html
let titleHtml = "";
// 결과 content html
let resultHtml = "";

// 카테고리 명
let cName;

$(function () {
    // 자가진단 선택
    if (type) {
        _categoryNo = type;
        $(".selfTest_op").eq(type-1).click();
    } else {
        $(".selfTest_op").eq(0).click();
    }
});

// 증상 선택
$(".selfTest_op").on("click", function () {
    cName = $(this).text();
    $(".selfTest_op").removeClass("active");
    $(this).addClass("active");
    reset();

    titleHtml = $(this).text() + " 자가진단 결과";

    _categoryNo = $(this).data("type");

    selftestQuestion();
});

// 문항 가져오기
function selftestQuestion(next=1){
    $.ajax({
        url : "selftestQuestion",
        type : "POST",
        data : {"categoryNo":_categoryNo},// 증상번호
        dataType : "json",
        success : function (result){
            _fullQuestionCount = result.Quest.length;

            _questionNo = _questionNo + next;


            let html = '<div class="selfTest_title">'
                + '<h1>' + cName + ' 자가진단 테스트</h1>'
                + '<div>'
                +'    이 검사는 자신에 대해서 어떻게 느끼는 지를'
                +'    알아보기 위한 것입니다.<br>'
                +'    각 문자를 읽고, 자신에게 해당되는 정도를'
                +'    나타내는 항목에 체크하여 주십시오.'
                + '</div>'
                + '</div>'
                + '<div class="selfTest_content">'
                +  '  <span>'+(_questionNo)+'</span>'
                +  '  <span></span>'
                +   ' <span>총 '+ _fullQuestionCount +'문항</span>'
                +  '  <div>'+ result.Quest[_questionNo-1].questionContent +'</div>'
                +   ' <div id="selfTest_content_option">'
                +'    </div>'
                + '</div>'

            let html2 = "";

            for(let i=0; i< result.Answer.length; i++){
                html2 += '<div class="selfTest_result" onclick="saveScore('+ result.Answer[i].answerType +', '+i+')">' + result.Answer[i].answerContent + '</div>';
            }

            $(".selfTest").html(html);
            $("#selfTest_content_option").append(html2);

        }, error(request,status,error){
            console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
        } //error

    });
}

// 답변 선택
function saveScore(score, btnIndex){
    // 초기화
    $(".selfTest_result").removeClass("active");
    // 선택
    $(".selfTest_result").eq(btnIndex).addClass("active");

    // 답변 체크
    flag = true;

    // 문항별 점수 합산
    if (_answerNo == "0") {
        _answerScore[_answerNo] = score;
    } else {
        _answerScore[_answerNo] = _answerScore[_answerNo-1] + score;
    }

    // 마지막 문항 답변 선택 -  테스트 결과 보임
    if (_fullQuestionCount == (_answerNo+1)) {
        $("#selfTest_result_btn").css("display", "block");
    }
}

// 다음
function next(){
    if (flag) {
        // 문항 가져오는것
        selftestQuestion();

        // 답변 수 증가
        _answerNo += 1;

        // 답변 초기화
        flag = false;

        // 마지막 문항 다음 버튼 사라짐
        btnShowHide();
    } else {
        alert("답변을 선택해주세요.");
    }

    return false;
}

// 이전
function prev(){
    // 현재 점수 초기화
    _answerScore[_answerNo] = undefined;

    _answerNo -= 1;

    selftestQuestion(-1);

    // 마지막 문항 다음 버튼 사라짐
    btnShowHide();

    // 테스트 결과 숨김
    $("#selfTest_result_btn").css("display", "none");

    return false;
}

// 이전, 다음 show hide
function btnShowHide() {
    // 이전
    if (_answerNo == "0") {
        $(".selfTest_prev_btn").addClass("hidden");
    } else {
        $(".selfTest_prev_btn").removeClass("hidden");
    }

    // 다음
    if (_fullQuestionCount == (_questionNo+1) ) {
        $(".selfTest_next_btn").addClass("hidden");
    } else {
        $(".selfTest_next_btn").removeClass("hidden");
    }
}

// 테스트 결과
function resultScore(){

    $.ajax({
        url : "selftestResult",
        type : "GET",
        data : {"categoryNo":_categoryNo, "score":_answerScore[_fullQuestionCount-1]}, // 증상번호, 합산 값
        dataType : "json",
        success : function (result){
            layerPopup("selftestResult");
            resultHtml = result.resultContent;
        },
    })
}

// 초기화
function reset() {
    _questionNo = 0;
    _answerNo = 0;
    _score = 0;
}
