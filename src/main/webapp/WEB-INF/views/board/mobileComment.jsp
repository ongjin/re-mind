<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

            <section class="main_content">    
                <!-- 메인 -->

                <div class="back_btn">
                    <a href="">
                        <i class="fas fa-arrow-left"></i> 
                    </a>
                </div>

                <article class="comment_view_wrap">
                    <div class="comment_top dark-brown">
                        <div>
                            <i class="far fa-comment"></i>
                            <span>댓글</span> 
                            <span>(55)</span>
                        </div>
                    </div>


                    <div class="comment_list">
                        <div class="comment_view">
                            <div class="user_info">
                                <div class="user_pic light_brown_bg" style="background-image: url();">
                                </div>

                                <div>
                                    <p>아이디</p>
                                </div>
                            </div>

                            <div class="comment">
                                <p>dhdhdhdhspr ljdn vg;wori</p><br>
                                <p class="comment_time">14분전</p>
                            </div>

                            <div class="comment_btn">
                                <button type="button" class="dark-brown edit_btn re-comment" onclick="comentToggle();"> 답글(3) </button>
                                <!--  자신이 쓴 댓글에 보이기 -->
                                <!-- <button class="dark-brown"> 수정 </button>
                                <button class="dark-brown"> 삭제 </button> -->
                            </div>
                        </div>
                        <!-- 대댓글일 경우 클래스 child 붙이기  -->
                            <div class="comment_view child ">
                                <div class="user_info">
                                    <div class="user_pic light_brown_bg" style="background-image: url();">
                                    </div>

                                    <div>
                                        <p>아이디</p>
                                    </div>
                                </div>

                                <div class="comment">
                                    <p>dhdhdhdhspr ljdn vg;wori</p><br>
                                    <p class="comment_time">14분전</p>
                                </div>

                                <div class="comment_btn">
                                    <button type="button" class="dark-brown edit_btn re-comment" onclick=""> 답글 </button>
                                    <!-- 자신이 쓴 댓글에 보이기 -->
                                    <button type="button" class="dark-brown edit_btn" onclick=""> 수정 </button>
                                    <button type="button" class="dark-brown edit_btn" onclick=""> 삭제 </button>
                                </div>
                            </div>
                    </div>
                </article>


                
                <form action="" class="comment_form">
                    <div class="write_comment">
                        
                        <div class="user_info">
                            <div class="user_pic light_brown_bg" style="background-image: url();">
                            </div>

                            <div>
                                <p>아이디</p>
                            </div>
                        </div>

                        <textarea name="" id="" rows="3"></textarea>
                        <button class="option_btn dark_brown_bg"> 등록 </button>
                    </div>
                </form>

            
            </section>
        </div>


    
    </main>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script type="text/javascript" src="${contextPath}/resources/js/board/comunity_worry_board.js"></script>

</body>
</html>
