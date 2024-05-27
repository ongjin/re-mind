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
        obj.memberNo = memberNo;
        obj.chattingNo = chattingNo;
        obj.message = message.value;
        obj.memberName = memberName;

        const nowDate = new Date(+new Date() + 3240 * 10000).toISOString().replace("T", " ").replace(/\..*/, '');
        obj.createDate = nowDate.toString();

        console.log(obj);
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
        chatMessage.html( "<b>" + obj.professionName + "님이 나가셨습니다.</b>");
    }

    if (obj.memberNo === memberNo) {
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
        profileName.text("상담사 " + obj.professionName);
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