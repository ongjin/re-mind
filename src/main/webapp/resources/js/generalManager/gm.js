function getDataTable(pageIndex){
    if(pageIndex === 0){
        $.ajax({
            url: contextPath + "/generalManager/getGmMember",
            type: "GET",
            dataType: "JSON",
            success: function (data) {
                $('#foo-table').DataTable({
                    data: data,
                    "bDestroy": true,
                    order: [[5, "desc"]],
                    columns: [
                        { data: "memberId", "defaultContent": "-" },
                        { data: "memberName", "defaultContent": "-" },
                        { data: "memberFName", "defaultContent": "-" },
                        { data: "memberAddress", "defaultContent": "-"},
                        { data: "memberPhone", "defaultContent": "-" },
                        { data: "memberDate", "defaultContent": "-" },
                        { data: "", "defaultContent": "-"}
                    ],
                    columnDefs: [
                        {
                            "targets": 6,
                            "data": null,
                            "render": function (data, type, row) {
                                let temp;
                                if(row.statusCode === 2)
                                    temp = '<button class="changeMember" value="2" id="' + row.memberNo + '">회원정지 상태</button>';
                                else
                                    temp = '<button class="changeMember" value="0" id="' + row.memberNo + '">일반회원 상태</button>';
                                return temp;
                            },
                            "orderable": false
                        },
                        {
                            "targets": 1,
                            "data": null,
                            "render": function (data, type, row) {
                                return '<a href="' + contextPath + '/generalManager/detailMember/' + row.memberNo + '" style="color: black;">' + data + '</a>';
                            },
                            // "orderable": false
                        }
                    ]
                });
            }
        });
    }else if(pageIndex === 1){
        $.ajax({
            url: contextPath + "/generalManager/getGmProfession",
            type: "GET",
            dataType: "JSON",
            success: function (data) {
                $('#foo-table').DataTable({
                    data: data,
                    "bDestroy": true,
                    order: [[4, "desc"]],
                    columns: [
                        { data: "professionId", "defaultContent": "-" },
                        { data: "professionName", "defaultContent": "-" },
                        { data: "professionPhone", "defaultContent": "-" },
                        { data: "reservationEnrollDate", "defaultContent": "-"},
                        { data: "hospitalName", "defaultContent": "-" },
                        { data: "", "defaultContent": "-"},
                        { data: "", "defaultContent": "-"}
                    ],
                    columnDefs: [
                        {
                            "targets": 5,
                            "data": null,
                            "render": function (data, type, row) {
                                let temp;
                                if(row.statusCode === 3)
                                    temp = '<span style="font-weight: bold; color: red;">N</span>';
                                else
                                    temp = '<span style="font-weight: bold; color: blue;">Y</span>';
                                return temp;
                            },
                            "orderable": false
                        },
                        {
                            "targets": 6,
                            "data": null,
                            "render": function (data, type, row) {
                                let temp;
                                if(row.statusCode === 3)
                                    temp = '<button class="changeMember" value="3" id="' + row.professionNo + '">등록 완료</button>';
                                else
                                    temp = '<button class="changeMember" value="4" id="' + row.professionNo + '">등록 취소</button>';
                                return temp;
                            },
                            "orderable": false
                        },
                        {
                            "targets": 1,
                            "data": null,
                            "render": function (data, type, row) {
                                return '<a href="#" style="color: black;">' + data + '</a>';
                            },
                            // "orderable": false
                        }
                    ]
                });
            }
        });
    }
}


$(document).on("click", ".changeMember", function (){
    const statusCode = Number.parseInt($(this).val());
    const thisMemberNo = $(this).attr("id");

    if(statusCode === 0){
        if(confirm("이 회원을 정지회원으로 변경하시겠습니까?"))
            isPrime(thisMemberNo, statusCode);
        else
            alert("취소하셨습니다.")
    }else if(statusCode === 2){
        if(confirm("이 회원을 일반회원으로 변경하시겠습니까?"))
            isPrime(thisMemberNo, statusCode);
        else
            alert("취소하셨습니다.")
    }else if(statusCode === 3){
        if(confirm("이 전문가를 등록 완료 상태로 변경하시겠습니까?"))
            changePro(thisMemberNo, statusCode);
        else
            alert("취소하셨습니다.")
    }else if(statusCode === 4){
        if(confirm("이 전문가를 등록 실패 상태로 변경하시겠습니까?"))
            changePro(thisMemberNo, statusCode);
        else
            alert("취소하셨습니다.")
    }
});
function isPrime(thisMemberNo, statusCode){
    $.ajax({
        url:contextPath + "/generalManager/isPrime",
        type:"POST",
        data:{
            "memberNo": thisMemberNo,
            "statusCode": statusCode
        },
        success:function (result){
            if(result > 0){
                alert("변경되었습니다.");
                location.reload();
            }
        }
    });
}
function changePro(thisProfessionNo, statusCode){
    $.ajax({
        url:contextPath + "/generalManager/changePro",
        type:"POST",
        data:{
            "professionNo":thisProfessionNo,
            "statusCode":statusCode
        },
        success:function (result){
            if(result > 0){
                alert("변경되었습니다.");
                location.reload();
            }
        }
    });
}

$(document).on("click", ".admin li > a", function (){
    const index = $(".admin li > a").index($(this));
    getDataTable(index);
});

$(function (){
    getDataTable(pageIndex);
});

const allEl = $(".admin li > a");
$(function (){
    allEl.removeClass("underLine");
    allEl.eq(pageIndex).addClass("underLine");
});









