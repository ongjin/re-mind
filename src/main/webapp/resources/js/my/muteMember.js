$(".mute-delete").on("click", function (){
    const index = $(".mute-delete").index($(this));
    const muteNo = $(this).attr("id");

    $.ajax({
        url:"clearMember",
        data:{"muteNo": muteNo},
        success:function (result){
            console.log(result)
            if(result > 0){
                swal({
                    title: "차단 해제하셨습니다.",
                    text: "",
                    icon: "success",
                    button: "확인",
                    closeOnClickOutside : false
                }).then(function (){
                    location.href = contextPath+"/my/muteMember";
                });
            }
        }
    });
});