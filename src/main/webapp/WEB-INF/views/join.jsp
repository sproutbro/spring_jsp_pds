<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<h1>Join</h1>
<p>${msg}</p>
<form action="/join" method="post">
    <input type="text" name="username">
    <input type="password" name="password">
    <button type="submit">Join</button>
</form>
