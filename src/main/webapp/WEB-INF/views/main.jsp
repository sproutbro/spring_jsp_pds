<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<table class="table">
    <thead>
        <tr>
            <th scope="col-8">제목</th>
            <th scope="col-2">댓글</th>
            <th scope="col-2">d-day</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="plan" items="${planList}">
        <tr>
            <td><a href="/plan/${plan.planId}">${plan.planTitle}</a></td>
            <td>${plan.replyCount}</td>
            <td>
                <fmt:formatDate value="${plan.planEndDate}" pattern="M-dd" type="date"/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
