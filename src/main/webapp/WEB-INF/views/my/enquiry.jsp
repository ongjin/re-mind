<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/my/enquiry.css">
<!-- header include -->
<jsp:include page="../common/header.jsp"></jsp:include>

<article class="main_content">
    <div class="enquiry-page">문의사항</div>
    <div class="enquiry-btn-wrap">
    <div class="enquiry-btn">문의사항 작성</div>
    </div>
    <hr>
    <table>
        <thead>
        <tr>
            <th class="thead-th">날짜</th>
            <th class="thead-th">내용</th>
            <th class="thead-th">답변여부</th>
        </tr>
        </thead>
        <tbody>
        <tr class="enquiry-view">
            <td>2022.01.01</td>
            <td>안녕하세요</td>
            <td>처리중</td>
        </tr>
        <tr class="enquiry-view">
            <td>2021.11.21</td>
            <td>안녕하세요. 가입을 축하드립니다.</td>
            <td>처리중</td>
        </tr>
        <tr class="enquiry-view">
            <td>2021.05.17</td>
            <td>안녕하세요 반가워요 반가워요 반가워요 가워요안녕하세요 반가워요 반가워요 반가워요 가워요안녕하세요 반가워요 반가워요 반가워요 가워요안녕하세요 반가워요 반가워요 반가워요 가워요</td>
            <td>
                <div class="enquiry-success">답변완료</div>
            </td>
        </tr>
        </tbody>
    </table>

</article>

<article class="main_content_phone">
    <div class="enquiry-page">문의사항</div> 총 3개

    <div class="enquiry-info">
        <hr>
        <div class="enquiry">
            <div class="enquiry-1">
                <div>2022.01.22</div>
                <div>처리중</div>
            </div>
            <div class="enquiry-2">안녕하세요. 상담 신청해주셔서 감사합니다~</div>
            <hr>
        </div>

        <div class="enquiry">
            <div class="enquiry-1">
                <div>2022.01.22</div>
                <div>처리중</div>
            </div>
            <div class="enquiry-2">안녕하세요. 상담 신청해주셔서 감사합니다~</div>
            <hr>
        </div>

        <div class="enquiry">
            <div class="enquiry-1">
                <div>2022.01.22</div>
                <div >답변완료</div>
            </div>
            <div class="enquiry-2">안녕하세요. 상담 신청해주셔서 감사하지 않습니다~안녕하세요. 상담 신청해주셔서 감사하지 않습니다~안녕하세요. 상담 신청해주셔서 감사하지 않습니다~안녕하세요. 상담 신청해주셔서 감사하지 않습니다~안녕하세요. 상담 신청해주셔서 감사하지 않습니다~안녕하세요. 상담 신청해주셔서 감사하지 않습니다~안녕하세요. 상담 신청해주셔서 감사하지 않습니다~안녕하세요. 상담 신청해주셔서 감사하지 않습니다~안녕하세요. 상담 신청해주셔서 감사하지 않습니다~</div>
            <hr>
        </div>
    </div>
</article>

<!-- footer include -->
<jsp:include page="../common/footer.jsp"></jsp:include>
<script src="${contextPath}/resources/js/my/enquiry.js"></script>