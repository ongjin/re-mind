<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<!-- header include -->
<jsp:include page="../common/header.jsp"/>

        <section class="main_content">    
            <!-- 메인 -->
            <h3 class="comunity_title">자유롭게 글을 남겨주세요</h3>
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
	                   	 	<div class="board_write_warp grey_bg " >
		                        <div id="free_board_write">
		                            <div class="writer_pic_wrap">
		                            	<c:choose>
		                            		<c:when test="${!empty loginMember.imagePath}">
		                                		<div class="my_pic" style="background-image: url(${contextPath}${loginMember.imagePath}${loginMember.imageName});"> </div>
		                            		</c:when>
		                            		<c:otherwise>
		                                		<div class="my_pic" style="background-image: url(${contextPath}/resources/images/basicProfile.png);"> </div>
		                            		</c:otherwise>
		                            		
		                                </c:choose>
		                            </div>
		                            <div class="writing">
		                                <textarea class="grey_bg" name="boardContent" id="post_textarea" rows="5" onkeydown="resize(this)" onkeyup="resize(this)" placeholder="무슨일이 있었나요?"></textarea>
		                            </div>
		                        </div>
		                        
		                        <div id="imgWrap">
								</div>
		                        
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
                        <!-- 모바일 글쓰기 모달창 -->
			                <div class="posting_modal_warp hidden">
			                    <div class="modal">
			                        <article id="m_free_borad_wrap">
			                            <!-- 글작성 -->
			                            <div class="m_board_write_warp ">
			                                <div id="m_free_board_write">
			                                    <i class="fas fa-times" id="closeModal"></i>
			                                    <div class="writer_wrap">
			                                        <div class="my_pic" style="background-image: url(${contextPath}${loginMember.imagePath}${loginMember.imageName});">
			                                        </div>
			                                        <div class="m_writing">
			                                            <textarea name="boardContent" id="m_post_text" rows="5" onkeydown="resize(this)" onkeyup="resize(this)" placeholder="무슨일이 있었나요?" ></textarea>
			                                        </div>
			                                    </div>
			                                </div>
			                                <div id="imgWrap">
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
			                              		</div>
			                                
				                                <hr>
				
				                                <div class="m_submit_btn_wrap">
						                          	<label for="mfile">
						                               <i class="fas fa-image dark-brown"></i>
						                           	</label>
						                           	<!-- name="images" -->
													<input type="file"  id='mfile' accept="audio/*, video/*, image/*" multiple onchange="loadImg();" style="display: none"> 
				
				                                    <div class="m_btn_area">
				                                        <button class="submit_btn light_brown_bg">작성</button>
				                                        <button class="submit_btn dark_brown_bg" button type="button" onclick="">취소</button>
				                                    </div>
				                                </div>
			                           		</div>
			                        	</div>
	                        		</article>
	                        	 </div>
		                     </div>
               	     	</c:when>
               	     	<c:otherwise>
               	     		<div class="board_write_warp grey_bg " >
               	     			<div id="free_board_write">
		                            <div class="writing" style="min-height: 100px;">
		                            	<div  class = "reqLogin" style="text-align: center; color: grey; font-size: 20px; margin: auto;">글은 작성하시려면 로그인 해주세요</div>
		                            </div>
	                            </div>
                           	</div>
               	     	</c:otherwise>
                    </c:choose>
                </article>
                
            </form>

				<div class="free_board_list_wrap" id="BoardListArea">
<%--                 <!-- 게시판 하나 시작  -->
                <div class="board_list_content"> <!-- 1 -->
                    <!-- 프로필 시작 -->
                    <div class="board_flex_wrap"> <!-- 2 -->
                        <div class="writer_pic_wrap"> <!-- 3 -->
                            <div class="writer_pic light_brown_bg" style="background-image: url();"> <!-- 4 -->
                            </div>
                            
                            <c:if test="${!loginMember.memberNo == board.memberNo }">
                            <ul class="userMenu hidden"> <!-- 4 -->
	                            <li> <!-- 5 -->
	                            	<a href=""> 차단</a> <!-- 6 -->
	                            </li>
	                            <li> 
	                            	<a href=""> 검색</a> 
                           		</li>
                            </ul>
                            </c:if> 
                                                      
                        </div>


                        <a href="/view/${board.boardNo}"> <!-- 3 -->
	                        <div class="posting_info"> <!-- 4 -->
	                            <div class="writer_id"> <!-- 5 -->
	                                <p>${board.memberFn}</p> <!-- 6 -->
	                                
	                                <p>${board.createDate}</p><!-- 6 -->
	                            </div>
	                            <div class="posting"> <!-- 5 -->
	                                <p>${board.boardContent}</p><!-- 6 -->
	                            </div>
	                        </div>
                        </a>
                    </div>
                    <div class="board_icon_wrap"> <!-- 2 -->
						<c:choose>
						<c:when test="${board.replyCheckCode == 1}">
                        <div class="commnet_wrap">  <!-- 3 -->
                            <i class="far fa-comment dark-brown"></i> <!-- 4 -->
                            <p>${board.replyCount}</p><!-- 4 -->
                        </div>
                        </c:when>
                        <c:otherwise>
                       	<div class="commnet_wrap"> <!-- 3 -->
                       	</div>
                        </c:otherwise>
                        </c:choose>

                 		<!-- 공감수 표시 -->
						<c:choose >
						<c:when test="${board.empathyCheckCode == 1}">
                        <div class="like_warp"> <!-- 3  -->
                            <img src="${contextPath}/resources/images/icon/smile.png" alt=""> <!-- 4  -->
                            <p>${board.likeCount}</p> <!-- 4  -->
                            <img src="${contextPath}/resources/images/icon/hug.png" alt=""> <!-- 4  -->
                            <p>${board.cheerCount}</p> <!-- 4  -->
                            <img src="${contextPath}/resources/images/icon/amazed.png" alt=""> <!-- 4  -->
                            <p>${board.surpriseCount}</p> <!-- 4  -->
                            <img src="${contextPath}/resources/images/icon/angry.png" alt=""> <!-- 4  -->
                            <p>${board.angryCount}</p> <!-- 4  -->
                            <img src="${contextPath}/resources/images/icon/crying.png" alt=""> <!-- 4  -->
                            <p>${board.sadCount}</p><!-- 4  -->
                        </div>
						</c:when>
							
						<c:otherwise>
                        <div class="like_warp"> <!-- 3 -->
                        </div>
						</c:otherwise>
						</c:choose>
                    </div> 
                </div>  --%>
			 </div> 
            <!-- 게시판 리스트 -->

            
        </section>
    </div>
</main>


<!-- header include -->
<jsp:include page="../common/footer.jsp"/>
<script src="${contextPath}/resources/js/board/board_common.js"></script>
<script src="${contextPath}/resources/js/board/comunity_freeboard.js"></script>

<script>
const loginMemberNo = "${loginMember.memberNo}";
$(function () {
	// list 가져오기
	getFreeList();
})

//파일 업로드 스크립트
$(document).ready(function()
		// input file 파일 첨부시 fileCheck 함수 실행
		{
			$("#addFileBtn").on("change", fileCheck);
		});
		

// 파일 현재 필드 숫자 totalCount랑 비교값
var fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var totalCount = 5;
// 파일 고유넘버
var fileNum = 0;
// 첨부파일 배열
var content_files = new Array();

var delete_files = new Array();

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
    console.log(content_files);
    //초기화 한다.
    $("#input_file").val("");
  }

// 파일 부분 삭제 함수
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no].is_delete = true;
    
	$('#img' + no).remove();
	
	fileCount --;
    console.log(content_files);
}



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
				//list 리로드
				reload();
				// 내용삭제
				$("#post_textarea").val(""); 
				$("replyCheckCode").val("1");
				$("scrapCheckCode").val("1");
				$("empathyCheckCode").val("1");

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

//페이지네이션(무한스크롤 변수 선언)
var currentPage = 1;
var infinityLimit = 5; // 한번에 보여질 result 수
var pageSize = 10;
var listCount, maxPage, startPage, endPage, prevPage, nextPage, first, last;
// 선 계산(ajax로 넘겨야됨)
last = currentPage * infinityLimit;
first = last - (infinityLimit - 1) <= 0 ? 1 : last - (infinityLimit - 1);
function calcPagination(){

   maxPage = Number.parseInt(Math.floor(listCount / infinityLimit));
   startPage = (currentPage-1) / pageSize * pageSize + 1;
   endPage = startPage + pageSize - 1;

   if(endPage > maxPage)   endPage = maxPage;

   if(currentPage <= infinityLimit)   prevPage = 1;
   else                    prevPage = startPage - 1;

   if(endPage == maxPage) nextPage = maxPage;
   else               nextPage = endPage + 1;

   last = currentPage * infinityLimit;
   first = last - (infinityLimit - 1) <= 0 ? 1 : last - (infinityLimit - 1);
}

calcPagination()


// 무한스크롤
function YesScroll () {
   if(last >= listCount)   return;

   let oneTime = false;
   document.addEventListener('scroll',OnScroll,{passive:true})

   function OnScroll () {
	   const scrollLocation = document.scrollingElement.scrollTop; //현재 스크롤 바 위치
	   const windowHeight = window.innerHeight;  // 화면으로 보이는 스크린 화면의 높이
	   const scrollHeight = document.scrollingElement.scrollHeight; // 스크롤 높이

	   if (scrollLocation + windowHeight+150 >= scrollHeight && !oneTime) {
		   oneTime = true;
		   currentPage = currentPage + 1;
		   calcPagination();
		   getFreeList();
	   }
   }
}
// 검색
const searchSelect = $("#freeboard_search");
searchSelect.on("click", function () {

	const searchText = $("[name='freeboard_search']").val().trim();
	if (searchText != "") {
		const data = {
			"searchCategory" : $("#search_category option:selected").val(),
			"searchText" : searchText
		}
		getFreeList(data);
	} else {
		getFreeList();
	}
});

//list 가져오기
function getFreeList(searchData) {
	let data = {};
	
	if (searchData != null) {
		data = searchData;
	}
	console.log({
		"last":last,
		"first":first		
	});

	$.ajax({
		url : "${contextPath}/free/list",
		type : "POST",
		data : {
			"last":last,
			"first":first		
		},
		dataType:"JSON",
		success : function (result) {
			YesScroll();
			
			let html = "";
			var freeBoardList = $('#BoardListArea')
			let empathyArr;
			let empathyCntArr;
			let iconCnt = {};

			console.log(JSON.parse(result.result));

			$.each(JSON.parse(result.result), function (i, item) {
				console.log(item.profileImgList)
			
				// empathy 초기화
				empathyArr = [];
				empathyCntArr = [];
				iconCnt = {
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
				
				let writerImg = "${contextPath}/resources/images/basicProfile.png";
				if (item.imagePath != null) {
					writerImg = "${contextPath}" + item.imagePath + item.imageName;
				}
				
				html+=   '<div class="board_list_content">'
	              		+'	<div class="board_flex_wrap">'
	                   	+'		<div class="writer_pic_wrap">'
	                    +'			<div class="writer_pic" style="background-image: url('+writerImg+'); background-size:cover;"></div>';
	             if(loginMemberNo != item.memberNo){
					html +='			<ul class="userMenu hidden">'
						+'				<li> <a class ="block"> 차단</a> </li>'
						+'				<input class="hidden" value = '+ item.memberNo +'>'
	                    +'			</ul>'
	                    +'		</div>';
				}else{
					html+='		</div>';
				}
				
				html+='		<a href="${contextPath}/free/view/'+item.boardNo+'">'
					+'			<div class="posting_info">'
					+'				<div class="writer_id">'
		            +'					<p class="userInfo">'+item.memberFn+'</p>'
		            +'					<p hr>'+item.createDate+'</p>'
		            +'				</div>'
		            +'				<div class="posting">'
		            +'					<p>'+item.boardContent+'</p>'
		            +'				</div>'
		            +'			</div>'
		            +'		</a>'
		            +'	</div>'
		            +'	<div class="board_icon_wrap">';
		            
	          	if(item.replyCheckCode == 1){
					html+= 
					'		<div class="comment_wrap">'
					+'            <i class="far fa-comment dark-brown"> '+item.replyCount+'</i>'
					+'            <p></p>'
					+'        </div>'; 
				}else{
					html += '<div class="comment_wrap"></div>';
				}
	          	
				if(item.empathyCheckCode == 1){
					html+='		<div class="like_warp">'
						+'            <img src="${contextPath}/resources/images/icon/smile.png" alt="">'
						+'            <p>'+iconCnt[1001]+'</p>'
						+'            <img src="${contextPath}/resources/images/icon/hug.png" alt="">'
						+'            <p>'+iconCnt[1002]+'</p>'
						+'           <img src="${contextPath}/resources/images/icon/amazed.png" alt="">'
						+'           <p>'+iconCnt[1003]+'</p>'
						+'           <img src="${contextPath}/resources/images/icon/angry.png" alt="">'
						+'           <p>'+iconCnt[1004]+'</p>'
						+'           <img src="${contextPath}/resources/images/icon/crying.png" alt="">'
						+'           <p>'+iconCnt[1005]+'</p>'
						+'        </div>';
				}else{
					html+='		<div class="like_warp">'
					+'        </div>';
				}
				
				html+='    </div>'
					+'</div>'
			});
			$(".free_board_list_wrap").append(html);
			
			
		},
		error : function(request, status, error){
			console.log("ajax 통신 중 오류 발생");
			console.log(request.responseText);
		}
	
	
	});
}

// 고민작성하기 댓글
$("[name='replyCheckCode']").on("change", function () {
	if ($(this).children("option:selected").val() == "1") {
		$(this).css("background-color", "#A59999").css("color", "#fff");
	} else {
		$(this).css("background-color", "#fff").css("color", "#A59999");
	}
});

// 고민작성하기 스크랩
$("[name='scrapCheckCode']").on("change", function () {
	if ($(this).children("option:selected").val() == "1") {
		$(this).css("background-color", "#A59999").css("color", "#fff");
	} else {
		$(this).css("background-color", "#fff").css("color", "#A59999");
	}
});

// 고민작성하기 공감
$("[name='empathyCheckCode']").on("change", function () {
	if ($(this).children("option:selected").val() == "1") {
		$(this).css("background-color", "#A59999").css("color", "#fff");
	} else {
		$(this).css("background-color", "#fff").css("color", "#A59999");
	}
});

</script>
