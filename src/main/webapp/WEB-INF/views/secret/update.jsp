<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

            <section class="main_content">    
                <!-- 메인 -->

                <form action="update" method="post" 
			 	 enctype="multipart/form-data" role="form" onsubmit="return boardValidate();">		
	                <div class="back_btn">
	                    <a href="javascript:history.back();">
	                        <i class="fas fa-arrow-left"></i> 
	                    </a>
	                </div>
                <article class="board_update_wrap">
                    <div class="profile_wrap">
						<c:choose>
							<c:when test="${empty board.imageName}">
								<div class="writer_pic" style="background-image: url(${contextPath}/resources/images/basicProfile.png);"></div>
							</c:when>
							<c:otherwise>
								<c:choose>
									<c:when test="${anonCheckCode == 1}">
										<div class="writer_pic" style="background-image: url(${contextPath}${board.imagePath}${board.imageName});"></div>
									</c:when>
									<c:otherwise>
										<div class="writer_pic" style="background-image: url(${contextPath}/resources/images/basicProfile.png);"></div>
									</c:otherwise>
								</c:choose>
							</c:otherwise>
						</c:choose>

						<div class="writer_id">
							<p>${loginMember.memberFName}</p>
						</div>
					</div>
	                    
                    <div id= "posting">
	                        <textarea name="boardContent"  onkeydown="resize(this)" onkeyup="resize(this)">${board.boardContent}</textarea>
	                        <div class="imgWrap">
		                        <c:choose>
		                        	<c:when test="${!empty board.imgList}">
			                        	 <c:forEach items="${board.imgList}" var="img" varStatus="status">
			             		       		<div id="img${status.index}" class="boardImg"> 
			             		       		<img src="${contextPath}${img.imagePath}${img.imageName}">
							       			</div>
				                        </c:forEach>
		                        	</c:when>
		                        </c:choose>
	                        </div>
	                    </div> 
                    
                      <div class="btn_area">
							<input type="hidden" name="delete_files" id="delete_files">
	                        <div class="write_option_area">
          	            		<div class="check_box_wrap">
                                   	<select id="replyCheckCode" name="replyCheckCode">
	           	            			<c:choose>
	           	            				<c:when test="${board.replyCheckCode == 1}">
													<option value="1" selected="selected">댓글 허용</option>
													<option value="2">댓글 비허용</option>
	           	            				</c:when>
	           	            				<c:otherwise>
													<option value="1" >댓글 허용</option>
													<option value="2" selected="selected">댓글 비허용</option>
	           	            				</c:otherwise>
	           	            			</c:choose>
									</select>  
								</div>

                                <div class="check_box_wrap">
	                                 <select id="scrapCheckCode" name="scrapCheckCode">
	                                 	<c:choose>
	                                 		<c:when test="${board.scrapCheckCode == 1}">
											    <option value="1" selected="selected">스크랩 허용</option>
											    <option value="2">스크랩 비허용</option>
	                                 		</c:when>
	                                 		
	                                 		<c:otherwise>
											    <option value="1">스크랩 허용</option>
											    <option value="2" selected="selected">스크랩 비허용</option>
	                                 		</c:otherwise>
	                                 	</c:choose>
								    </select>  
                                </div>
                                       
                                <div class="check_box_wrap">
                                  	<select id="empathyCheckCode" name="empathyCheckCode">
                                  		<c:choose>
	                                 		<c:when test="${board.empathyCheckCode == 1}">
										    	<option value="1" selected="selected">공감 허용</option>
												<option value="2">공감 비허용</option>
	                                 		</c:when>
	                                 		<c:otherwise>
										    	<option value="1">공감 허용</option>
												<option value="2" selected="selected">공감 비허용</option>
	                                 		</c:otherwise>
                                		</c:choose>
									</select>  
								</div>
								
                                <div class="check_box_wrap">
                                  	<select id="anonCheckCode" name="anonCheckCode">
                                  		<c:choose>
	                                 		<c:when test="${board.anonCheckCode == 1}">
										    	<option value="1" selected="selected">닉네임 공개</option>
												<option value="2">닉네임 비공개</option>
	                                 		</c:when>
	                                 		<c:otherwise>
										    	<option value="1">닉네임 공개</option>
												<option value="2" selected="selected">닉네임 비공개</option>
	                                 		</c:otherwise>
                                		</c:choose>
									</select>  
								</div>
	                        </div>
	                    </div>
	                </article>
                        
	                <div class="edit_btn_wrap">
	                    <button type="submit" class="dark-brown edit_btn"> 수정 </button>
	                    <button type="button" class="dark-brown edit_btn" onclick="location.href='${contextPath}/secret/insert'"> 목록으로  </button>
	                </div>
	             
	              <!-- update 진행 시 사용할 게시글 번호 -->
				<input type="hidden" name="boardNo" value="${board.boardNo}">
				<input type="hidden" name="deleteImages" value="${memberNo}">
	
				</form>   

            </section>
        </div>

    </main>
<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_freeboard.js"></script>
<script>
// 댓글 버튼색 
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

// 스크랩 버튼 색 
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

// 공감 버튼 색 
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
//고민작성하기 익명
const anon = $("[name='anonCheckCode']")

if (anon.children("option:selected").val() == "1") {
	anon.css("background-color", "#A59999").css("color", "#fff");
} else {
	anon.css("background-color", "#fff").css("color", "#A59999");
}
anon.on("change", function () {
	if ($(this).children("option:selected").val() == "1") {
		$(this).css("background-color", "#A59999").css("color", "#fff");
	} else {
		$(this).css("background-color", "#fff").css("color", "#A59999");
	}
});



</script>






</body>
</html>