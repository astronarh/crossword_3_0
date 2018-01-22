<%--
  Created by IntelliJ IDEA.
  User: ShkerdinVA
  Date: 06.12.2017
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h3>Welcome to JournalDEV Tutorials</h3>
    <ul>
        <li>Java 8 tutorial</li>
        <li>Spring tutorial</li>
        <li>Gradle tutorial</li>
        <li>BigData tutorial</li>
    </ul>

    <c:url value="/logout" var="logoutUrl" />
    <form id="logout" action="${logoutUrl}" method="post" >
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    </form>
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <a href="javascript:document.getElementById('logout').submit()">Logout</a>
    </c:if>
</body>
</html>
