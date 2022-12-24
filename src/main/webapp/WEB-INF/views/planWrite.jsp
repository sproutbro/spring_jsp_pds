<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="card">
    <div class="card-body">
    <form action="/plan/write" method="post">
        <div class="mb-3">
            <label for="planTitle" class="form-label">New plan</label>
            <input type="text" class="form-control" id="planTitle" name="planTitle">
        </div>
        <div class="mb-3">
            <label for="inputDate" class="form-label">Plan end date</label>
            <input type="datetime-local" class="form-control" id="inputDate" name="inputDate" required>
        </div>
        <div class="mb-3">
            <label for="planCategory" class="form-label">Plan category</label>
            <select class="form-select" aria-label="Default select example" id="planCategory" name="planCategory">
                <option selected>기타</option>
                <option value="코딩">코딩</option>
                <option value="운동">운동</option>
                <option value="공부">공부</option>
            </select>
        </div>
        <div class="mb-3">
            <label for="planMemo" class="form-label">Plan Detail</label>
            <textarea class="form-control" id="planMemo" rows="3" name="planMemo"></textarea>
        </div>
        <div class="form-check">
            <input class="form-check-input" type="checkbox" value="Y" id="flexCheckDefault" name="planPrivate" checked>
            <label class="form-check-label" for="flexCheckDefault">
                공개하기
            </label>
            <button type="submit" class="btn btn-primary float-right">New plan</button>
        </div>
    </form>
    </div>
</div>