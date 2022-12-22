<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<div class="card">
        <div class="card-body">
            <h5 class="card-title">${plan.planTitle}</h5>
            <p class="card-text">${plan.planMemo}</p>
        </div>
        <ul class="list-group list-group-flush">
            <li class="list-group-item">카테고리 : ${plan.planCategory}</li>
            <li class="list-group-item">계획일 : ${plan.planRegDate}</li>
            <li class="list-group-item">마감일 : ${plan.planEndDate}</li>
        </ul>
    </div>
    <table class="table">
        <thead>
            <tr>
                <th>내용</th>
                <th>유저</th>
                <th>날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="reply" items="${replyList}">
                <tr>
                    <td class="col-8">${reply.replyMemo}</td>
                    <td class="col-2">${reply.username}</td>
                    <td class="col-2"><fmt:formatDate value="${plan.planEndDate}" pattern="M-dd" type="date"/></td>
                </tr>
            </c:forEach>
        </tbody>
        <tr>
            <td colspan="3">
                <form action="/reply" method="post" class="row">
                    <div class="col-8">
                        <input type="text" class="form-control">
                    </div>
                    <div class="col-4">
                        <button type="submit" class="btn btn-primary mb-3">댓글쓰기</button>
                    </div>
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
