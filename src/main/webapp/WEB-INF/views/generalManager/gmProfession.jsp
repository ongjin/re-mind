<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<jsp:include page="gmHeader.jsp"/>

<div style="margin-top: 30px; float: right; width: 100%">
    <table id="foo-table" class="table table-bordered">
        <thead>
        <tr>
            <th style="width: 10%;">Email</th>
            <th style="width: 10%;">Name</th>
            <th style="width: 10%;">Phone</th>
            <th style="width: 10%;">Register Date</th>
            <th style="width: 10%;">HospitalName</th>
            <th style="width: 15%;">전문가 등록 상태</th>
            <th style="width: 15%;">변경</th>
        </tr>
        </thead>
        <tbody></tbody>
    </table>
</div>

<script>
    let pageIndex = 1;
</script>
<jsp:include page="gmFooter.jsp"/>
