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
<h1>plan detail</h1>
<div>
    <p>${plan.planId}</p>
    <p>${plan.planTitle}</p>
    <p>${plan.planMemo}</p>
    <p>${plan.planEndDate}</p>
    <p>${plan.planRegDate}</p>
    <p>${plan.username}</p>
    <p>${plan.planCategory}</p>
    <table>
        <tr>
            <th>유저명</th>
            <th>내용</th>
            <th>날자</th>
        </tr>
        <c:forEach var="reply" items="${replyList}">
            <tr>
                <td>${reply.username}</td>
                <td>${reply.replyMemo}</td>
                <td>${reply.replyDate}</td>
            </tr>
        </c:forEach>
        <tr>
            <td colspan="3">
                <form action="/reply">
                    <input type="text" name="reply">
                    <button type="submit">전송</button>
                </form>
            </td>
        </tr>
    </table>
    <div>
        <sec:authentication property="name" var="username"/>
        <c:if test="${username eq plan.username}">
            <form action="/plan/check" method="post">
                <input type="hidden" name="planId" value="${plan.planId}">
                <input type="hidden" name="doState" value="Y">
                <button type="submit">완료</button>
            </form>
            <form action="/plan/check" method="post">
                <input type="hidden" name="planId" value="${plan.planId}">
                <input type="hidden" name="doState" value="N">
                <button type="submit">포기</button>
            </form>
        </c:if>
    </div>
</div>
</body>
</html>