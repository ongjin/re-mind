//* 스와이퍼 JS */
var swiper1 = new Swiper(".mySwiper1", {
    effect: "cards",
    grabCursor: true
});

var swiper2 = new Swiper(".mySwiper2", {
    spaceBetween: 30,
    centeredSlides: true,
    autoplay: {
        delay: 50000,
        disableOnInteraction: false
    },
    pagination: {
        el: ".swiper-pagination",
        clickable: true
    },
    navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev"
    }
});

// 자가진단 이동
$(".main_content1_cir").on("click", function () {
    const type = $(this).data("type");
    window.location.href = contextPath+"/selftest/selftestForm?type="+type;
});

$(".main_content2_content_board").on("click", function () {
    const categoryCode = $(this).data("category_code");
    const boardNo = $(this).data("board_no");
    locationPath(categoryCode, boardNo);
})

// 커뮤니티 상세
function locationPath(boardCategoryCode, boardNo) {
    let path = contextPath;
    switch (boardCategoryCode) {
        case 101 :
            path += "/free/view/"+boardNo;
            break;
        case 102 :
            path += "/worry/view/"+boardNo;
            break;
        case 104 :
            path += "/secret/view/"+boardNo;
            break;
    }

    window.location.href = path;
}

// 마인드포스팃
$(".main_content4_content_postit").on("click", function () {
    window.location.href = contextPath + "/post/list";
})

// 공지사항 상세
$(".main_content4_content_left_item").on("click", function () {
    const noticeNo = $(this).data("notice_no");
    window.location.href = contextPath + "/notice/view/"+noticeNo;
})
