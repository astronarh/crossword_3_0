<%@ page import="ru.astronarh.model.Crossword" %><%--
  Created by IntelliJ IDEA.
  User: ShkerdinVA
  Date: 06.12.2017
  Time: 11:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int width;
    int heght;
    try {
        Crossword crossword = (Crossword) request.getAttribute("crossword");
        width = crossword.getRow();
        heght = crossword.getColumns();
    } catch (Exception e) {
        width = 0;
        heght = 0;
    }
%>
<html>
<head>
    <title>Crossword</title>
    <style>
        table{
            border-spacing: 0px 0px;
            width: <%=width * 50%>px;
            height: <%=heght * 50%>px;
        }
        th{
            border: 1px rgb(27, 27, 27) solid;
            height: 50px;
        }
        td{
            border: 1px rgb(27, 27, 27) solid;
            height: 50px;
        }
        input[type="text"]{
            border: none;
            background: transparent;
            text-align: center;
            font-size: 24px;
            width: 50px;
        }
        .question{
            font-size: 10px;
        }

        .table_blur {
            background: #f5ffff;
            border-collapse: collapse;
            text-align: left;
        }
        .table_blur th {
            border-top: 1px solid #777777;
            border-bottom: 1px solid #777777;
            box-shadow: inset 0 1px 0 #999999, inset 0 -1px 0 #999999;
            background: linear-gradient(#9595b6, #5a567f);
            color: white;
            padding: 10px 15px;
            position: relative;
        }
        .table_blur th:after {
            content: "";
            display: block;
            position: absolute;
            left: 0;
            top: 25%;
            height: 25%;
            width: 100%;
            background: linear-gradient(rgba(255, 255, 255, 0), rgba(255,255,255,.08));
        }
        .table_blur tr:nth-child(odd) {
            background: #ebf3f9;
        }
        .table_blur th:first-child {
            border-left: 1px solid #777777;
            border-bottom:  1px solid #777777;
            box-shadow: inset 1px 1px 0 #999999, inset 0 -1px 0 #999999;
        }
        .table_blur th:last-child {
            border-right: 1px solid #777777;
            border-bottom:  1px solid #777777;
            box-shadow: inset -1px 1px 0 #999999, inset 0 -1px 0 #999999;
        }
        .table_blur td {
            border: 1px solid #e3eef7;
            padding: 10px 15px;
            position: relative;
            transition: all 0.5s ease;
        }
        .table_blur tbody:hover td {
            color: transparent;
            text-shadow: 0 0 3px #a09f9d;
        }
        .table_blur tbody:hover tr:hover td {
            color: #444444;
            text-shadow: none;
        }

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
<body>
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
    <c:if test="${crosswords!=null}">
        <table class="table_blur" align="center">
            <tr>
                <td>
                    ID
                </td>
                <td>
                    ROW
                </td>
                <td>
                    COLUMNS
                </td>
                <td>
                    IDBEGIN
                </td>
                <td>
                    IDEND
                </td>
                <td>
                    REALIZE
                </td>
                <td>
                    DELETE
                </td>
            </tr>
            <c:forEach items="${crosswords}" var="crosswords">
                <tr>
                    <td>
                            ${crosswords.id}
                    </td>
                    <td>
                            ${crosswords.row}
                    </td>
                    <td>
                            ${crosswords.columns}
                    </td>
                    <td>
                            ${crosswords.idBegin}
                    </td>
                    <td>
                            ${crosswords.idEnd}
                    </td>
                    <td>
                        <a href="/crossword?id=${crosswords.id}">realize</a>
                    </td>
                    <td>
                        <a href="/delete?id=${crosswords.id}">delete</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>


    <br/>

    <table>
        <c:forEach var="row" items="${cells}">
            <tr>
                <c:forEach var="column" items="${row}">
                    <c:if test="${column.isTheLetter()}">
                        <c:if test="${column.isTheArrow()}">
                            <c:if test="${column.arrow > 9}">
                                <td style="background-image: url(resources/static/images/arrows/${column.arrow}.png);">
                                    <input type = "text" name = "first_name" maxlength=1>
                                </td>
                            </c:if>
                            <c:if test="${column.arrow < 10}">
                                <td style="background-image: url(resources/static/images/arrows/0${column.arrow}.png);">
                                    <input type = "text" name = "first_name" maxlength=1>
                                </td>
                            </c:if>
                        </c:if>
                        <c:if test="${!column.isTheArrow()}">
                            <td>
                                <input type = "text" name = "first_name" maxlength=1>
                            </td>
                        </c:if>
                    </c:if>
                    <c:if test="${column.isTheQuestion()}">
                        <td class="question">
                            <c:out value="${column.getQuestion()}" />
                        </td>
                    </c:if>
                </c:forEach>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
