
let backupIndex;
var line = $(".db-line");

// 게시글색 왔다리 갔다리
function colorSet(){
    const view = $(".board-view");

    for(let i = 0; i < view.length; i++){
        if(i % 2 == 0)  view.eq(i).css("background-color", "#FCF7F3");
        else            view.eq(i).css("background-color", "white");
    }
}
colorSet();

// line : <div class="db-line"></div>
// ele : 형제 요소(버튼들?) jquery로만 가능
function underLineDraw(line, ele){
    let underLine = line;
    let offset = ele.offset();
    let offsetWidth = ele.width();
    let offsetHeight = ele.height();

    underLine.css("left", offset.left + "px");
    underLine.css("width", offsetWidth + 10 + "px");
    underLine.css("top", offset.top + offsetHeight + 5 + "px");
}

$(document).on("click", ".div-btn", function(){

    const index = $(".div-btn").index($(this));
    backupIndex = index;

    underLineDraw(line, $(this));

    line.css("transition", "0.3s");
});

$(".div-btn").eq(0).click();
line.css("transition", "0s");

var backupWidth;
window.onresize = function(){
    var innerWidth = window.innerWidth;
    var innerHeight = window.innerHeight;

    if(innerWidth != backupWidth){
        underLineDraw(line, $(".div-btn").eq(backupIndex));
        line.css("transition", "0s");
    }
}

let backupMenuIndex = -1;
$(document).on("click", ".opImg > img", function(){

    const divAll = $(".opImg > div");
    const index = $(".opImg > img").index($(this));
    const div = $(".opImg").eq(index).children();

    divAll.css("visibility", "hidden");

    if(backupMenuIndex == index){

        divAll.css("visibility", "hidden");
        backupMenuIndex = -1;

    }else{
        div.css("visibility", "visible");
        backupMenuIndex = index;
    }
});


var currentPage = 1;
var limit = 10;
var pageSize = 10;
var listCount, maxPage, startPage, endPage, prevPage, nextPage, first, last;
last = currentPage * limit;
first = last - (limit - 1) <= 0 ? 1 : last - (limit - 1);
function calcPagination(){

    maxPage = Number.parseInt(Math.floor(listCount / limit));
    startPage = (currentPage-1) / pageSize * pageSize + 1;
    endPage = startPage + pageSize - 1;

    if(endPage > maxPage)   endPage = maxPage;

    if(currentPage <= limit)	prevPage = 1;
    else                    prevPage = startPage - 1;

    if(endPage == maxPage) nextPage = maxPage;
    else				   nextPage = endPage + 1;

    last = currentPage * limit;
    first = last - (limit - 1) <= 0 ? 1 : last - (limit - 1);
}

function asdasd(){
    const thdea = $(".thead-th");
    if(btnNumber == 2)
        thdea.eq(1).text("댓글 내용");
    else
        thdea.eq(1).text("제목");

}

var btnNumber = 1;
$("#select_myBoardList").on("click", function (){
    btnNumber = 1;
    getBoardList();
});
$("#select_myReplyList").on("click", function (){
    btnNumber = 2;
    getReplyList();
});
$("#select_myScrapList").on("click", function (){
    btnNumber = 3;
    getScrapList();
});

$("#select_myEmpathyList").on("click", function (){
    btnNumber = 4;
    getEmpathyList();
});

$(".div-btn").on("click", function (){
    resultList.length = 0;
    currentPage = 1;
    calcPagination();
    asdasd();
});


function timeForToday(value) {
    const today = new Date();
    const timeValue = new Date(value);

    const betweenTime = Math.floor((today.getTime() - timeValue.getTime()) / 1000 / 60);
    if (betweenTime < 1) return '방금전';
    if (betweenTime < 60) {
        return `${betweenTime}분전`;
    }

    const betweenTimeHour = Math.floor(betweenTime / 60);
    if (betweenTimeHour < 24) {
        return `${betweenTimeHour}시간전`;
    }

    const betweenTimeDay = Math.floor(betweenTime / 60 / 24);
    if (betweenTimeDay < 365) {
        return `${betweenTimeDay}일전`;
    }

    return `${Math.floor(betweenTimeDay / 365)}년전`;
}
function getList(number){
    if(number == 1)      getBoardList();
    else if(number == 2) getReplyList();
    else if(number == 3) getScrapList();
    else if(number == 4) getEmpathyList();
}

var resultList = [];
function makeList(){
    calcPagination();

    $("tbody").empty();

    // if(resultList.length == 0){
    //
    //     swal({
    //         title: "게시글이 존재하지 않습니다.",
    //         text: "",
    //         icon: "info",
    //         button: "확인",
    //     });
    //     $("#pagination").empty();
    //     return;
    // }

    $.each(resultList, function (i, item){
        console.log(resultList);

        let tr = $('<tr class="board-view" style="background-color: rgb(252, 247, 243);">');

        let td1 = $("<td>-</td>");
        let td2 = $("<td>-</td>");
        let td3 = $("<td>-</td>");
        let td4 = $("<td>"+item.readCount+"</td>");
        let boardCd = '';
        
        if(item.boardCategoryName == '털어놓기'){
			boardCd='secret'
		}else if(item.boardCategoryName == '자유게시판'){
			boardCd='free'
		}else if(item.boardCategoryName == '고민상담'){
			boardCd='worry'
		}else{
			boardCd='post'
		}
        

        // 주소 이동시키야지
        if(btnNumber == 1){
            td1 = $("<td>"+item.boardNo+"</td>");
            td2 = $("<td><a href='"+contextPath+"/"+boardCd+"/view/"+item.boardNo+"'>"+item.boardCategoryName+" 게시글입니다"+"</a></td>");
            td3 = $("<td>"+timeForToday(item.createDate)+"</td>");
        }else if(btnNumber == 2){
            td1 = $("<td>"+item.boardNo+"</td>");
            td2 = $("<td><a href='"+contextPath+"/"+boardCd+"/view/"+item.boardNo+"'>"+item.boardCategoryName+" 게시글의 댓글입니다"+"</a></td>");
            td3 = $("<td>"+timeForToday(item.replyCreateDate)+"</td>");
        }else if(btnNumber == 3){
            td1 = $("<td>"+item.boardNo+"</td>");
            td2 = $("<td><a href='"+contextPath+"/"+boardCd+"/view/"+item.boardNo+"'>"+item.boardCategoryName+" 스크랩한 게시글입니다"+"</a></td>");
            td3 = $("<td>"+timeForToday(item.enrollDate)+"</td>");
        }else if(btnNumber == 4){
            td1 = $("<td>"+item.boardNo+"</td>");
            td2 = $("<td><a href='"+contextPath+"/"+boardCd+"/view/"+item.boardNo+"'>"+item.boardCategoryName+" 공감한 게시글입니다"+"</a></td>")
            td3 = $("<td>"+timeForToday(item.empEnrollDate)+"</td>");
        }

        tr.append(td1, td2, td3, td4);
        $("tbody").append(tr);
    });

    const pagination = $("#pagination");

    pagination.empty();
    const leftSpan = $('<span><</span>');
    const leftDoubleSpan = $('<span><<</span>');

    const rightSpan = $('<span>></span>');
    const rightDoubleSpan = $('<span>>></span>');

    if(currentPage != 1)
        pagination.append(leftDoubleSpan, leftSpan);

    for(let i = endPage - 9; i <= endPage; i++){
        if(i < 1) i = 1;

        if(currentPage == i)
            pagination.append($('<div style="background-color: #dddddd;">' + i + '</div>'));
        else
            pagination.append($('<div>' + i + '</div>'));
    }

    if(currentPage != endPage)
        pagination.append(rightSpan, rightDoubleSpan);

    colorSet();
}


$(document).on("click", "#pagination div", function (){
    const clickable = $(this).text();

    currentPage = Number.parseInt(clickable);

    calcPagination();
    getList(btnNumber);

    makeList();
});

function leftRightCalc(str){
    if(str == '>'){
        if(currentPage > maxPage - 11)  currentPage = maxPage;
        else                            currentPage = currentPage + 10;
    }else if(str == '<'){
        if(currentPage < 11)    currentPage = 1;
        else                    currentPage = currentPage - 10;
    }else if(str == '<<')  currentPage = 1;
    else if(str == '>>')   currentPage = maxPage;
}

$(document).on("click", "#pagination span", function (){
    const clickable = $(this).text();

    leftRightCalc(clickable);
    calcPagination();
    getList(btnNumber);

    makeList();
});

function getReplyList(){
    $.ajax({
        url: "myReplyList",
        type: "POST",
        data: {
            "memberNo": memberNo,
            "first":first,
            "last":last
        },
        dataType: "json",
        success: function (result) {
            $.each(result, function (i, item){
                if(result.length - 1 == i){
                    listCount = Number.parseInt(item.maxValue);
                    return;
                }
                resultList[i] = item;
            });
        },
        error: function (error, status) {
            console.log("error : " + error + "\n" + "status : " + status);
        }
    }).done(function (){
        makeList();
    });
}

function getScrapList(){
    $.ajax({
        url: "myScrapList",
        type: "POST",
        data: {
            "memberNo": memberNo,
            "first":first,
            "last":last
        },
        dataType: "json",
        success: function (result) {
            $.each(result, function (i, item){
                if(result.length - 1 == i){
                    listCount = Number.parseInt(item.maxValue);
                    return;
                }
                resultList[i] = item;
            });
        },
        error: function (error, status) {
            console.log("error : " + error + "\n" + "status : " + status);
        }
    }).done(function (){
        makeList();
    });
}

function getBoardList(){
    $.ajax({
        url: "myBoardList",
        type: "POST",
        data: {
            "memberNo": memberNo,
            "first":first,
            "last":last
        },
        dataType: "json",
        success: function (result) {
            $.each(result, function (i, item){
                if(result.length - 1 == i){
                    listCount = Number.parseInt(item.maxValue);
                    return;
                }
                resultList[i] = item;
            });
        },
        error: function (error, status) {
            console.log("error : " + error + "\n" + "status : " + status);
        }
    }).done(function (){
        makeList();
    });
}
$(function (){
    getBoardList();
});


function getEmpathyList(){
    $.ajax({
        url: "myEmpathyList",
        type: "POST",
        data: {
            "memberNo": memberNo,
            "first":first,
            "last":last
        },
        dataType: "json",
        success: function (result) {
            $.each(result, function (i, item){
                if(result.length - 1 == i){
                    listCount = Number.parseInt(item.maxValue);
                    return;
                }
                resultList[i] = item;
            });
        },
        error: function (error, status) {
            console.log("error : " + error + "\n" + "status : " + status);
        }
    }).done(function (){
        makeList();
    });
};
