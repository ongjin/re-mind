<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application" />

<!-- header include -->

<jsp:include page="../procommon/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/chatting.css">

<article class="main_content">
	<div class="chatting_area">
		<div id="exit_area">
			<button class="btn btn_outline_danger" id="exit_btn">상담 종료</button>
		</div>
		<!-- 채팅 내용 -->
		<ul>
			<c:forEach items="${list}" var="msg">
				<c:if test="${msg.professionNo == loginPro.professionNo}">
					<li class="my_chat">
						<div class="chat_col me_chat_col">
							<span class="chat">${msg.message}</span>
						</div>
						<span class="chatDate">${msg.createDate}</span>
					</li>
				</c:if>

				<c:if test="${msg.professionNo != loginPro.professionNo}">
					<li class="friend_chat">
						<img class="profile_img" src="${contextPath}/resources/images/sample4.gif">
						<div class="chat_col friend_chat_col">
							<span class="profile_name">고객 ${msg.memberName}</span>
							<span class="chat">${msg.message}</span>
						</div>
						<span class="chatDate">${msg.createDate}</span>
					</li>
				</c:if>
			</c:forEach>
		</ul>

		<div class="input_area">
			<textarea id="inputChatting" rows="3"></textarea>
			<button id="send">보내기</button>
		</div>
	</div>

</article>

<!-- header include -->
<jsp:include page="../procommon/footer.jsp"></jsp:include>

<!--------------------------------------- sockjs를 이용한 WebSocket 구현을 위해 라이브러리 추가 ---------------------------------------------->
<!-- sockjs : 웹소켓과 유사한 객체를 제공하는 JS 라이브러리 -->

<!-- https://github.com/sockjs/sockjs-client -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
	$(".chatting_area ul").scrollTop($(".chatting_area ul")[0].scrollHeight);

	// 로그인이 되어 있을 경우에만
	// /chat 이라는 요청 주소로 통신할 수 있는  WebSocket 객체 생성
	let chattingSock = new SockJS("<c:url value='/chat' />");


	const chattingNo = "${chat.chattingNo}";
	const professionNo = "${loginPro.professionNo}";
	const professionName = "${loginPro.professionName}";
	console.log(chattingNo);
	console.log(professionNo);
	console.log(professionName);

</script>

<script>
	// 보내기 버튼 클릭 시 채팅 전달
	const sendBtn = document.getElementById("send");
	sendBtn.addEventListener("click", () => {
		sendMessage();
	});

	function sendMessage() {
		const message = document.getElementById("inputChatting");

		if ( message.value.trim().length === 0) {
			alert("내용을 입력해 주세요.");
		} else {
			const obj = {};
			obj.professionNo = professionNo;
			obj.chattingNo = chattingNo;
			obj.message = message.value;
			obj.professionName = professionName;

			const nowDate = new Date(+new Date() + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '');
			obj.createDate = nowDate.toString();

			chattingSock.send(JSON.stringify(obj));

			message.value = "";
		}
	}

	Date.prototype.amPm = function (nowDate) {
		const now = new Date(nowDate);
		let amPm = now.getHours() < 12 ? "오전" : "오후";
		let hours = now.getHours() <= 12 ? now.getHours() === 0 ? '12' : ('0' + now.getHours()).slice(-2) : ('0' + now.getHours()).slice(-2) - 12 ;
		let minutes = ('0' + now.getMinutes()).slice(-2);

		const dt =  amPm + " " + hours + ":" + minutes;
		return dt;
	}

	chattingSock.onmessage = function (e) {
		const obj = JSON.parse(e.data);

		console.log(obj);

		console.log("start");

		const li = $("<li>");
		const chatCol = $("<div class='chat_col'>");
		const chatMessage = $("<span class='chat'>");
		const chatDate = $("<span class='chatDate'>");
		chatDate.html(new Date().amPm(obj.createDate));

		if (obj.message !== undefined) {
			let chat = XSS(obj.message);
			chat = chat.replaceAll("\n", "<br>");
			chatMessage.html(chat);
		} else {
			chatMessage.html( "<b>" + obj.memberName + "님이 나가셨습니다.</b>");
		}

		if (obj.professionNo === professionNo) {
			li.addClass("my_chat");
			chatCol.addClass("me_chat_col");

			chatCol.append(chatMessage);
			li.append(chatCol);
			li.append(chatDate);
		} else {
			// img
			const profileImg = $("<img class='profile_img'>");
			profileImg.attr("src", "http://localhost:8080/mind/resources/images/sample4.gif");

			// profile name
			const profileName = $("<span class='profile_name'>");
			profileName.text("고객 " + obj.memberName);
			chatCol.html(profileName);

			li.addClass("friend_chat");
			chatCol.addClass("friend_chat_col");

			chatCol.append(chatMessage);
			li.append(profileImg);
			li.append(chatCol);
			li.append(chatDate);
		}

		const chatUl = $(".chatting_area ul");
		chatUl.append(li);

		// 채팅 입력 시 스크롤을 가장 아래로 내리기
		chatUl.scrollTop(chatUl[0].scrollHeight);

	}



	// XSS 처리 함수
	function XSS(message) {
		let str = message;

		str = str.replace(/&/g, "&amp;");
		str = str.replace(/</g, "&lt;");
		str = str.replace(/>/g, "&gt;");
		str = str.replace(/"/g, "&quot;");

		return str;
	}

</script>
