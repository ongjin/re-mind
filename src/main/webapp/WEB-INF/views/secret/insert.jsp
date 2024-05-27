<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!-- header include -->
<jsp:include page="../common/header.jsp"/>

<article class="main_content">
    <!-- 메인 -->
    <h3 class="comunity_title">힘들었던 일 모두 털어놓으세요! </h3>
            <div class="reload_btn">
	           	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="reLoad_icon" onclick="reload()"><!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
	           		<path d="M464 16c-17.67 0-32 14.31-32 32v74.09C392.1 66.52 327.4 32 256 32C161.5 32 78.59 92.34 49.58 182.2c-5.438 16.81 3.797 34.88 20.61 40.28c16.89 5.5 34.88-3.812 40.3-20.59C130.9 138.5 189.4 96 256 96c50.5 0 96.26 24.55 124.4 64H336c-17.67 0-32 14.31-32 32s14.33 32 32 32h128c17.67 0 32-14.31 32-32V48C496 30.31 481.7 16 464 16zM441.8 289.6c-16.92-5.438-34.88 3.812-40.3 20.59C381.1 373.5 322.6 416 256 416c-50.5 0-96.25-24.55-124.4-64H176c17.67 0 32-14.31 32-32s-14.33-32-32-32h-128c-17.67 0-32 14.31-32 32v144c0 17.69 14.33 32 32 32s32-14.31 32-32v-74.09C119.9 445.5 184.6 480 255.1 480c94.45 0 177.4-60.34 206.4-150.2C467.9 313 458.6 294.1 441.8 289.6z"/>
	           	</svg>
            </div>

    <!-- <div class="free_search_area">
            <div class="search_area">
                <div class="search_wrap">
                    <select name="search_category" id="search_category">
                        <option value="id">닉네임</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="freeboard_search">
                    <button type="button" class="submit_btn light_brown_bg" id="freeboard_search"> 검색 </button>
                </div>
            </div>
        </div> -->

    <form action="insert" method="post" enctype="multipart/form-data" role="form" onsubmit="return postingValidate()">
        <article id="free_borad_wrap">
            <!-- 글작성 -->
            <c:choose>
                <c:when test="${!empty loginMember}">
                    <div class="board_write_warp grey_bg ">
                        <div id="free_board_write">
                            <div class="writer_pic_wrap">
                                <c:choose>
                                    <c:when test="${!empty loginMember.imagePath}">
                                        <div class="my_pic"
                                             style="background-image: url(${contextPath}${loginMember.imagePath}${loginMember.imageName}); background-size:cover;"></div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="my_pic"
                                             style="background-image: url(${contextPath}/resources/images/basicProfile.png); background-size:cover;"></div>
                                    </c:otherwise>

                                </c:choose>
                            </div>
                            <div class="writing">
                                <textarea class="grey_bg" name="boardContent" id="post_textarea" rows="5"
                                          onkeydown="resize(this)" onkeyup="resize(this)"
                                          placeholder="무슨일이 있었나요?"></textarea>
                            </div>
                        </div>

                        <div id="imgWrap">
                        </div>

                        <div class="write_option_area">
                            <div class="check_box_wrap">
                                <select id="mReplyCheckCode" name="replyCheckCode">
                                    <option value="1">댓글 허용</option>
                                    <option value="2">댓글 비허용</option>
                                </select>
                            </div>

                            <div class="check_box_wrap">
                                <select id="mScrapCheckCode" name="scrapCheckCode">
                                    <option value="1">스크랩 허용</option>
                                    <option value="2">스크랩 비허용</option>
                                </select>
                            </div>

                            <div class="check_box_wrap">
                                <select id="mEmpathyCheckCode" name="empathyCheckCode">
                                    <option value="1">공감 허용</option>
                                    <option value="2">공감 비허용</option>
                                </select>
                            </div>
                            <div class="check_box_wrap">
                                <select id="manonCheckCode" name="anonCheckCode">
                                    <option value="1">닉네임 공개</option>
                                    <option value="2">닉네임 비공개</option>
                                </select>
                            </div>
                        </div>

                        <hr>
                        <div class="btn_area">
                            <label for="addFileBtn">
                                <i class="fas fa-image dark-brown"></i>
                            </label>
                            <!-- name="images" -->
                            <input type="file" id='addFileBtn' accept="audio/*, video/*, image/*" multiple
                                   style="display: none">
                            <button class="submit_btn light_brown_bg">작성</button>
                        </div>
                    </div>
                    <!-- 모바일 글쓰기 모달창 -->
                    <div class="posting_modal_warp hidden">
                        <div class="modal">
                            <article id="m_free_borad_wrap">
                                <!-- 글작성 -->
                                <div class="m_board_write_warp ">
                                    <div id="m_free_board_write">
                                        <i class="fas fa-times" id="closeModal"></i>
                                        <div class="writer_wrap">
                                            <div class="my_pic"
                                                 style="background-image: url(${contextPath}${loginMember.imagePath}${loginMember.imageName});">
                                            </div>
                                            <div class="m_writing">
                                                <textarea name="boardContent" id="m_post_text" rows="5"
                                                          onkeydown="resize(this)" onkeyup="resize(this)"
                                                          placeholder="무슨일이 있었나요?"></textarea>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="m_write_option_area">

                                        <div class="write_option_area">
                                            <div class="check_box_wrap">
                                                <select id="mReplyCheckCode" name="replyCheckCode">
                                                    <option value="1">댓글 허용</option>
                                                    <option value="2">댓글 비허용</option>
                                                </select>
                                            </div>

                                            <div class="check_box_wrap">
                                                <select id="mScrapCheckCode" name="scrapCheckCode">
                                                    <option value="1">스크랩 허용</option>
                                                    <option value="2">스크랩 비허용</option>
                                                </select>
                                            </div>

                                            <div class="check_box_wrap">
                                                <select id="mEmpathyCheckCode" name="empathyCheckCode">
                                                    <option value="1">공감 허용</option>
                                                    <option value="2">공감 비허용</option>
                                                </select>
                                            </div>

                                            <div class="check_box_wrap">
                                                <select id="mAnonCheckCode" name="anonCheckCode">
                                                    <option value="1">닉네임 공개</option>
                                                    <option value="2">닉네임 비공개</option>
                                                </select>
                                            </div>
                                        </div>

                                        <hr>

                                        <div class="m_submit_btn_wrap">
                                            <label for="mfile">
                                                <i class="fas fa-image dark-brown"></i>
                                            </label>
                                            <!-- name="images" -->
                                            <input type="file" id='mfile' accept="audio/*, video/*, image/*" multiple
                                                   onchange="loadImg();" style="display: none">

                                            <div class="m_btn_area">
                                                <button class="submit_btn light_brown_bg">작성</button>
                                                <button class="submit_btn dark_brown_bg" button type="button"
                                                        onclick="">취소
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="board_write_warp grey_bg ">
                        <div id="free_board_write">
                            <div class="writing" style="min-height: 100px;">
                                <div class="reqLogin"
                                     style="text-align: center; color: grey; font-size: 20px; margin: auto;">글은 작성하시려면
                                    로그인 해주세요
                                </div>
                            </div>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
        </article>

    </form>


    <div class="free_board_list_wrap" id="BoardListArea">

</article>
</div>
</main>


<!-- header include -->
<jsp:include page="../common/footer.jsp"/>
<script src="${contextPath}/resources/js/board/board_common.js"></script>
<script src="${contextPath}/resources/js/board/comunity_freeboard.js"></script>
<script>
//댓글 색
$("[name='replyCheckCode']").on("change", function () {
	if ($(this).children("option:selected").val() == "1") {
		$(this).css("background-color", "#A59999").css("color", "#fff");
	} else {
		$(this).css("background-color", "#fff").css("color", "#A59999");
	}
});

// 스크랩 색
$("[name='scrapCheckCode']").on("change", function () {
	if ($(this).children("option:selected").val() == "1") {
		$(this).css("background-color", "#A59999").css("color", "#fff");
	} else {
		$(this).css("background-color", "#fff").css("color", "#A59999");
	}
});

// 공감 색
$("[name='empathyCheckCode']").on("change", function () {
	if ($(this).children("option:selected").val() == "1") {
		$(this).css("background-color", "#A59999").css("color", "#fff");
	} else {
		$(this).css("background-color", "#fff").css("color", "#A59999");
	}
});

// 공감 색
$("[name='anonCheckCode']").on("change", function () {
	if ($(this).children("option:selected").val() == "1") {
		$(this).css("background-color", "#A59999").css("color", "#fff");
	} else {
		$(this).css("background-color", "#fff").css("color", "#A59999");
	}
});
</script>

<script>

    const loginMemberNo = "${loginMember.memberNo}";
    $(function () {
        // list 가져오기
        getFreeList();
    });

    //파일 업로드 스크립트
    $(document).ready(function ()
        // input file 파일 첨부시 fileCheck 함수 실행
    {
        $("#addFileBtn").on("change", fileCheck);
    });


    //파일 현재 필드 숫자 totalCount랑 비교값
    var fileCount = 0;
    //해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
    var totalCount = 5;
    //파일 고유넘버
    var fileNum = 0;
    //첨부파일 배열
    var content_files = new Array();

    var delete_files = new Array();

    function fileCheck(e) {
        var files = e.target.files;

        // 파일 배열 담기
        var filesArr = Array.prototype.slice.call(files);

        // 파일 개수 확인 및 제한
        if (fileCount + filesArr.length > totalCount) {
            alert('파일은 최대 ' + totalCount + '개까지 업로드 할 수 있습니다.');
            return;
        } else {
            fileCount = fileCount + filesArr.length;
        }

        // 각각의 파일 배열담기 및 기타
        filesArr.forEach(function (f) {
            var reader = new FileReader();
            reader.onload = function (e) {

                content_files.push(f);

                $('#imgWrap').append(
                    '<div id="img' + fileNum + '"class="boardImg"> <img src="' + e.target.result + '">'
                    + '<div class="deleteImg" onclick="fileDelete(\'file' + fileNum + '\')"><i class="fas fa-times"></i></div>'
                    + '</div>'
                );
                fileNum++;
            };
            reader.readAsDataURL(f);
        });
        console.log(content_files);
        //초기화 한다.
        $("#input_file").val("");
    }
    
    function reload() {
    	$(".free_board_list_wrap").empty();
    	getFreeList();
    }

    //파일 부분 삭제 함수
    function fileDelete(fileNum) {
        var no = fileNum.replace(/[^0-9]/g, "");
        content_files[no].is_delete = true;

        $('#img' + no).remove();

        fileCount--;
        console.log(content_files);
    }

    function postingValidate() {
        //사진 배열에 담기
        const form = $("form")[0];
        const formData = new FormData(form);

        for (let i = 0; i < content_files.length; i++) {
            // 삭제 안한것만 담아 준다.
            if (!content_files[i].is_delete) {
                formData.append('images', content_files[i]);
            } else {
                delete_files.push(content_files[i]);
                formData.append('deletImages', delete_files[i]);
            }
        }

        let boardContent = $(".writing [name='boardContent']").val();
        if (boardContent == "") {
            boardContent = $(".m_writing [name='boardContent']").val();
        }
        formData.set("boardContent", boardContent);

        //삽입
        $.ajax({
            type: "POST",
            enctype: "multipart/form-data",
            url: "insert",
            data: formData,
            processData: false,
            contentType: false,
            success: function (result) {
                if (result > 0) {


                    swal({
                        "title": "글이 작성되었습니다.",
                        "icon": "success"
                    });
                    $("#input_file").val("");
                    const imgWrap = document.querySelector("#imgWrap");

                    while (imgWrap.hasChildNodes()) {	// 부모노드가 자식이 있는지 여부를 알아낸다
                        imgWrap.removeChild(
                            imgWrap.firstChild
                        );
                    }
                    $(".free_board_list_wrap").empty();
                    getFreeList();
                    // 내용삭제
                    $("#post_textarea").val("");
                    $("replyCheckCode").val("1");
                    $("scrapCheckCode").val("1");
                    $("empathyCheckCode").val("1");
                    $("anonCheckCode").val("1");

                } else
                    swal({
                        "title": "글작성 실패",
                        "icon": "error"
                    });
            },
            error: function (xhr, status, error) {
                swal({
                    "title": "서버 연결 오류",
                    "icon": "error"
                });
            }
        });

        return false;
    }


    //페이지네이션(무한스크롤 변수 선언)
    var currentPage = 1;
    var infinityLimit = 5; // 한번에 보여질 result 수
    var pageSize = 10;
    var listCount, maxPage, startPage, endPage, prevPage, nextPage, first, last;
    // 선 계산(ajax로 넘겨야됨)
    last = currentPage * infinityLimit;
    first = last - (infinityLimit - 1) <= 0 ? 1 : last - (infinityLimit - 1);

    function calcPagination() {

        maxPage = Number.parseInt(Math.floor(listCount / infinityLimit));
        startPage = (currentPage - 1) / pageSize * pageSize + 1;
        endPage = startPage + pageSize - 1;

        if (endPage > maxPage) endPage = maxPage;

        if (currentPage <= infinityLimit) prevPage = 1;
        else prevPage = startPage - 1;

        if (endPage == maxPage) nextPage = maxPage;
        else nextPage = endPage + 1;

        last = currentPage * infinityLimit;
        first = last - (infinityLimit - 1) <= 0 ? 1 : last - (infinityLimit - 1);
    }

    calcPagination()


    // 무한스크롤
    function YesScroll() {
        if (last >= listCount) return;

        let oneTime = false;
        document.addEventListener('scroll', OnScroll, {passive: true})

        function OnScroll() {
            const scrollLocation = document.scrollingElement.scrollTop; //현재 스크롤 바 위치
            const windowHeight = window.innerHeight;  // 화면으로 보이는 스크린 화면의 높이
            const scrollHeight = document.scrollingElement.scrollHeight;

            if (scrollLocation + windowHeight >= scrollHeight && !oneTime) {
                oneTime = true;
                currentPage = currentPage + 1;
                calcPagination();
                getFreeList();
            }



            // console.log("scrollPosition : " + scrollPosition, " / fullHeight : " + fullHeight,
            //     " / screenHeight : " + screenHeight, " / 계산 : " + (fullHeight - screenHeight / 2))
            // if (fullHeight - screenHeight / 2 <= scrollPosition && !oneTime) {
            // if (fullHeight - screenHeight / 2 <= scrollPosition && !oneTime) {
            //     oneTime = true;
            //     currentPage = currentPage + 1;
            //     calcPagination();
            //     getFreeList();
            // }
        }
    }


    //list 가져오기
    function getFreeList(searchData) {
        let data = {};

        if (searchData != null) {
            data = searchData;
        }

        $.ajax({
            url: "${contextPath}/secret/list",
            type: "POST",
            data: {
                "last": last,
                "first": first
            },
            dataType: "JSON",
            success: function (result) {
                YesScroll();

                let html = "";
                var secretBoardList = $('#BoardListArea')
                let empathyArr;
                let empathyCntArr;
                let iconCnt = {};

                $.each(JSON.parse(result.result), function (i, item) {
                    //console.log(item)

                    // empathy 초기화
                    empathyArr = [];
                    empathyCntArr = [];
                    iconCnt = {
                        "1001": 0,
                        "1002": 0,
                        "1003": 0,
                        "1004": 0,
                        "1005": 0
                    };

                    if (item.worryEmpathyArray != null) {
                        empathyArr = (item.worryEmpathyArray).split(",");
                        empathyCntArr = (item.worryCntArray).split(",");
                    }

                    for (i = 0; i < empathyArr.length; i++) {
                        iconCnt[empathyArr[i]] = empathyCntArr[i];
                    }

                    // 프로필 이미지
                    writerImg = "${contextPath}/resources/images/basicProfile.png";
                    if (item.imagePath != null) {
                        writerImg = "${contextPath}" + item.imagePath + item.imageName;
                    }


                    html += '<div class="board_list_content">'
                        + '   <div class="board_flex_wrap">'
                        + '      <div class="writer_pic_wrap">';

                    if (item.anonCheckCode == 1 ) {
                        html += '			<div class="writer_pic" style="background-image: url(' + writerImg + '); background-size:cover;"></div>';
                    } else {
                       
                    	html += '			<div class="writer_pic" style="background-image: url(${contextPath}/resources/images/basicProfile.png); background-size:cover;" ></div>';
                    }


                    if (loginMemberNo != item.memberNo) {
                        html += '         <ul class="userMenu hidden">'
                            + '            <li> <a class="block"> 차단</a> </li>'
                            + '            <input class="hidden" value = ' + item.memberNo + '>'
                            + '         </ul>'
                            + '      </div>';
                    } else {
                        html += '      </div>';
                    }

                    html += '      <a href="${contextPath}/secret/view/' + item.boardNo + '">'
                        + '         <div class="posting_info">'
                        + '            <div class="writer_id">';

                    if (item.anonCheckCode == 1) {
                        html += '               <p class="userInfo">' + item.memberFn + '</p>';
                    } else {
                        html += '               <p class="userInfo">익명</p>';
                    }

                    html += '<p>' + item.createDate + '</p>'
                        + '            </div>'
                        + '            <div class="posting">'
                        + '               <p>' + item.boardContent + '</p>'
                        + '            </div>'
                        + '         </div>'
                        + '      </a>'
                        + '   </div>'
                        + '   <div class="board_icon_wrap">';

                    if (item.replyCheckCode == 1) {
                        html +=
                            '		<div class="comment_wrap">'
                            + '            <i class="far fa-comment dark-brown"> ' + item.replyCount + '</i>'
                            + '            <p></p>'
                            + '        </div>';
                    } else {
                        html += '<div class="comment_wrap"></div>';
                    }

                    if (item.empathyCheckCode == 1) {
                        html += '      <div class="like_warp">'
                            + '            <img src="${contextPath}/resources/images/icon/smile.png" alt="" data-icon="1001">'
                            + '            <p>' + iconCnt[1001] + '</p>'
                            + '            <img src="${contextPath}/resources/images/icon/hug.png" alt="" data-icon="1002">'
                            + '            <p>' + iconCnt[1002] + '</p>'
                            + '           <img src="${contextPath}/resources/images/icon/amazed.png" alt="" data-icon="1003">'
                            + '           <p>' + iconCnt[1003] + '</p>'
                            + '           <img src="${contextPath}/resources/images/icon/angry.png" alt="" data-icon="1004">'
                            + '           <p>' + iconCnt[1004] + '</p>'
                            + '           <img src="${contextPath}/resources/images/icon/crying.png" alt="" data-icon="1005">'
                            + '           <p>' + iconCnt[1005] + '</p>'
                            + '        </div>';
                    } else {
                        html += '      <div class="like_warp">'
                            + '        </div>';
                    }

                    html += '    </div>'
                        + '</div>'
                });
                $(".free_board_list_wrap").append(html)

            },
            error: function (request, status, error) {
                console.log("ajax 통신 중 오류 발생");
                console.log(request.responseText);
            }
        });
    }



</script>