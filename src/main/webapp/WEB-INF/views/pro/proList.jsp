<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content2">
	<div id="pro_search_wrap">
		    <div id="pro_search_div">
		        <input type="text" name="proSearchInput" id="pro_searchInput" placeholder="상담사 이름 검색">
		        <div id="nameSearch"><img src="${contextPath}/resources/images/pro/loupe.png" style="width:23px;"></div>
		    </div>
	    </div>
	    <div id="mobile_pro_category_warp">
	        <button id="mobile_category_btn">
	            <img src="${contextPath}/resources/images/pro/pro_category_mobile.png" class="float-left mobile_category_img">
	            <p class="float-left">전체필터보기</p>
	        </button>
	        <div id="mobile_pro_category">
	            <div id="mobile_pro_category_title">
	                <h2 class="float-left">전체필터보기</h2>
	                <img src="${contextPath}/resources/images/pro/cancel.png" id="category_cancel_btn" class="float-right">
	            </div>
	            <div id="mobile_pro_category_keyword">
	                <h2 class="pro_category_title">나의 고민 키워드</h2>
	                <p>*상담받고 싶은 고민과 나를 설명하는키워드를 선택해주세요.<br>(최대 5개 선택가능) </p>
	                <div style="margin-top: 20px;">
	                    <button type="button" class="mobile_cate_btn" value="1">일반고민</button>
	                    <button type="button" class="mobile_cate_btn" value="2">취업/진로</button>
	                    <button type="button" class="mobile_cate_btn" value="3">직장</button>
	                    <button type="button" class="mobile_cate_btn" value="4">연애</button>
	                    <button type="button" class="mobile_cate_btn" value="5">성추행</button>
	                    <button type="button" class="mobile_cate_btn" value="6">결혼/육아</button>
	                    <button type="button" class="mobile_cate_btn" value="7">대인관계</button>
	                    <button type="button" class="mobile_cate_btn" value="8">외모</button>
	                    <button type="button" class="mobile_cate_btn" value="9">가족</button>
	                    <button type="button" class="mobile_cate_btn" value="10">학업/고시</button>
	                    <button type="button" class="mobile_cate_btn" value="11">금전/사업</button>
	                    <button type="button" class="mobile_cate_btn" value="12">성생활</button>
	                    <button type="button" class="mobile_cate_btn" value="13">이별/이혼</button>
	                    <button type="button" class="mobile_cate_btn" value="14">중독/집착</button>
	                    <button type="button" class="mobile_cate_btn" value="15">투병/신체</button>
	                    <button type="button" class="mobile_cate_btn" value="16">정신건강</button>
	                    <button type="button" class="mobile_cate_btn" value="17">LGBT</button>
	                    <button type="button" class="mobile_cate_btn" value="18">자아/성격</button>
	                    <button type="button" class="mobile_cate_btn" value="19">따돌림</button>
	                </div>
	            </div>
	            <div>
	                <h2 class="pro_category_title">상담유형</h2>
	                <div>
	                    <ul class="moblie_pro_radio">
	                        <li>
	                            <label class="test22" for="m_unrelated">
	                                <input type="radio" id="m_unrelated" name="consultation_type" checked>
	                                <span>무관</span>
	                            </label>
	                        </li>
	                        <li>
	                            <label class="test22" for="m_text_counseling">
	                                <input type="radio" id="m_text_counseling" name="consultation_type">
	                                <span>텍스트테라피</span>
	                            </label>
	                        </li>
	                        <li>
	                            <label class="test22" for="m_voice_counseling">
	                                <input type="radio" id="m_voice_counseling" name="consultation_type">
	                                <span>보이스테라피</span>
	                            </label>
	                        </li>
	                        <li>
	                            <label class="test22" for="m_face_counseling">
	                                <input type="radio" id="m_face_counseling" name="consultation_type">
	                                <span>페이스테라피</span>
	                            </label>
	                        </li>
	                    </ul> 
	                </div>
	            </div>
	
	            <div class="clear-both">
	                <h2 class="pro_category_title">상담사 성별</h2>
	                <ul class="moblie_pro_radio">
	                    <li>
	                        <label class="test22" for="m_unrelated2">
	                            <input type="radio" id="m_unrelated2" name="pro_gender" checked>
	                            <span>무관</span>
	                        </label>
	                    </li>
	                    <li>
	                        <label class="test22" for="m_pro_male2">
	                            <input type="radio" id="m_pro_male2" name="pro_gender">
	                            <span>남자</span>
	                        </label>
	                    </li>
	                    <li>
	                        <label class="test22" for="m_pro_famale2">
	                            <input type="radio" id="m_pro_famale2" name="pro_gender">
	                            <span>여자</span>
	                        </label>
	                    </li>
	                </ul>
	            </div>
	
	            <div class="clear-both">
<!-- 	                <h2 class="pro_category_title">상담사 자격증</h2>
	                <div>
	                    <ul class="moblie_pro_radio">
	                        <li>
	                            <label class="test22" for="unrelated3">
	                                <input type="radio" id="unrelated3" name="pro_license" checked>
	                                <span>무관</span>
	                            </label>
	                        </li>
	                        <li>
	                            <label class="test22" for="pro_license_two">
	                                <input type="radio" id="pro_license_two" name="pro_license">
	                                <span>2급</span>
	                            </label>
	                        </li>
	                        <li>
	                            <label class="test22" for="pro_license_one">
	                                <input type="radio" id="pro_license_one" name="pro_license">
	                                <span>1급</span>
	                            </label>
	                        </li>
	                    </ul>
	                </div> -->
	            </div>
	        </div>
	    </div>
	    <div id="pro_category_warp">
	        <table id="pro_search">
	            <tr class="pro_tr">
	                <th><p>나의 고민 키워드</p></th>
	                <td colspan="3">
	                    <span>*상담받고 싶은 고민과 나를 설명하는키워드를 선택해주세요.(최대 5개 선택가능) </span><br>
	                    <button type="button" class="cate_btn" value="1">일반고민</button>
	                    <button type="button" class="cate_btn" value="2">취업/진로</button>
	                    <button type="button" class="cate_btn" value="3">직장</button>
	                    <button type="button" class="cate_btn" value="4">연애</button>
	                    <button type="button" class="cate_btn" value="5">성추행</button>
	                    <button type="button" class="cate_btn" value="6">결혼/육아</button>
	                    <button type="button" class="cate_btn" value="7">대인관계</button>
	                    <button type="button" class="cate_btn" value="8">외모</button>
	                    <button type="button" class="cate_btn" value="9">가족</button>
	                    <button type="button" class="cate_btn" value="10">학업/고시</button>
	                    <button type="button" class="cate_btn" value="11">금전/사업</button>
	                    <button type="button" class="cate_btn" value="12">성생활</button>
	                    <button type="button" class="cate_btn" value="13">이별/이혼</button>
	                    <button type="button" class="cate_btn" value="14">중독/집착</button>
	                    <button type="button" class="cate_btn" value="15">투병/신체</button>
	                    <button type="button" class="cate_btn" value="16">정신건강</button>
	                    <button type="button" class="cate_btn" value="17">LGBT</button>
	                    <button type="button" class="cate_btn" value="18">자아/성격</button>
	                    <button type="button" class="cate_btn" value="19">따돌림</button>
	                </td>
	            </tr>
	            <tr class="pro_tr">
	                <th><p>상담유형</p></th>
	                <td colspan="3">
	                    <ul class="pro_radio">
	                        <li>
	                            <input class="therapy" type="radio" id="unrelated" name="consultation_type" checked>
	                            <label for="unrelated">무관</label>
	                        </li>
	                        <li>
	                            <input class="therapy" type="radio" id="text_counseling" name="consultation_type">
	                            <label for="text_counseling">텍스트테라피</label>
	                        </li>
	                        <li>
	                            <input class="therapy" type="radio" id="voice_counseling" name="consultation_type">
	                            <label for="voice_counseling">보이스테라피</label>
	                        </li>
	                        <li>
	                            <input class="therapy" type="radio" id="face_counseling" name="consultation_type">
	                            <label for="face_counseling">페이스테라피</label>
	                        </li>
	                    </ul>
	                </td>
	            </tr>
	            <tr class="pro_tr">
	                <th><p>상담사 성별</p></th>
	                <td>
	                    <ul class="pro_radio">
	                        <li>
	                            <input class="gender" type="radio" id="unrelated2" name="pro_gender" checked>
	                            <label for="unrelated2">무관</label>
	                        </li>
	                        <li>
	                            <input class="gender" type="radio" id="pro_male" name="pro_gender">
	                            <label for="pro_male">남자</label>
	                        </li>
	                        <li>
	                            <input class="gender" type="radio" id="pro_famale" name="pro_gender">
	                            <label for="pro_famale">여자</label>
	                        </li>
	                    </ul>
	                </td>
	                </tr>
	                <!-- <th><p>상담사 자격증</p></th>
	                <td>
	                    <ul class="pro_radio">
	                        <li>
	                            <input type="radio" id="unrelated3" name="pro_license" checked>
	                            <label for="unrelated3">무관</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="pro_license_two" name="pro_license">
	                            <label for="pro_license_two">2급</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="pro_license_one" name="pro_license">
	                            <label for="pro_license_one">1급</label>
	                        </li>
	                    </ul>
	                </td>
	            </tr>
	            <tr class="pro_tr">
	                <th><p>상담 가능 요일</p></th>
	                <td>
	                    <ul class="pro_radio">
	                        <li>
	                            <input type="radio" id="unrelated4" name="consultation_week" checked>
	                            <label for="unrelated4">무관</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="weekday" name="consultation_week">
	                            <label for="weekday">평일</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="weekend" name="consultation_week">
	                            <label for="weekend">주말</label>
	                        </li>
	                    </ul>
	
	                </td>
	                <th><p>우수 후기 선정</p></th>
	                <td>
	                    <ul class="pro_radio">
	                        <li>
	                            <input type="radio" id="unrelated5" name="best_review" checked>
	                            <label for="unrelated5">무관</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="best_review_one" name="best_review">
	                            <label for="best_review_one">1회 이상</label>
	                        </li>
	                        <li>
	                            <input type="radio" id="best_review_five" name="best_review">
	                            <label for="best_review_five">5회 이상</label>
	                        </li>
	                    </ul>
	                </td>
	            </tr> -->
	        </table>
	    </div>
	    <div id="pro_list_wrap">
	        <ul id="pro_list">
				<%-- 그려지는곳 feat.무한스크롤 --%>
	        </ul>
	    </div>

</article>
<%--1001,1002,1003,1004,1005--%>
<%--where categoryNo like '%' || #{categoryNo} || '%'--%>
<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>

<script>
	// 페이지네이션(무한스크롤 변수 선언)
	var currentPage = 1;
	var infinityLimit = 2; // 한번에 보여질 result 수
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

		if(currentPage <= infinityLimit)	prevPage = 1;
		else                    prevPage = startPage - 1;

		if(endPage == maxPage) nextPage = maxPage;
		else				   nextPage = endPage + 1;

		last = currentPage * infinityLimit;
		first = last - (infinityLimit - 1) <= 0 ? 1 : last - (infinityLimit - 1);
		console.log("first : " + first, "last : " + last)
	}
	calcPagination();


	// 무한스크롤
	function YesScroll () {
		console.log("last : " + last, "listCount : " + listCount)
		if(last >= listCount)	return;

		let oneTime = false;
		document.addEventListener('scroll',OnScroll,{passive:true})
		function OnScroll () {
			const scrollLocation = document.scrollingElement.scrollTop; //현재 스크롤 바 위치
			const windowHeight = window.innerHeight;  // 화면으로 보이는 스크린 화면의 높이
			const scrollHeight = document.scrollingElement.scrollHeight; // 스크롤 높이

			if (scrollLocation + windowHeight >= scrollHeight && !oneTime) {
				oneTime = true;
				currentPage = currentPage + 1;
				calcPagination();
				makePro();
			}
		}
	}

</script>

<script type="text/javascript" src="${contextPath}/resources/js/pro/proList.js"></script>