

const color = "rgb(179, 162, 140)";

$(document).on("click", ".div-btn", function(){
    const index = $(this).index();
    $(this).css("background-color", color);
});

function colorSet(){
    const view = $(".message-view");

    for(let i = 0; i < view.length; i++){
        if(i % 2 == 0)  view.eq(i).css("background-color", "#FCF7F3");
        else            view.eq(i).css("background-color", "white");
    }
}
colorSet();

$(document).on("click", ".message-view", function(){

    const per = $(this).children().eq(0).text();
    const msg = $(this).children().eq(1).text();
    const date = $(this).children().eq(2).text();



    layerPopup("letter");
    // $("#letter_area").css("display", "block");

    // $(".layer_popup_content").css("width", "500px").css("height", "500px");

});

