
// 프로필 누를 시 유저 메뉴
$(document).on("click", ".writer_pic", function() {
	$(this).next().toggle();
});
let muteMember;
// 회원 차단
$(document).on("click", ".block", function(){

	muteMember = $(this).parent().next().val();
	var answer = confirm("차단하시겠습니까?");

	console.log(muteMember);
	if(answer){
		$.ajax({
			url : "block",
			data : {"muteMember" : muteMember},
			success : function(result){
				console.log(result)
				if(result > 0){
					swal({"title" : "차단되었습니다." ,
						"icon" : "success"}).then(function(){
						location.reload();
					});

				} else{
					swal({"title" : "회원 차단 실패" ,
						"icon" : "error"});
				}
			}
		});
	}

});

//리로드 
function reload() {
	$(".free_board_list_wrap").empty();
	getFreeList();
}



