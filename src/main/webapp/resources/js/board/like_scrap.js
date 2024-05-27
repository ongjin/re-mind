	//트위터 공유
	function shareTwitter() {
		var sendText = "re:maind 게시글 공유"; // 전달할 텍스트
		var sendUrl = "http://localhost:8080"+contextPath+"/free/view/"+boardNo; // 전달할 URL
		window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}

	function shareFacebook() {
		var sendUrl = "https://www.naver.com/"; // 전달할 URL
//	    var sendUrl = "http://localhost:8080"+contextPath+"/free/view/"+boardNo; // 전달할 URL
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
        				
        				console.log(result)
        				if(result == 1){
        					
        					if(!loginMemberNo){
        					swal({"title" : "로그인 후 이용해 주세요." , 
        	                      "icon" : "error"});
        					}else{
        						
        					$("#btnScrap").children().removeClass(".child")	
        					swal({"title" : "스크랩 완료" , 
        	                      "icon" : "success"});
        					}

        				}else if (result == 2){
        					
        					if(!loginMemberNo){
        						swal({"title" : "로그인 후 이용해 주세요." , 
        		                      "icon" : "error"});
        						}
        					else{
        						$("#btnScrap").children().addClass(".child")	
        						swal({"title" : "스크랩 해제" , 
        	                      "icon" : "success"});
        					}
        					
        				}else{
        					
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