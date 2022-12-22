<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<nav>
    <ul>
        <sec:authorize access="isAnonymous()">
            <li><a href="/">home</a></li>
            <li><a href="/info">Info</a></li>
            <li><a href="/login">Login</a></li>
            <li><a href="/join">Join</a></li>
        </sec:authorize>
    </ul>
    <ul>
        <sec:authorize access="isAuthenticated()">
            <li><a href="/">home</a></li>
            <li><a href="/info">Info</a></li>
            <li><a href="/plan">plan</a></li>
            <li><a href="/do/findAll">do</a></li>
            <li><a href="/see">see</a></li>
            <li><a href="/logout">Logout</a></li>
            <li>username : <sec:authentication property="name"/></li>
        </sec:authorize>
    </ul>
</nav>