<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<table class="table">
    <thead>
        <tr>
            <th scope="col-8">제목</th>
            <th scope="col-1">Do</th>
            <th scope="col-1">Re</th>
            <th scope="col-1">See</th>
            <th scope="col-1">Day</th>
        </tr>
    </thead>
    <tbody>
    <c:forEach var="v" items="${planList}">
        <tr>
            <td><a href="/detail/${v.planId}">${v.planTitle}</a></td>
            <td>
                <c:if test="${v.doState eq 'Y'}">O</c:if>
                <c:if test="${v.doState eq 'N'}">X</c:if>
            </td>
            <td>${v.replyCount}</td>
            <td><c:if test="${v.seeId ne null}">O</c:if></td>
            <td>
                <fmt:formatDate value="${v.planEndDate}" pattern="M.dd" type="date"/>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
