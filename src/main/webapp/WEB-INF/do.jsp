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

<h1>Do</h1>
<table>
    <tr>
        <th>계획</th>
        <th>완료상태</th>
        <th>완료일자</th>
    </tr>

    <c:forEach var="do1" items="${doList}">
        <tr>
            <td>${do1.planTitle}</td>
            <td>${do1.doState}</td>
            <td>${do1.doDate}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>