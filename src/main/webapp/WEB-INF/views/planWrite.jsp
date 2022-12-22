<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form action="/plan/write" method="post">
    <table>
        <tr>
            <th>계획명</th>
            <td><input type="text" name="planTitle"></td>
        </tr>
        <tr>
            <th>계획 만료일</th>
            <td><input type="datetime-local" name="inputDate"></td>
        </tr>
        <tr>
            <th>카테고리</th>
            <td><input type="text" name="planCategory"></td>
        </tr>
        <tr>
            <th>비공개</th>
            <td><input type="checkbox" name="planPrivate"></td>
        </tr>
        <tr>
            <th colspan="2">계획 상세</th>
        </tr>
        <tr>
            <td colspan="2">
                <textarea name="planMemo" cols="50" rows="10"></textarea>
            </td>
        </tr>
        <tr>
            <td>
                <button type="submit">계획쓰기</button>
            </td>
        </tr>
    </table>
</form>