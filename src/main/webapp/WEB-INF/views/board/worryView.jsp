<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

	        <article class="main_content">
	            <!-- 메인 -->

	            <div class="back_btn">
	                <a href="${contextPath}/worry/worryList">
	                    <i class="fas fa-arrow-left"></i>
	                </a>
	            </div>
	            <article class="board_view_wrap">
	                <div class="posting_time">
						<c:if test="${loginMember.memberNo == board.memberNo }">
							<div class="edit_btn_wrap">
								<button type="button" class="dark-brown edit_btn" onclick="updateForm()"> 수정 </button>
								<button type="button" class="dark-brown edit_btn" onclick="deleteBoard();"> 삭제 </button>
							</div>
						</c:if>
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

	                <div class="post_title">
	                    <h2>${board.boardTitle}</h2>
	                </div>

	                <div class=" posting">
	                    <p>
							${board.boardContent}
	                    </p>
	                    <div class="post_img">
							<c:forEach items="${board.imgList}" var="img" varStatus="status">
								<div id="img${status.index}" class="viewBoardImg"> <img src="${contextPath}${img.imagePath}${img.imageName}">
								</div>
							</c:forEach>
						</div>
	                </div>

					<c:if test="${board.empathyCheckCode == 1}">
                    <div class="like_warp">
                        <div id="like_smile" class="like" >
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

                        <div id="like_hug" class="like" >
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

                        <div id="like_amazed" class="like" >
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
                        
                        <div id="like_angry" class="like" >
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
                        
                         <div id="like_crying" class="like" >
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

	                <%--<div class="report_scrap_wrap">
	                    <div class="comment_top dark-brown">
	                        <div>
	                            <i class="far fa-comment"></i>
	                            <span>댓글</span>
	                            <span>(55)</span>
	                        </div>
	                    </div>

	                    <!-- 스크랩 허용 했을 경우만 -->
	                    <a href="">
	                        <i class="fas fa-archive"></i>
	                        <p>스크랩</p>
	                    </a>

	                    <a href="">
	                        <i class="fas fa-exclamation-triangle"></i>
	                        <p>신고</p>
	                    </a>
	                </div>--%>

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
					</div>

				</article>

					<!-- /////////////////////////////////////////////////////////////////////// -->

              <c:if test="${board.replyCheckCode == 1}">
					<article class="comment_view_wrap">
					    <div class="comment_top dark-brown">
					        <div>
					            <i class="far fa-comment"></i>
					            <span>댓글</span> 
					            <span>(${board.replyCount})</span>
					        </div>
					
					        <div class="m_comment_wirte" onclick="openComment()">
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
                               		<div class="my_pic" style="background-image: url(${contextPath}/resources/images/basicProfile.png);"> </div>
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
							<c:forEach items="${replyList}" var="reply">
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

	                <%--<div class="insertReply">
	                    <textarea></textarea>
	                    <button>확인</button>
	                </div>

	                <div class="replyInsertOpen">답변 달기</div>

	                <article class="replyAll">
	                    <div class="replyInfo">
	                        <div class="reply1Line">
	                            <div class="npImg"></div>
	                            <div>
	                                <img src="data:image/jpeg;base64,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">
	                            </div>
	                            <div>류관현</div>
	                            <div>상담사</div>
	                            <div>
	                                <img src="images/warning.png">
	                            </div>
	                            <div>20시간전</div>
	                        </div>
	                        <div class="reply-content">
	                            <p>
	                                아버지의 질병으로 인해 걱정이 많으시겠네요.<br><br>

	                                많은 환자들은 자신의 질환에 대해 상대적으로 심각하지 않게 받아들이고<br>
	                                그로 인해 치료 시기와 기간 모두 지연되는 경우가 많습니다.<br><br>

	                                병이 오래 될 수록 그런 경향이 많습니다.<br>
	                                대부분의 병은 조기에 발견하면 상대적으로 치료가 쉽고<br>
	                                만성으로 갈 수록 치료가 어렵게 됩니다.<br><br>

	                                아버지께서 문제음주 발생 후 오래 되지 않았더라고 해도<br>
	                                30년 정도의 음주 경력이면 알코올 의존이라는 질환에서도<br>
	                                상당히 만성으로 진행된 상태라고 생각이 됩니다.<br><br>

	                                그렇다고 좌절해서 아무것도 안할 수 는 없겠지요.<br><br>

	                                환자분이 치료의지가 강하고 병원, 가족, 환자, 지인들 모두 합심하여<br>
	                                열심히 노력 한다면 치료의 가능성은 여전히 있다고 생각합니다.<br><br>

	                                치료의 개념을 앞으로 절대 술을 먹지 않는 것이라고 한다면<br>
	                                반복된 음주로 인해 기운이 빠지시겠지만<br>
	                                조금 더 넓혀 생각해서 최대한 단주의 기간을 늘리고<br><br>

	                                혹시 다시 음주를 하더라도 스스로 빠른 대처를 할 수 있게 되는 것 만으로도<br>
	                                충분히 치료 시도의 의미가 있을 것이라 생각 됩니다.<br><br>

	                                정답을 가지고 시작하는 일은 많지 않을 것이라 생각 됩니다.<br><br>

	                                알코올 의존은 질환이기 때문에 병원에서 치료 받지 않으면 매우 힘든 병입니다.<br><br>

	                                개개인마다 치료의 결과가 크게 다르기도 합니다.<br>
	                                전문가의 진료를 받고 도움을 받으시길 바랍니다.<br>
	                            </p>
	                        </div>
	                    </div>
	                    <div class="replyInfo">
	                        <div class="reply1Line">
	                            <div class="npImg" style="background-color: black;"></div>
	                            <div>
	                                <img src="data:image/jpeg;base64,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">
	                            </div>
	                            <div>유저일</div>
	                            <div></div>
	                            <div>
	                                <img src="images/warning.png">
	                            </div>
	                            <div>2021-01-14-12:36</div>
	                        </div>
	                        <div class="reply-content">
	                            <p>
	                                상심이 크겠어요ㅜㅜ 화이팅하세요!!!!!!!!!! ^__^
	                            </p>
	                        </div>
	                    </div>
	                </article>



	            </article>--%>

	        </article>
	    </div>

		<form action="#" method="POST" name="requestForm">
			<input type="hidden" name="cp" value="${param.cp }">
			<input type="hidden" name="boardNo" value="${board.boardNo}">
			<input type="hidden" name="memberNo" value="${loginMember.memberNo}">
		</form>

	</main>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_worry_board.js"></script>


<script type="text/javascript">
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


	// 로그인한 회원의 회원 번호, 비로그인 시 "" (빈문자열)
	const loginMemberNo = "${loginMember.memberNo}";
	// 현재 게시글 번호
	const boardNo = ${board.boardNo};
	// 수정 전 댓글 요소를 저장할 변수 (댓글 수정 시 사용)
	let beforeReplyRow;
</script>

<script>
	//트위터 공유
	function shareTwitter() {
		var sendText = "re:maind 게시글 공유"; // 전달할 텍스트
		var sendUrl = "http://remind.us-east-1.elasticbeanstalk.com/worry/view/"+boardNo; // 전달할 URL
		window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}

	function shareFacebook() {
	    var sendUrl = "http://remind.us-east-1.elasticbeanstalk.com/worry/view/"+boardNo; // 전달할 URL
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
            } */
            
function boardScrap() {
	$.ajax({
		url : "${contextPath}/secret/boardScrap",
		type : "get",
		data : {"boardNo" : boardNo,
				"memberNo" : loginMemberNo },
		success : function (result) {
					if(result == 1){
						
						if(!loginMemberNo){
						swal({"title" : "로그인 후 이용해 주세요." , 
		                      "icon" : "error"});
						}else{
							
						$("#btnScrap").children().removeClass('grey')	
						swal({"title" : "스크랩 완료" , 
		                      "icon" : "success"});
						}

					}else if (result == 2){
			
						if(!loginMemberNo){
							swal({"title" : "로그인 후 이용해 주세요." , 
			                      "icon" : "error"});
						}else{
							$("#btnScrap").children().addClass('grey')	
							swal({"title" : "스크랩 해제" , 
		                      "icon" : "success"});
						}	
			
					}
				},
	
	error: function (xhr, status, error) {
				swal({"title" : "서버 연결 오류" , 
                     "icon" : "error"});
				}
		
	})

}
        		
        		
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
			url : "${contextPath}/secret/insertEmpathy",
			data : {"boardNo" : boardNo,
					"memberNo" : loginMemberNo,
					"empathyStatusCode" : empathyStatusCode},
			context: this,
			success : function (result) {
				
				if(result >=1){
			
					$.ajax({
						url : "${contextPath}/secret/countEmpathy",
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
        	
</script>
<script src="${contextPath}/resources/js/board/replyCopy.js"></script>



