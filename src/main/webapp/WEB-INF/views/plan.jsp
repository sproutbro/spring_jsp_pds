<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h1>plan</h1>
<table class="table">
    <tr>
        <th class="col-10">제목</th>
        <th class="col-2">d-day</th>
    </tr>
    <c:forEach var="plan" items="${planList}">
        <tr>
            <td><a href="/plan/${plan.planId}">${plan.planTitle}</a></td>
            <td><fmt:formatDate value="${plan.planEndDate}" pattern="M-dd" type="date"/></td>
        </tr>
    </c:forEach>
</table>
<a href="/plan/write">글쓰기</a>
