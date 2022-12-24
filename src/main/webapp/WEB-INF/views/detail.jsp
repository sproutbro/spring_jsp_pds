<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<sec:authentication property="name" var="username"/>
<div class="card">
    <div class="card-body">
        <h5 class="card-title">${plan.planTitle}</h5>
        <p class="card-text">${plan.planMemo}</p>
    </div>
    <ul class="list-group list-group-flush">
        <li class="list-group-item">카테고리 : ${plan.planCategory}</li>
        <li class="list-group-item">계획일 : <fmt:formatDate value="${plan.planRegDate}" pattern="M-dd" type="date"/></li>
        <li class="list-group-item">마감일 : <fmt:formatDate value="${plan.planEndDate}" pattern="M-dd" type="date"/></li>
    </ul>
    <c:if test="${plan.doState ne null}">
        <ul class="list-group list-group-flush">
            <li class="list-group-item">완료상태 : ${plan.doState}</li>
            <li class="list-group-item">완료일자 : <fmt:formatDate value="${plan.doDate}" pattern="M-dd" type="date"/></li>
        </ul>
        <c:if test="${plan.seeDate ne null}">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">작성일 : ${plan.seeDate}</li>
                <li class="list-group-item">돌아보기 : <br/>${plan.seeMemo}</li>
            </ul>
        </c:if>
    </c:if>
    <c:if test="${username eq plan.username}">
        <div class="card-body">
            <form action="/plan/delete" method="post">
                <input type="hidden" name="planId" value="${plan.planId}">
                <button class="btn btn-primary">삭제하기</button>
            </form>
        </div>
    </c:if>
</div>
    <table class="table">
        <thead>
            <tr>
                <th>내용</th>
                <th>날짜</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="reply" items="${replyList}">
                <tr>
                    <td class="col-9">${reply.replyMemo}</td>
                    <td class="col-2"><fmt:formatDate value="${plan.planEndDate}" pattern="M-dd" type="date"/></td>
                    <td class="col-1">
                        <c:if test="${username eq plan.username || username eq reply.username}">
                            <a href="/reply/delete/${reply.replyId}">X</a>
                        </c:if>
                    </td>
                </tr>
            </c:forEach>
            <sec:authorize access="isAuthenticated()">
                <tr>
                    <td colspan="3">
                        <form action="/reply" method="post" class="row">
                            <input type="hidden" name="planId" value="${plan.planId}">
                            <div class="col-8">
                                <input type="text" class="form-control" name="replyMemo">
                            </div>
                            <div class="col-4">
                                <button type="submit" class="btn btn-primary mb-3">댓글쓰기</button>
                            </div>
                        </form>
                    </td>
                </tr>
            </sec:authorize>
        </tbody>
    </table>
    <div>
        <c:if test="${username eq plan.username}">
            <c:if test="${plan.doState eq null}">
                <table>
                    <tr>
                        <td>
                            <form action="/plan/check" method="post">
                                <input type="hidden" name="planId" value="${plan.planId}">
                                <input type="hidden" name="doState" value="Y">
                                <button class="btn btn-primary mb-3" type="submit">완료</button>
                            </form>
                        </td>
                        <td>
                            <form action="/plan/check" method="post">
                                <input type="hidden" name="planId" value="${plan.planId}">
                                <input type="hidden" name="doState" value="N">
                                <button class="btn btn-primary mb-3" type="submit">포기</button>
                            </form>
                        </td>
                    </tr>
                </table>
            </c:if>
            <c:if test="${plan.doState ne null && plan.seeDate eq null}">
            <div class="card">
                <div class="card-body">
                    <form action="/see/write" method="post" class="row">
                        <input type="hidden" name="doId" value="${plan.doId}">
                        <div class="mb-3">
                            <label for="seeMemo" class="form-label">See memo</label>
                            <textarea class="form-control" id="seeMemo" rows="3" name="seeMemo"></textarea>
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
                    </form>
                </div>
            </div>
            </c:if>
        </c:if>
    </div>
