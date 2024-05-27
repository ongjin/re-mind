$("#map").css("height", window.innerHeight);

const menuWarp = $("#menu-warp");
const menuView = $("#menu-view");
const menuAll = $("#menu-warp, #menu-view");

// edge는 안되니깐 종료시킴 ㅅㄱ
if(navigator.userAgent.toLowerCase().indexOf("edg") !== -1){
    // parent.window.open('about:blank', '_self').close();
}

$("#placesList").empty();

let backupWidth = window.innerWidth;
window.onresize = function(){
    var innerWidth = window.innerWidth;
    var innerHeight = window.innerHeight;

    // $("#map") height == 웹 height
    $("#map").css("height", innerHeight);

    locationReolad(innerWidth, backupWidth);

    backupWidth = innerWidth;

}


function locationReolad(now, backup){
    if(now != backup)   location.reload();
}





// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
// var infowindow = new kakao.maps.InfoWindow({ zIndex: 1 });

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();
// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);







// 현재 위치담을 변수 선언
var currentPos;
function locationLoadSuccess(pos) {
    // 현재 위치 받아오기
    currentPos = new kakao.maps.LatLng(pos.coords.latitude, pos.coords.longitude);

    // 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
    map.panTo(currentPos);

    // 마커 생성
    var marker = new kakao.maps.Marker({
        position: currentPos
    });

    // 마커가 지도 위에 표시되도록 설정합니다
    marker.setMap(map);
    map.setCenter(currentPos);

    // 기존에 마커가 있다면 제거
    // marker.setMap(null);

};

function locationLoadError(pos) {
    alert('위치 정보를 가져오는데 실패했습니다.');
}
function getCurrentPosBtn() {
    navigator.geolocation.getCurrentPosition(locationLoadSuccess, locationLoadError);
}
getCurrentPosBtn();


// info 여러개 닫으려고
var info = [];
// 바깥에서 쓰기 위해서
let backupIndex = 0;
// 상세뷰 만들기
$(document).on("click", ".map-info", function () {

    // 선택한 요소 인덱스
    const index = $(".map-info").index(this);
    backupIndex = index;

    // 선택한 요소 제목 $(".option-view")에 만들기
    $("#menu-view").css("visibility", "visible");
    $(".option-view").html("<a href='http://localhost:8080/mind/pro/proView/"+ professionNo[index] + "'><h2 style='font-size: 20px; font-weight: bold;'>" + proHospName[index] + "</h2></a>" +  "심리상담센터");
    $(".location-span").text(proAddress[index]);
    $(".location-tel").text(proHospPhone[index]);
    $(".location-internet").text("http://인터넷주소.com");
    $(".talk-b-span1").text("ex)아동상담");
    $(".talk-b-span2").text("ex)발달검사, 진로/적성검사");

    // 인포윈도우로 장소에 대한 설명을 표시합니다
    infowindow = new kakao.maps.InfoWindow({
        content: '<div style="width:150px;text-align:center;padding:6px 0;">' + proHospName[index] + '</div>'
    });

    // info.close
    for(key in info)    info[key].close();
    info[index] = infowindow;

    infowindow.open(map, markerArr[index]);

    // 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
    map.panTo(hospi[index]);

    // $(".admin-query").attr("href", "문의사항으로 이동");
});



// 미리 병원 정보들 배열에 저장
// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();
// 내 위치와 병원 위치의 거리
var distance = [];
// 병원위치 담을 곳
var hospi = [];
// 결과값으로 받은 위치를 마커로 표시합니다
var markerArr = [];
// 인포윈도우로 장소에 대한 설명을 표시합니다
var infowindow;
var linePath = [];
var polyline = [];
var hospLocation = [];
var hospLocationSplit = [];
function AddrChangeCoords(){
    // 병원명
    // for(let i = 0; i < $(".map-info").length; i++){
    //     hospLocation[i] = $(".map-info").eq(i).children().last().children().last().prev().text();
    //     hospLocationSplit[i] = hospLocation[i].split("| ")[1];
    // }

    for(let i = first - 1; i < last; i++){
        // 주소로 좌표를 검색합니다
        geocoder.addressSearch(proAddress[i]/* 병원 주소 */, function (result, status) {
            // status == OK or ZERO_RESULT

            // 정상적으로 검색이 완료됐으면
            if (status == kakao.maps.services.Status.OK) {

                hospi[i] = new kakao.maps.LatLng(result[0].y, result[0].x);
                // 내 위치 ~ 병원[i]의 직선거리 계산을 위한 배열로 저장
                linePath[i] = [currentPos, hospi[i]];

                // 결과값으로 받은 위치를 마커로 표시합니다
                markerArr[i] = new kakao.maps.Marker({
                    map: map,
                    position: hospi[i]
                });
                // // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                // map.setCenter(currentPos);


            } else if (status == "ZERO_RESULT") {
                // alert("검색결과가 없습니다.");
            }

            polyline[i] = new kakao.maps.Polyline({
                path: linePath[i] // 선을 구성하는 좌표배열 입니다
            });
            distance[i] = Math.round(polyline[i].getLength());

            if(distance[i] > 1000){
                distance[i] = Math.floor(distance[i] / 1000);
                $(".distance").eq(i).text(distance[i] + 'km | ' + proAddress[i]);
            }else{
                $(".distance").eq(i).text(distance[i] + 'm | ' + proAddress[i]);
            }

            console.log("distance : " + distance)
        });
    }
}


function makeProList(){
    for(let i = first - 1; i < last; i++){

        if(i == listCount)
            return;

        const ul = $("#placesList");

        const li = $('<li class="item">');

        const divMap = $('<div class="map-info">');

        const divImg = $('<div class="img-img" style="width: 20%;">');
        const img = $("<img src=" + contextP + "/resources/images/my/premium-icon-hospital-3606564.png>");

        divImg.append(img);

        const divCon = $('<div class="container" style="width: 75%; display: inline-block;">');
        const divH3 = $('<h3 style="margin-bottom: 10px;">' + proHospName[i] + '</h3>');
        const divDepartment = $('<div style="margin-bottom: 10px;">심리 상담 센터</div>');

        let divDistance;
        if(distance[i] > 1000){
            distance[i] = Math.floor(distance[i] / 1000);
            divDistance = $('<div class="distance" style="margin-bottom: 10px;"> ' + distance[i] + 'km | ' + proAddress[i] + '</div>');
        }else{
            divDistance = $('<div class="distance" style="margin-bottom: 10px;"> ' + distance[i] + 'm | ' + proAddress[i] + '</div>');
        }
        const divPhone = $('<div style="margin-bottom: 10px;">' + proBusinessNo[i] + '</div>');
        divCon.append(divH3, divDepartment, divDistance, divPhone);
        divMap.append(divImg, divCon);

        li.append(divMap);
        ul.append(li);
    }
}


// 페이지네이션(무한스크롤 변수 선언)
var currentPage = 1;
var infinityLimit = 10; // 한번에 보여질 result 수
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
}
calcPagination();


// 무한스크롤
function YesScroll () {
    if(last >= listCount)	return;

    let oneTime = false;
    $("#menu-warp").on("mousewheel", function (e){
        const menu = $("#menu-warp");

        const scrollLocation = menu.scrollTop(); //현재 스크롤 바 위치
        const windowHeight = Number.parseInt(menu.css("height").split("px")[0]);  // 화면으로 보이는 스크린 화면의 높이
        const scrollHeight = document.querySelector("#menu-warp").scrollHeight; // 스크롤 높이

        if (scrollLocation + windowHeight >= scrollHeight && !oneTime) {
            oneTime = true;
            currentPage = currentPage + 1;
            calcPagination();
            getHospital();
        }
    });
}


let proAddress = [];
let proHospName = [];
let proHospPhone = [];
let proBusinessNo = [];
let professionNo = [];
let len;
function getHospital(){
    $.ajax({
        url:"loadProMap",
        data:{
            "last":last,
            "first":first
        },
        type:"GET",
        dataType : "json",
        success:function (result){
            len = result.length;

            $.each(result, function (i, item){

                if(result.length - 1 == i){
                    listCount = Number.parseInt(item.maxValue);
                    return;
                }

                professionNo[first - 1 + i] = item.professionNo;
                proAddress[first - 1 + i] = item.hospitalAddress;
                proHospName[first - 1 + i] = item.hospitalName;
                proHospPhone[first - 1 + i] = item.hospitalPhone;
                proBusinessNo[first - 1 + i] = item.businessNo;
            });
        },
        error:function (req, sta, er){
            console.log(req.responseText);
            console.log(er)
        }
    }).done(function (){
        YesScroll();
        AddrChangeCoords();
        makeProList();
        // setTimeout(makeProList, 200);
    });
}
getHospital();



if(window.innerWidth > 1200){
    // 웹이면
    menuWarp.css("top", "0").css("height", innerHeight - 20);

    // menuWarp, menuView 클릭 시
    $(document).on("click", menuAll, function(){

        // menuView 스타일에 visibility == visible true였으면
        if(menuView.css("visibility") == "visible"){
            // #quit가 클릭되었는지 체크하고
            $(document).on("click", "#quit", function() {
                // true면 menuWarp 올림
                menuWarp.css("top", "0");
            });
        }

    })
}else if(window.innerWidth <= 1200){
    menuWarp.css("top", (innerHeight - 60) + "px").css("height", innerHeight);
    $(".upArrow > img").attr("src", contextPath + "/resources/images/my/upload.png");

    // menuWarp, menuView 클릭 시
    $(document).on("click", menuAll, function(){

        // 병원 클릭 시
        $(".map-info").on("click", function(){
            if(menuView.css("visibility") == "hidden"){
                // menuWarp 내림
                menuWarp.css("top", (innerHeight - 60) + "px").css("height", innerHeight);
            }
        });

        // menuView 스타일에 visibility == visible true였으면
        if(menuView.css("visibility") == "visible"){
            // #quit가 클릭되었는지 체크하고
            $(document).on("click", "#quit", function() {
                // true면 menuWarp 올림
                menuWarp.css("top", "0");
            });
        }

    });


    $(document).on("click", ".upArrow", function(){
        if($(".upArrow").hasClass("downArrow")){
            $(".upArrow").removeClass("downArrow");
            $(".upArrow").addClass("upArrowdd");
            menuWarp.css("top", (innerHeight - 60) + "px");
        }else{
            $(".upArrow").removeClass("upArrowdd");
            $(".upArrow").addClass("downArrow");
            menuWarp.css("top", "0");
        }
    });
}









// 이건뭐지? 이런거 만든적없는데...
// var callback = function(result, status) {
//     if (status === kakao.maps.services.Status.OK) {
//         console.log('그런 너를 마주칠까 ' + result[0].address.address_name + '을 못가');
//     }
// };
// geocoder.coord2Address(currentPos.getLng(), currentPos.getLat(), callback);


// 좌표로 상세주소
var myDetailAddr;
function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}
function getHospAddress() {
    searchDetailAddrFromCoords(currentPos, function(result, status) {
        if (status === kakao.maps.services.Status.OK) {
            myDetailAddr = !!result[0].road_address ? result[0].road_address.address_name : '';
        }
    });
}
// $(function(){
//     getHospAddress();
// });
setTimeout(function (){
    getHospAddress();
}, 500);




// 길찾기
function loadSearch(){
    return 'https://map.kakao.com/?sName=' + myDetailAddr +
        '&eName=' + proAddress[backupIndex];
}

// 상세뷰 x 클릭
$(document).on("click", "#quit", function () {
    $("#menu-view").css("visibility", "hidden");
});

// 내 위치로 이동
$(document).on("click", ".option", function(){
    // 지도 이동(기존 위치와 가깝다면 부드럽게 이동)
    map.panTo(currentPos);
});

