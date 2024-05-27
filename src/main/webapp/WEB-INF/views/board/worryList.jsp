<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

	        <section class="main_content">    
	            <!-- 메인 -->
	            <div  class="comunity_title">
	                <h3>고민을 나눠보면 어떨까요?</h3>
	                <p> 회원분들과 전문가분들이 여러분을 도와주실거에요.</p>
		            <c:if test="${loginMember.memberNo != null}">
			            <button id="openModal" class="submit_btn"> 고민 작성하기 </button>
		            </c:if>

	            </div>
	            

				<div class="worry_search_area">
	                <div class="worry_top_wrap">
	                    <div class="worry_category" >
	                        <button type="button" class="submit_btn dark_brown_bg" id="worryCategoryBtn" >카테고리</button>
	                    </div>
	
	                <div class="reload_btn">
			           	<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" class="reLoad_icon" onclick="worryReload()"><!--! Font Awesome Pro 6.1.1 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2022 Fonticons, Inc. -->
			           		<path d="M464 16c-17.67 0-32 14.31-32 32v74.09C392.1 66.52 327.4 32 256 32C161.5 32 78.59 92.34 49.58 182.2c-5.438 16.81 3.797 34.88 20.61 40.28c16.89 5.5 34.88-3.812 40.3-20.59C130.9 138.5 189.4 96 256 96c50.5 0 96.26 24.55 124.4 64H336c-17.67 0-32 14.31-32 32s14.33 32 32 32h128c17.67 0 32-14.31 32-32V48C496 30.31 481.7 16 464 16zM441.8 289.6c-16.92-5.438-34.88 3.812-40.3 20.59C381.1 373.5 322.6 416 256 416c-50.5 0-96.25-24.55-124.4-64H176c17.67 0 32-14.31 32-32s-14.33-32-32-32h-128c-17.67 0-32 14.31-32 32v144c0 17.69 14.33 32 32 32s32-14.31 32-32v-74.09C119.9 445.5 184.6 480 255.1 480c94.45 0 177.4-60.34 206.4-150.2C467.9 313 458.6 294.1 441.8 289.6z"/>
			           	</svg>
	         		</div>
<!-- 	                    <div class="search_area">
	                        <div class="search_wrap">
	                            <select name="search_category" id="search_category">
	                                <option value="id">닉네임</option>
	                                <option value="content">내용</option>
	                            </select>
	                            <input type="text" name="freeboard_search">
	                            <button type="button" class="submit_btn light_brown_bg" id="freeboard_search"> 검색 </button>
	                        </div>
	                    </div> -->
	                </div>
	                <!-- 카테고리 숨김 -->
	                <div class="worry_category_wrap hidden">
	                    <div class="worry_category">
		                    <div class="check_box_wrap">
			                    <label for="category_all" class="dark_brown_border active">전체</label>
			                    <input type="radio" id="category_all" name="worryCategory" value="0" checked>
		                    </div>
		                    <c:forEach items="${categoryList}" var="category" varStatus="status">
			                    <div class="check_box_wrap">
				                    <label for="category_${status.index}" class="dark_brown_border">${category.worryName}</label>
				                    <input type="radio" id="category_${status.index}" name="worryCategory" value="${category.worryCategoryCode}">
			                    </div>
		                    </c:forEach>
	                    </div>
	                </div>
				</div>

				<form id ="postForm" action="insert" method="post" enctype="multipart/form-data" role="form" onsubmit="return postingValidate();">
	                <!-- 글작성 모달창 -->
	                <div class="postModal hidden">
	                    <div class="postModal_overlay"></div>
	                    <div class="board_write_warp">
	                        <div id="free_board_write">
	                            <i id="closeModal" class="fas fa-times"></i>
	                            <h4>고민 작성하기</h4>
	
	                            <button type="button" class="submit_btn dark_brown_bg" id="openCategoryBtn" >카테고리</button>
	                            <div class="worry_category_wrap hidden">
									<div class="worry_category">
										<c:forEach items="${categoryList}" var="category" varStatus="status">
											<div class="check_box_wrap">
												<label for="normal_${status.index}" class="dark_brown_border ${status.index == 0 ? "active" : ""}">${category.worryName}</label>
												<input type="radio" id="normal_${status.index}" name="worryCategoryCode" value="${category.worryCategoryCode}" ${status.index == 0 ? "checked" : ""}>
											</div>
										</c:forEach>
	                                </div>
	                            </div>
								<div class="post_title">
									<input type="text" id="boardTitle" name="boardTitle" placeholder="제목을 입력해주세요">
								</div>
	                            <div class="writing">
	                                <textarea class="grey_bg" name="boardContent" id="boardContent" rows="15" placeholder="무슨 고민이 있나요?"></textarea>
	                            </div>
	                        </div>

							<div id="imgWrap"></div>

<!-- 	                        <div class="write_option_area">
	                            <div class="check_box_wrap">
	                                <label for="replyCheckCode" class="light_brown_bg dark_brown_bg active">댓글 허용</label>
	                                <input type="checkbox"  name="replyCheckCode" value="1" id="replyCheckCode" checked>
	                            </div>

	                            <div class="check_box_wrap">
	                                <label for="scrapCheckCode" class="light_brown_bg dark_brown_bg active">스크랩 허용</label>
									<input type="checkbox"  name="scrapCheckCode" value="1" id="scrapCheckCode" checked>
	                            </div>
	                            <div class="check_box_wrap">
	                                <label for="empathyCheckCode" class="light_brown_bg dark_brown_bg active">공감 허용</label>
	                                <input type="checkbox"  name="empathyCheckCode" value="1" id="empathyCheckCode" checked>
	                            </div>

	                        </div> -->
	                        	<div class="write_option_area">
              	            		<div class="check_box_wrap">
                                     	<select id="replyCheckCode" name="replyCheckCode">
											<option value="1">댓글 허용</option>
											<option value="2">댓글 비허용</option>
										</select>  
									</div>

                                    <div class="check_box_wrap">
                                       <select id="scrapCheckCode" name="scrapCheckCode">
										    <option value="1">스크랩 허용</option>
										    <option value="2">스크랩 비허용</option>
									    </select>  
                                    </div>
                                        
                                    <div class="check_box_wrap">
                                    	<select id="empathyCheckCode" name="empathyCheckCode">
										    <option value="1">공감 허용</option>
										    <option value="2">공감 비허용</option>
									    </select>  
                                    </div>
		                        </div>
	                        
	                        <hr>
	                        <div class="btn_area">
								<label for="addFileBtn">
									<i class="fas fa-image dark-brown" ></i>
								</label>
								<!-- name="images" -->
								<input type="file"  id='addFileBtn' accept="audio/*, video/*, image/*" multiple style="display: none">
								<button class="submit_btn light_brown_bg">작성</button>
	                        </div>
	                    </div>
	                </div>
	            </form>

	            <article id="free_borad_wrap">
	
	                <!-- 게시판 리스트 -->
	                <div class="free_board_list_wrap">
	                </div>
	
	            </article>
	        
	        </section>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/board_common.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_worry_board.js"></script>
<script type="text/javascript" src="${contextPath}/resources/js/board/replyCopy.js"></script>

<script>
// 고민작성하기 스크랩
const scrap = $("[name='scrapCheckCode']")

if (scrap.children("option:selected").val() == "1") {
	scrap.css("background-color", "#A59999").css("color", "#fff");
} else {
	scrap.css("background-color", "#fff").css("color", "#A59999");
}

scrap.on("change", function () {
	if ($(this).children("option:selected").val() == "1") {
		$(this).css("background-color", "#A59999").css("color", "#fff");
	} else {
		$(this).css("background-color", "#fff").css("color", "#A59999");
	}
});

// 고민작성하기 공감
const empathy = $("[name='empathyCheckCode']")

if (empathy.children("option:selected").val() == "1") {
	empathy.css("background-color", "#A59999").css("color", "#fff");
} else {
	empathy.css("background-color", "#fff").css("color", "#A59999");
}
empathy.on("change", function () {
	if ($(this).children("option:selected").val() == "1") {
		$(this).css("background-color", "#A59999").css("color", "#fff");
	} else {
		$(this).css("background-color", "#fff").css("color", "#A59999");
	}
});


// 고민작성하기 카테고리 선택
const selectRadio = $(".postModal input[name='worryCategoryCode']");
selectRadio.on("click", function () {
	$(".postModal [name='freeboard_search']").val('');
	$(".postModal [name='search_category']").val('id');
	$(".postModal .dark_brown_border").removeClass("active");

	const _this = $(this);
	_this.prev().addClass("active");
});
	$(function () {
		// list 가져오기
		getWorryList();

		// 파일 변경
		$("#addFileBtn").on("change", fileCheck);
	})

	// 카테고리 선택
	const inputRadio = $(".worry_search_area input[name='worryCategory']");
	inputRadio.on("click", function () {
		// 검색 초기화
		$(".worry_search_area [name='freeboard_search']").val('');
		$(".worry_search_area [name='search_category']").val('id');
		$(".worry_search_area .dark_brown_border").removeClass("active");

		const _this = $(this);
		_this.prev().addClass("active");

		// 초기화
		pagingReset();

		// 조건 세팅
		_searchCategory = null;
		_searchText = null;
		_worryCategoryCode = _this.val();

		getWorryList("search");
	});

	// 검색
	const searchSelect = $("#freeboard_search");
	searchSelect.on("click", function () {
		// 카테고리 초기화
		$(".worry_search_area .dark_brown_border").removeClass("active");
		$(".worry_search_area .dark_brown_border").eq(0).addClass("active");
		$(".worry_search_area input[name='worryCategory']").eq(0).prop("checked", true);

		// 초기화
		pagingReset();

		// 조건 세팅
		const searchText = $("[name='freeboard_search']").val().trim();
		if (searchText != "") {
			_searchCategory = $("#search_category option:selected").val();
			_searchText = searchText;
		}

		getWorryList("search");
	});

	// list 가져오기
	function getWorryList(search) {
		let data = {};

		data.last = _last;
		data.first = _first;
		data.searchCategory = _searchCategory;
		data.searchText = _searchText;
		data.worryCategoryCode = _worryCategoryCode;

		$.ajax({
			url : "${contextPath}/worry/worryList",
			type : "POST",
			data : data,
			success : function (result) {

				// YesScroll();


				let html = "";
				$.each(result.worryList, function (i, item) {

					// empathy 초기화
					let empathyArr = [];
					let empathyCntArr = [];
					let iconCnt = {
						"1001" : 0,
						"1002" : 0,
						"1003" : 0,
						"1004" : 0,
						"1005" : 0
					};

					if (item.worryEmpathyArray != null) {
						empathyArr = (item.worryEmpathyArray).split(",");
						empathyCntArr = (item.worryCntArray).split(",");
					}

					for(i=0; i<empathyArr.length; i++) {
						iconCnt[empathyArr[i]] = empathyCntArr[i];
					}

					// 프로필 이미지
					let writerImg = "${contextPath}/resources/images/basicProfile.png";
					if (item.imagePath != null) {
						writerImg = "${contextPath}"+ item.imagePath + item.imageName;
					}

					html += `
						<div class="board_list_content">
							<div class="board_flex_wrap">
								<div class="writer_pic_wrap">
									<div class="writer_pic" style="background-image: url(` + writerImg + `); background-size:cover;"></div>
									<ul class="userMenu hidden">
										<li> <a class="block">차단</a> </li>
										<input class="hidden" value= ` + item.memberNo + `>
									</ul>
								</div>
								<a href="${contextPath}/worry/view/` + item.boardNo + `">
									<div class="posting_info">
										<div class="writer_id">
											<p class="userInfo">` + item.memberFn + `</p>
											<p> ` + item.createDate + `</p>
										</div>
										<div class="posting">
											<p class="listTitle">` + item.boardTitle + `</p> </br>
											<p>` + item.boardContent + `</p>
										</div>
									</div>
								</a>
							</div>
							<div class="board_icon_wrap">
								<div class="comment_wrap">
									<i class="far fa-comment dark-brown"></i>
									<p>` + item.replyCount + `</p>
								</div>
								<div class="like_warp">
									<img src="${contextPath}/resources/images/icon/smile.png" alt="" data-icon="1001">
									<p>`+ iconCnt[1001] +`</p>
									<img src="${contextPath}/resources/images/icon/hug.png" alt="" data-icon="1002">
									<p>`+ iconCnt[1002] +`</p>
									<img src="${contextPath}/resources/images/icon/amazed.png" alt="" data-icon="1003">
									<p>`+ iconCnt[1003] +`</p>
									<img src="${contextPath}/resources/images/icon/angry.png" alt="" data-icon="1004">
									<p>`+ iconCnt[1004] +`</p>
									<img src="${contextPath}/resources/images/icon/crying.png" alt="" data-icon="1005">
									<p>`+ iconCnt[1005] +`</p>
								</div>
							</div>
						</div>
					`;
				});

				// 카테고리, 검색 일때
				if (search != undefined && search != null) {
					$(".free_board_list_wrap").html(html);
				} else {
					$(".free_board_list_wrap").append(html);
				}

				// 리스트 없을때 스크롤 멈춤
				if (result.worryList.length <= 0) {
					_scrollFlag = false;
				}
			},
			error : function(request, status, error){
				console.log("ajax 통신 중 오류 발생");
				console.log(request.responseText);
			}
		});
	}
	//고민작성하기 댓글
	const reply = $("[name='replyCheckCode']")

	if (reply.children("option:selected").val() == "1") {
			reply.css("background-color", "#A59999").css("color", "#fff");
		} else {
			reply.css("background-color", "#fff").css("color", "#A59999");
		}

	reply.on("change", function () {
		if ($("[name='replyCheckCode']").children("option:selected").val() == "1") {
			$(this).css("background-color", "#A59999").css("color", "#fff");
		} else {
			$(this).css("background-color", "#fff").css("color", "#A59999");
		}
	});



/* 	// 고민작성하기 댓글
	$("#replyCheckCode").on("click", function () {
		if ($(this).is(":checked")) {
			$(this).prev().addClass("dark_brown_bg").addClass("active").text("댓글 허용");
			$(this).val(1);
		} else {
			$(this).prev().removeClass("dark_brown_bg").removeClass("active").text("댓글 비허용");
			$(this).val(2);
		}
	});

	// 고민작성하기 스크랩
	$("#scrapCheckCode").on("click", function () {
		if ($(this).is(":checked")) {
			$(this).prev().addClass("dark_brown_bg").addClass("active").text("스크랩 허용");
			$(this).val(1);
		} else {
			$(this).prev().removeClass("dark_brown_bg").removeClass("active").text("스크랩 비허용");
			$(this).val(2);
		}
	});

	// 고민작성하기 공감
	$("#empathyCheckCode").on("click", function () {
		if ($(this).is(":checked")) {
			$(this).prev().addClass("dark_brown_bg").addClass("active").text("공감 허용");
			$(this).val(1);
		} else {
			$(this).prev().removeClass("dark_brown_bg").removeClass("active").text("공감 비허용");
			$(this).val(2);
		}
	});
 */
	// 파일 현재 필드 숫자 totalCount랑 비교값
	var fileCount = 0;
	// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
	var totalCount = 5;
	// 파일 고유넘버
	var fileNum = 0;
	// 첨부파일 배열
	var content_files = new Array();

	var delete_files = new Array();

	// 파일 추가
	function fileCheck(e) {
		var files = e.target.files;

		// 파일 배열 담기
		var filesArr = Array.prototype.slice.call(files);

		// 파일 개수 확인 및 제한
		if (fileCount + filesArr.length > totalCount) {
			alert('파일은 최대 '+totalCount+'개까지 업로드 할 수 있습니다.');
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
						'<div id="img'+fileNum+'"class="boardImg"> <img src="'+ e.target.result+'">'
						+'<div class="deleteImg" onclick="fileDelete(\'file' + fileNum + '\')"><i class="fas fa-times"></i></div>'
						+'</div>'
				);
				fileNum ++;
			};
			reader.readAsDataURL(f);
		});

		//초기화 한다.
		$("#input_file").val("");
	}

	// 파일 부분 삭제 함수
	function fileDelete(fileNum){
		var no = fileNum.replace(/[^0-9]/g, "");
		content_files[no].is_delete = true;

		$('#img' + no).remove();

		fileCount --;
	}
	
	function worryReload(){
		$(".free_board_list_wrap").empty();
		getWorryList();
	}

	// 게시글 등록
	function postingValidate(){
		//사진 배열에 담기
		const form = $("form")[0];
		const formData = new FormData(form);

		for (let i = 0; i < content_files.length; i++) {
			// 삭제 안한것만 담아 준다.
			if(!content_files[i].is_delete){
				formData.append('images', content_files[i]);
			}else{
				delete_files.push(content_files[i]);
				formData.append('deletImages',delete_files[i]);
			}
		}

		//삽입
		$.ajax({
			type: "POST",
			enctype: "multipart/form-data",
			url: "insert",
			data : formData,
			processData: false,
			contentType: false,
			success: function (result) {
				if(result > 0){

					swal({"title" : "글이 작성되었습니다." ,
						"icon" : "success"});
					$("#input_file").val("");
					const imgWrap = document.querySelector("#imgWrap");

					while (imgWrap.hasChildNodes()) {	// 부모노드가 자식이 있는지 여부를 알아낸다
						imgWrap.removeChild(
							imgWrap.firstChild
						);
					}

					// 내용삭제
					$("#post_textarea").val("");
					$("replyCheckCode").val("1");
					$("scrapCheckCode").val("1");
					$("empathyCheckCode").val("1");

					// 리스트 첫페이지 호출
					worryReload();

					// 모달 창 닫기
					closeModal();

				} else
					swal({"title" : "글작성 실패" ,
						"icon" : "error"});
			},
			error: function (xhr, status, error) {
				swal({"title" : "서버 연결 오류" ,
					"icon" : "error"});
			}
		});

		return false;
	}

	// 페이징
	const _infinityLimit = 5; // 한번에 보여질 result 수
	let _page = 1;
	let _last = _page * _infinityLimit;
	let _first = _last - (_infinityLimit - 1);
	// 검색
	let _searchCategory = null;
	let _searchText = null;
	// 카테고리
	let _worryCategoryCode = null;
	// 스크롤
	let _scrollFlag = true;

	// 페이지 초기화
	function pagingReset() {
		_page = 1;
		_last = _page * _infinityLimit;
		_first = _last - (_infinityLimit - 1);

		// 카테고리, 검색 초기화
		_searchCategory = null;
		_searchText = null;
		_worryCategoryCode = null;

		// 스크롤 초기화
		_scrollFlag = true;
	}

	// 페이징 세팅
	function pagingSelected(currentPage) {
		_last = currentPage * _infinityLimit;
		_first = _last - (_infinityLimit - 1);
	}

	window.onscroll= function(e) {
		
		// +100 footer 높이
		if ((window.innerHeight + window.scrollY) + 100 >= document.body.offsetHeight && _scrollFlag) {
			_page++;
			pagingSelected(_page);

			// 리스트 가져오기
			getWorryList();
		}
	}
</script>
<script src=""></script>
