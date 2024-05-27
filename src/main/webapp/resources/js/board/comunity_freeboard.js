
/* 모바일 글작성 모달 */
const write = document.querySelector("#free_borad_wrap")
const writing = document.querySelector("#post_textarea")
const mPosting = document.querySelector(".posting_modal_warp")
const closeBtn = document.querySelector("#closeModal")

const openModal = ()=>{
    mPosting.classList.remove("hidden")
    console.log("openmodal")
}
const closeModal = ()=>{
    mPosting.classList.add("hidden")
}


function setMobile(){
   writing.readOnly=true
   writing.value = ""
   writing.onclick = openModal
   closeBtn.onclick = closeModal
   
}

if(innerWidth <= 768){
   setMobile();
}
window.onresize = function(){
    var innerWidth = window.innerWidth;
    var innerHeight = window.innerHeight;
    
   if(innerWidth <= 768){
      setMobile();

    }else{
        writing.readOnly=false
        mPosting.classList.add("hidden")
        
    }

}

/* 모바일 대댓글 토글 */
const child = document.querySelectorAll(".comment_view child")



