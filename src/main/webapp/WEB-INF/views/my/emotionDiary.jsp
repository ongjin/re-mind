<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
	<form action="${contextPath}/my/emotionDiary" method="POST" onsubmit="return validate();">
		<input type="hidden" name="emotionArray" class="emotion_array">
		<input type="hidden" name="stressArray" class="stress_array">
		<div class="emotion_diary">
			<div class="title">감정 기록</div>
			<div class="progress_area">
				<div class="sub_title"><strong>오늘의 기분을 기록해 보세요.</strong></div>

				<div class="progress_statistic">
					<div class="progress_bar">
						<div class="name">
							행복 
							<span>0%</span>
						</div>
						<progress class="type01 happy" max="100" value="0"></progress>
					</div>
					<div class="progress_bar">
						<div class="name">
							불안 
							<span>0%</span>
						</div>
						<progress class="type02 misery" max="100" value="0"></progress>
					</div>
					<div class="progress_bar">
						<div class="name">
							우울 
							<span>0%</span>
						</div>
						<progress class="type03 depression" max="100" value="0"></progress>
					</div>
					<div class="progress_bar">
						<div class="name">
							스트레스 
							<span>0%</span>
						</div>
						<progress class="type04 stress" max="100" value="0"></progress>
					</div>

				</div>
			</div>

			<div class="option_area">
				<div class="sub_title"><strong>스트레스 증상이 있었나요?</strong></div>

				<div class="option_statistic">
					<ul>
						<c:forEach items="${emotionCategoryList}" var="emotionCategory">
							<li>
								<input type="checkbox" name="stress" id="option${emotionCategory.emotionCategoryCode}" value="${emotionCategory.emotionCategoryCode}">
								<label for="option${emotionCategory.emotionCategoryCode}">${emotionCategory.emotionCategoryName}</label>
							</li>
						</c:forEach>
					</ul>
				</div>

				<div class="agree_area">
					<input type="checkbox" name="stressAgree" id="stressAgree">
					<label for="stressAgree">상담사에게 공개</label>

				</div>
			</div>

			<div class="diary_area">
				<div class="sub_title"><strong>오늘의 감정 일기</strong></div>
				<textarea name="emotionContent" class="emotionContent" placeholder="오늘 있었던 일을 맘 껏 풀어놓으세요."></textarea>
				<div class="agree_area">
					<input type="checkbox" name="diaryAgree" id="diaryAgree">
					<label for="diaryAgree">상담사에게 공개</label>
				</div>
			</div>
			<div class="submit_area">
				<button>등록하기</button>
				<button type="button" onclick="location.href='${contextPath}/my/emotionRecord';">안쓸래요</button>
			</div>
		</div>
	</form>


</article>

<!-- header include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script>
	$(function () {
		const emotionRecordData = JSON.stringify(${emotionRecordData});

		if (emotionRecordData != "null") {
			const emotionDiary = JSON.parse(emotionRecordData);

			// progress bar
			let index = 0;
			const emotionArray = JSON.parse(emotionDiary.emotionArray);
			$.each(emotionArray, function (key, value) {
				let progressName = $(".progress_bar").eq(index).children();
				progressName.children().text(value + "%");
				progressName.val(value);
				index++;
			});

			// stress
			const optionInput = $(".option_statistic li input");
			$.each(optionInput, function (key, value) {
				if ($.inArray($(this).val(),  (emotionDiary.stressArray).split(",")) >= 0) {
					$(this).prop("checked", true);
				}
			});

			// content
			$(".emotionContent").val(XSS(emotionDiary.emotionContent));

			// 스트레스 상담사 공개
			if (emotionDiary.stressAgree == 1) {
				$("#stressAgree").prop("checked", true);
			}

			// 감정일기 상담사 공개
			if (emotionDiary.diaryAgree == 1) {
				$("#diaryAgree").prop("checked", true);
			}
		}
	});



	$("progress").on("click", function () {
		const value = $(this).val();
		let changeValue = 0;
		if (value >= 0 && value < 100) {
			changeValue = value + 25;
			if (changeValue > 100) {
				changeValue = 100;
			}

		} else if (value >= 100) {
			changeValue = 0;
		}

		$(this).val(changeValue);
		$(this).prev().children().html(changeValue + "%")
	});

	function validate() {
		let result = false;

		const emotion = {
			happy :  $(".progress_bar .happy").val(),
			misery : $(".progress_bar .misery").val(),
			depression : $(".progress_bar .depression").val(),
			stress : $(".progress_bar .stress").val()
		};

		const stress = [];
		$("input:checked[name='stress']").each(function () {
			stress.push($(this).val());
		});

		$(".emotion_array").val(JSON.stringify(emotion));
		$(".stress_array").val(stress);

		if ($("#stressAgree:checked").val() == "on") {
			$("#stressAgree").val(1);
		} else {
			$("#stressAgree").val(0);
		}

		if ($("#diaryAgree:checked").val() == "on") {
			$("#diaryAgree").val(1);
		} else {
			$("#diaryAgree").val(0);
		}

		const emotionContent = $(".emotionContent");
		const loginMember = "${loginMember.memberNo}";
		if (loginMember == "") {
			alert("로그인이 필요 합니다.");
			layerPopup("loginType");
		} else if (emotionContent.val().trim() == "") {
			alert("내용을 작성해 주세요");
			emotionContent.val("");
		} else {
			result = true;
		}

		return result;

	}

</script>