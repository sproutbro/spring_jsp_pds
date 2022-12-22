<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<sec:authorize access="isAnonymous()">
    <ul class="nav justify-content-center">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/">PDS</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/info">Info</a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">User</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/login">Login</a></li>
                <li><a class="dropdown-item" href="/join">Join</a></li>
            </ul>
        </li>
    </ul>
</sec:authorize>

<sec:authorize access="isAuthenticated()">
    <ul class="nav justify-content-center">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/">PDS</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/plan">Plan</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/do/findAll">Do</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="/see">See</a>
        </li>
        <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">User</a>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="/logout">logout</a></li>
                <li><a class="dropdown-item" href="/">정보수정</a></li>
            </ul>
        </li>
    </ul>
</sec:authorize>