<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%@ include file="template/header.jsp" %>
<table>
    <tr>
        <th>제목</th>
        <th>작성자</th>
        <th>댓글수</th>
        <th>남은시간</th>
    </tr>

    <c:forEach var="plan" items="${planList}">
    <tr>
        <td><a href="/plan/${plan.planId}">${plan.planTitle}</a></td>
        <td>${plan.username}</td>
        <td>${plan.replyCount}</td>
        <td>${plan.planRegDate}</td>
    </tr>
    </c:forEach>
</table>
</body>
</html>