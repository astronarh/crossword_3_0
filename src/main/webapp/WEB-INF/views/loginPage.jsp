<%--
  Created by IntelliJ IDEA.
  User: ShkerdinVA
  Date: 06.12.2017
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Login</title>
    <style>
        body {margin: 0;padding: 0;font-family: sans-serif;}

        ul {
            position: absolute;
            top: 15px;
            left: 50%;
            transform: translate(-50%, -50%);
            margin: 0;
            padding: 0;
            display: flex;
        }
        ul li {
            list-style: none;
        }
        ul li a {
            position: relative;
            display: block;
            margin: 0 10px;
            padding: 5px 10px;
            color: #aaa;
            font-size: 24px;
            text-decoration: none;
            text-transform: uppercase;
            transition: 0.5s;
            overflow: hidden;
        }
        ul li a::before {
            content: '';
            position: absolute;
            top: calc(50% - 2px);
            left: -100%;
            width: 100%;
            height: 4px;
            background: #2196f3;
            transition: 0.5s;
        }
        ul li a:hover {
            color: #fff;
        }
        ul li a:hover::before {
            animation: animate .5s linear forwards;
        }

        @keyframes animate {
            0% {
                top: calc(50% - 2px);
                left: -100%;
                height: 4px;
                z-index: 1;
            }
            50% {
                top: calc(50% - 2px);
                left: 0;
                height: 4px;
                z-index: 1;
            }
            100% {
                top: 0;
                left: 0;
                height: 100%;
                z-index: -1;
            }
        }
    </style>
</head>
<body onload='document.loginForm.username.focus();'>
<ul>
    <li><a href="${pageContext.request.contextPath}/">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/about">About</a></li>
    <li><a href="${pageContext.request.contextPath}/loginPage">Login</a></li>
    <li><a href="${pageContext.request.contextPath}/crossword">Crossword</a></li>
    <li><a href="${pageContext.request.contextPath}/createCrossword?column=1&lines=1">Create</a></li>
</ul>
<br/>
<br/>
<br/>
<c:if test="${not empty error}"><div>${error}</div></c:if>
<c:if test="${not empty message}"><div>${message}</div></c:if>

<form name='login' action="<c:url value='/loginPage' />" method='POST'>
    <table>
        <tr>
            <td>UserName:</td>
            <td><input type='text' name='username' value=''></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type='password' name='password' /></td>
        </tr>
        <tr>
            <td colspan='2'><input name="submit" type="submit" value="submit" /></td>
        </tr>
    </table>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</body>
</html>
