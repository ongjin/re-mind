<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"/>


            <section class="main_content">    
                <!-- 메인 -->

                <div class="back_btn">
                    <a href="${contextPath}/free/insert">
                        <i class="fas fa-arrow-left"></i> 
                    </a>
                </div>
                <article class="board_view_wrap">
                    <div class="posting_time">
                    <c:choose>
                    	<c:when test="${empty board.modifyDate}">
	                        <p>${board.createDate}</p>
                    	</c:when>
                    
                    	<c:otherwise>
	                        <p>${board.modifyDate}</p>
                       	</c:otherwise>
                    </c:choose>
                    </div>
                    <div class="profile_wrap">
						<c:choose>
							<c:when test="${empty board.imageName}">
								<div class="writer_pic" style="background-image: url(${contextPath}/resources/images/basicProfile.png);"></div>
							</c:when>
							<c:otherwise>
								<div class="writer_pic" style="background-image: url(${contextPath}${board.imagePath}${board.imageName});"></div>
							</c:otherwise>
						</c:choose>
                        <div class="writer_id">
                            <p>${board.memberFn}</p>
                        </div>
                    </div>
                    
                    <!-- 자신의 글일때 수정, 삭제버튼 생성 -->
                    <c:if test="${loginMember.memberNo == board.memberNo }">
	                    <div class="edit_btn_wrap">
	                        <button type="button" class="dark-brown edit_btn" onclick="updateForm()"> 수정 </button>
	                        <button type="button" class="dark-brown edit_btn" onclick="deleteBoard();"> 삭제 </button>
	                    </div>
					</c:if>
					
                    <div class=" posting">
                        <p>${board.boardContent}</p>
                        <div class="post_img">
	                        <c:forEach items="${board.imgList}" var="img" varStatus="status">
             		       		<div id="img${status.index}" class="viewBoardImg"> <img src="${contextPath}${img.imagePath}${img.imageName}">
				       			</div>
	                        </c:forEach>
                        </div>
                    </div>                   


					<c:if test="${board.empathyCheckCode == 1}">
                    <div class="like_warp">
                        <div id="like_smile" class="like">
                            <img src="${contextPath}/resources/images/icon/smile.png" alt="">
                            <p>좋아요</p>
                            <c:choose>
                            	<c:when test="${empty empathyMap}">
                            		<p class="like_count">0</p>
                            	</c:when>
                        		<c:otherwise>
                            		<p class="like_count">${empathyMap.get("1001")}</p>
                       			</c:otherwise>
                       		</c:choose>
                       
                        </div>

                        <div id="like_hug" class="like">
                            <img src="${contextPath}/resources/images/icon/hug.png" alt="">
                            <p>응원해요</p>
                              <c:choose>
                            	<c:when test="${empty empathyMap}">
                            		<p class="like_count">0</p>
                            	</c:when>
                        		<c:otherwise>
                            		<p class="like_count">${empathyMap.get("1002")}</p>
                       			</c:otherwise>
                       		</c:choose>
                        </div>

                        <div id="like_amazed" class="like">
                            <img src="${contextPath}/resources/images/icon/amazed.png" alt="">
                            <p>놀랐어요</p>
                              <c:choose>
                            	<c:when test="${empty empathyMap}">
                            		<p class="like_count">0</p>
                            	</c:when>
                        		<c:otherwise>
                            		<p class="like_count">${empathyMap.get("1003")}</p>
                       			</c:otherwise>
                       		</c:choose>
                        </div>
                        
                        <div id="like_angry" class="like">
                            <img src="${contextPath}/resources/images/icon/angry.png" alt="">
                            <p>화나요</p>
                              <c:choose>
                            	<c:when test="${empty empathyMap}">
                            		<p class="like_count">0</p>
                            	</c:when>
                        		<c:otherwise>
                            		<p class="like_count">${empathyMap.get("1004")}</p>
                       			</c:otherwise>
                       		</c:choose>
                        </div>

                        <div id="like_crying" class="like">
                            <img src="${contextPath}/resources/images/icon/crying.png" alt="">
                            <p>슬퍼요</p>
                             <c:choose>
                            	<c:when test="${empty empathyMap}">
                            		<p class="like_count">0</p>
                            	</c:when>
                        		<c:otherwise>
                            		<p class="like_count">${empathyMap.get("1005")}</p>
                       			</c:otherwise>
                       		</c:choose>
                        </div>
                    </div>
					</c:if>

                    <div class="report_scrap_wrap">
	                    <c:if test="${board.scrapCheckCode == 1}">
                        <!-- 스크랩 허용 했을 경우만 -->
	                      	<a id="btnScrap" class="link-icon scrap"   href="javascript:boardScrap(); ">
	                      		<img alt="" src="${contextPath}/resources/images/icon/bookmark.png;" class="grey">
	                      	</a>
	                      	<a id="btnTwitter" class="link-icon twitter"  href="javascript:shareTwitter();">
	                      		<img alt="" src="${contextPath}/resources/images/icon/icon-twitter.png;">
	                      	</a>
							<a id="btnFacebook" class="link-icon facebook"  href="javascript:shareFacebook();">
								<img alt="" src="${contextPath}/resources/images/icon/icon-facebook.png;">
							</a>    
							<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao(); ">
								<img alt="" src="${contextPath}/resources/images/icon/icon-kakao.png">
							</a>    
	    				</c:if>
	    				
<%-- 	    				<c:if test="${loginMember.memberNo != board.memberNo }">
	                       <a id="report" href="javascript:openReportPopup();">
								<img alt=""  class="link-icon exclamation" src="${contextPath}/resources/images/icon/exclamation-mark.png">
	                        </a>
                        </c:if> --%>
                    </div> 
                </article>
				
				<c:if test="${board.replyCheckCode == 1}">
					<article class="comment_view_wrap">
					    <div class="comment_top">
					        <div>
					            <i class="far fa-comment"></i>
					            <span>댓글</span> 
					            <span>(${board.replyCount})</span>
					        </div>
					
					        <div class="dark-brown m_comment_wirte" onclick="openComment();">
					            <i class="far fa-comment"></i>
					            <span>댓글</span> 
					            <span>(${board.replyCount})</span>
					        </div>
					    </div>
					
				       <div class="write_comment" id="write_comment">
				           
				           <div class="user_info">
	                           <c:choose>
	                           		<c:when test="${!empty loginMember.imagePath}">
	                               		<div class="my_pic" style="background-image: url(${contextPath}${loginMember.imagePath}${loginMember.imageName});"> </div>
	                           		</c:when>
	                           		<c:otherwise>
	                               		<div class="my_pic" style="background-image: url(${contextPath}/resources/images/basicProfile.png);"></div>
	                           		</c:otherwise>
	                           		
	                           </c:choose>
	
				               <div>
				                   <p>${loginMember.memberFName}</p>
				               </div>
				           </div>
				           
				           <textarea name="replyContent" id="replyContent" rows="3"></textarea>
				           <button class="option_btn dark_brown_bg" id="addReply" onclick="addComment();"> 등록 </button>
				       	</div>
					    <hr style="border-color:grey; ">       
					       
					       
					     <div class="comment_list" id="comment_list">
							<c:forEach items="${rList}" var="reply">
			                     <div class="comment_view  <c:if test="${reply.parentReplyNo != 0}"> child </c:if>">
			                         <div class="user_info">
			                         	<c:choose>
			                         		<c:when test="${!empty reply.imagePath}">
					                        	<div class="user_pic" style="background-image: url(${contextPath}${reply.imagePath}${reply.imageName});">
					                            </div>
			                         		</c:when>
			                         		<c:otherwise>
					                        	<div class="user_pic" style="background-image: url(${contextPath}/resources/images/basicProfile.png);">
					                            </div>
			                         		</c:otherwise>
			                         	</c:choose>
			
			                             <div>
			                                 <p>${reply.memberFn}</p>
			                             </div>
			                         </div>
			
			                         <div class="comment">
			                             <p>${reply.replyContent}</p>
			                         </div>
			
			                         <div class="comment_btn">
			                            	<button type="button" class="dark-brown edit_btn re-comment" onclick="showInsertReply(${reply.replyNo}, this)"> 답글 </button>
				                         	<c:if test="${loginMember.memberNo == reply.memberNo }">
				                            	<button class="dark-brown edit_btn " onclick="showUpdateReply(${reply.replyNo}, this)"> 수정 </button>
				                            	<button class="dark-brown edit_btn " onclick="deleteReply(${reply.replyNo})"> 삭제 </button>
				                            </c:if>	
		                         	</div>
		                     	</div>
	                 		</c:forEach> 
                		</div>
					</article>
                </c:if>
                
            
            </section>
        </div>

		<form action="#" method="POST" name="requestForm">
			<input type="hidden" name="cp" value="${param.cp }">
			<input type="hidden" name="boardNo" value="${board.boardNo}">
			<input type="hidden" name="memberNo" value="${loginMember.memberNo}">
		</form>
    
    </main>
<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript">
// 로그인한 회원의 회원 번호, 비로그인 시 "" (빈문자열)
const loginMemberNo = "${loginMember.memberNo}";
// 현재 게시글 번호
const boardNo = ${board.boardNo};
// 수정 전 댓글 요소를 저장할 변수 (댓글 수정 시 사용)
let beforeReplyRow;

function openComment(){
	$('.write_comment').toggleClass('active');
	$('.comment_list').toggleClass('active');
}

//수정버튼 클릭 시 동작
function updateForm(){
	document.requestForm.action = "../updateForm";
	document.requestForm.method = "POST";
	document.requestForm.submit();
}

//닫기 버튼시 동작
function deleteBoard(){
	if(confirm("정말 삭제하시겠습니까?")){
	document.requestForm.action = "../delete";
	document.requestForm.method = "POST";
	document.requestForm.submit();
	}
}

	


//트위터 공유 
function shareTwitter() {
    var sendText = "re:maind 게시글 공유"; // 전달할 텍스트
    var sendUrl = "http://remind.us-east-1.elasticbeanstalk.com/free/view/"+boardNo; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
}

function shareFacebook() {
    var sendUrl = "http://remind.us-east-1.elasticbeanstalk.com/free/view/"+boardNo; // 전달할 URL
    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
}

/* 	function shareKakao() {
		  // 사용할 앱의 JavaScript 키 설정
		  Kakao.init('6218050ca27459717c1f03b78a03958d');
		 
		 
		  // 카카오링크 버튼 생성
		  Kakao.Link.createDefaultButton({
		    container: '#btnKakao', // 카카오공유버튼ID
		    objectType: 'feed',
		    content: {
		      title: "re:mind", // 보여질 제목
		      description: "자유게시판 게시글 공유", // 보여질 설명
		      imageUrl: "http://localhost:8080"+contextPath+"/free/view/"+boardNo", // 콘텐츠 URL
		      link: {
		         mobileWebUrl: "http://localhost:8080"+contextPath+"/free/view/"+boardNo",
		         webUrl: "http://localhost:8080"+contextPath+"/free/view/"+boardNo;"
		      }
		    }
		  });
		}   */
 	
function boardScrap() {
		
	$.ajax({
		url : "${contextPath}/free/boardScrap",
		type : "get",
		data : {"boardNo" : boardNo,
				"memberNo" : loginMemberNo },
		success : function (result) {
		
			if(result == 1){
				
				if(!loginMemberNo){
				swal({"title" : "로그인 후 이용해 주세요." , 
	                     "icon" : "error"});
				}else{
					
				$("#btnScrap").children().removeClass('grey');	
				swal({"title" : "스크랩 완료" , 
	                     "icon" : "success"});
				}
	
			}else if (result == 2){
				
				if(!loginMemberNo){
					swal({"title" : "로그인 후 이용해 주세요." , 
	                      "icon" : "error"});
					}
				else{
					$("#btnScrap").children().addClass('grey')	
					swal({"title" : "스크랩 해제" , 
	                     "icon" : "success"});
				}
				
			}else{
				swal({"title" : "다시 시도해주세요" , 
	                     "icon" : "error"});
			}
		},
	
		error: function (xhr, status, error) {
		    swal({"title" : "서버 연결 오류" , 
	                    "icon" : "error"});
		}
		
	})
	
}
		
		
//좋아요 기능 
$(".like").on("click", function(e){
	
	var tagId = $(this).attr('id');
	var empathyStatusCode;
	
	if(tagId == "like_smile"){
		empathyStatusCode = 1001;
	}else if(tagId == "like_hug"){
		empathyStatusCode = 1002;
	}else if(tagId == "like_amazed"){
		empathyStatusCode = 1003;
	}else if(tagId == "like_angry"){
		empathyStatusCode = 1004;
	}else{
		empathyStatusCode = 1005;
	};
	
	$.ajax({
			url : "${contextPath}/free/insertEmpathy",
			data : {"boardNo" : boardNo,
					"memberNo" : loginMemberNo,
					"empathyStatusCode" : empathyStatusCode},
			context: this,
		success : function (result) {
			if(result >=1){
			
				$.ajax({
					url : "${contextPath}/free/countEmpathy",
					data : { "boardNo": boardNo,
							"empathyStatusCode" : empathyStatusCode},
					context: this,
					success : function(count){
						$(this).children(".like_count").text(count)
					}
				});
			
				
			}else{
				console.log("실패");
			}
			
		},
		
		error: function (xhr, status, error) {
		    swal({"title" : "서버 연결 오류" , 
                     "icon" : "error"});
		}
			
	});
				
});
			
// 신고하기 팝업
function openReportPopup() {
	   layerPopup("report");
}
</script>
<script src="${contextPath}/resources/js/board/replyCopy.js"></script>
