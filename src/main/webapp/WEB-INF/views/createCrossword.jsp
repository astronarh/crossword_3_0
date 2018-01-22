<%--
  Created by IntelliJ IDEA.
  User: ShkerdinVA
  Date: 11.12.2017
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Create crossword</title>
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

        input[type="text"]{
            border: none;
            background: transparent;
            text-align: center;
            font-size: 40px;
            width: 40px;
            height: 40px;
            text-transform: uppercase;
        }
        textarea {
            width: 50px;
            height: 50px;
            font-size: 10px;
        }

        table{
            border-spacing: 0px 0px;
            width: ${inColumn.size() * 50}px;
            height: ${inLines.size() * 50}px;
        }
        th{
            border: 1px rgb(27, 27, 27) solid;
            height: 50px;
        }
        td{
            border: 1px rgb(27, 27, 27) solid;
            height: 50px;
            padding-bottom: 0;
            padding-left: 0;
            padding-right: 0;
            padding-top: 0;
        }

        input[type="text"]{
            border: none;
            background: transparent;
            text-align: center;
            font-size: 24px;
            width: 50px;
            height: 50px;
        }

        #TB_overlay {
            background-color: #000; /* Чёрный фон */
            height: 100%; /* Высота максимальна */
            left: 0; /* Нулевой отступ слева */
            opacity: 0.50; /* Степень прозрачности */
            position: fixed; /* Фиксированное положение */
            top: 0; /* Нулевой отступ сверху */
            width: 100%; /* Ширина максимальна */
            z-index: 100; /* Заведомо быть НАД другими элементами */
            display: none;
        }
    </style>
</head>
<body>

    <div id="TB_overlay"></div>

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
    <form method="get" action="/createCrossword">
        <jsp:text>Size:</jsp:text>
        <br/>
        <select name="column">
            <c:forEach var="column" items="${column}">
                <option value="${column}">${column}</option>
            </c:forEach>
        </select>
        <select name="lines">
            <c:forEach var="lines" items="${lines}">
                <option value="${lines}">${lines}</option>
            </c:forEach>
        </select>
        <input type="submit" name="button1" value="redraw"/>
    </form>

    <form:form method="post" action="save" commandName="cells">
        <input type="hidden" name="size" value="${inColumn.size()} ${inLines.size()}"/>
        <%int count = 0;%>
        <table>
            <tbody>
                <c:forEach var="lines" items="${inLines}">
                    <tr>
                        <c:forEach var="column" items="${inColumn}">
                            <td id="td ${lines} ${column}" style="background-image: url(resources/static/images/arrows/00.png)" ondblclick="select('${lines} ${column}')">
                                <img id="arrow ${lines} ${column}" src="resources/static/images/arrows/00.png" >
                                <input type="text" id="letter ${lines} ${column}" maxlength="1" style="display: none;" onkeyup="changeletter('${lines} ${column}')">
                                <textarea id="qestion ${lines} ${column}" cols="30" rows="10" style="display: none;" onkeyup="changequestion('${lines} ${column}')"></textarea>

                                <input type="hidden" id="hiddenletter ${lines} ${column}" name="cells[<%=count%>].letter" value=""/>
                                <input type="hidden" id="hiddenarrow ${lines} ${column}" name="cells[<%=count%>].arrow" value="0"/>
                                <input type="hidden" id="hiddenquestion ${lines} ${column}" name="cells[<%=count%>].question" value=""/>
                                <input type="hidden" id="hiddentherletter ${lines} ${column}" name="cells[<%=count%>].theLetter" value="0"/>
                                <input type="hidden" id="hiddenthearrow ${lines} ${column}" name="cells[<%=count%>].theArrow" value="0"/>
                                <input type="hidden" id="hiddenthequestion ${lines} ${column}" name="cells[<%=count%>].theQuestion" value="0"/>
                                <div id="selectDiv ${lines} ${column}" style="display: none; position: absolute; top: 50%; bottom: 50%; z-index: 101;">
                                    Select type:
                                    <br/>
                                    <select id="select ${lines} ${column}" onChange="changeSelect('${lines} ${column}')">
                                        <option value="0"></option>
                                        <option value="1">Буква</option>
                                        <option value="2">Буква + стрелка</option>
                                        <option value="3">Вопрос</option>
                                    </select>
                                </div>
                            </td>

                            <%count++;%>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <input type="submit" value="Create"/>
    </form:form>

    <form:form>
            <c:forEach var="lines" items="${inLines}">
                    <c:forEach var="column" items="${inColumn}">
                            <table id="table ${lines} ${column}" width="200" height="200" border="1" cellpadding="0" cellspacing="0" style="display: none; position: absolute; top: 50px; left: 50px; z-index: 101; border-width: 0px;">
                                <tbody>
                                    <tr>
                                        <td><img src="resources/static/images/arrows/00.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '00.png')"/></td>
                                        <td><img src="resources/static/images/arrows/01.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '01.png')"/></td>
                                        <td><img src="resources/static/images/arrows/02.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '02.png')"/></td>
                                        <td><img src="resources/static/images/arrows/03.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '03.png')"/></td>
                                    </tr>
                                    <tr>
                                        <td><img src="resources/static/images/arrows/04.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '04.png')"/></td>
                                        <td><img src="resources/static/images/arrows/05.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '05.png')"/></td>
                                        <td><img src="resources/static/images/arrows/06.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '06.png')"/></td>
                                        <td><img src="resources/static/images/arrows/07.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '07.png')"/></td>
                                    </tr>
                                    <tr>
                                        <td><img src="resources/static/images/arrows/08.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '08.png')"/></td>
                                        <td><img src="resources/static/images/arrows/09.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '09.png')"/></td>
                                        <td><img src="resources/static/images/arrows/10.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '10.png')"/></td>
                                        <td><img src="resources/static/images/arrows/11.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '11.png')"/></td>
                                    </tr>
                                    <tr>
                                        <td><img src="resources/static/images/arrows/12.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '12.png')"/></td>
                                        <td><img src="resources/static/images/arrows/13.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '13.png')"/></td>
                                        <td><img src="resources/static/images/arrows/14.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '14.png')"/></td>
                                        <td><img src="resources/static/images/arrows/00.png" width="50" height="50" alt="" onClick="changearrow('${lines} ${column}', '00.png')"/></td>
                                    </tr>
                                </tbody>
                            </table>
                    </c:forEach>
            </c:forEach>
    </form:form>
</body>
</html>

<script>
    var x;
    var y;

    function changequestion(question) {
        document.getElementById('hiddenquestion ' + question).value = document.getElementById('qestion ' + question).value;
    }

    function changeletter(letter) {
        document.getElementById('hiddenletter ' + letter).value = document.getElementById('letter ' + letter).value;
    }

    function changearrow(number, arrow) {
        document.getElementById('td ' + number).style.backgroundImage = 'url(resources/static/images/arrows/' + arrow + ')';
        document.getElementById('table ' + number).style.display = 'none';
        document.getElementById('TB_overlay').style.display = 'none';
        switch (arrow) {
            case '00.png' :
                document.getElementById('hiddenarrow ' + number).value = '0';
                break;
            case '01.png' :
                document.getElementById('hiddenarrow ' + number).value = '1';
                break;
            case '02.png' :
                document.getElementById('hiddenarrow ' + number).value = '2';
                break;
            case '03.png' :
                document.getElementById('hiddenarrow ' + number).value = '3';
                break;
            case '04.png' :
                document.getElementById('hiddenarrow ' + number).value = '4';
                break;
            case '05.png' :
                document.getElementById('hiddenarrow ' + number).value = '5';
                break;
            case '06.png' :
                document.getElementById('hiddenarrow ' + number).value = '6';
                break;
            case '07.png' :
                document.getElementById('hiddenarrow ' + number).value = '7';
                break;
            case '08.png' :
                document.getElementById('hiddenarrow ' + number).value = '8';
                break;
            case '09.png' :
                document.getElementById('hiddenarrow ' + number).value = '9';
                break;
            case '10.png' :
                document.getElementById('hiddenarrow ' + number).value = '10';
                break;
            case '11.png' :
                document.getElementById('hiddenarrow ' + number).value = '11';
                break;
            case '12.png' :
                document.getElementById('hiddenarrow ' + number).value = '12';
                break;
            case '13.png' :
                document.getElementById('hiddenarrow ' + number).value = '13';
                break;
            case '14.png' :
                document.getElementById('hiddenarrow ' + number).value = '14';
                break;
        }
    }

    function select(td){
        "use strict";
        x = event.pageX;
        y = event.pageY;
        document.getElementById('selectDiv ' + td).style.left = x;
        document.getElementById('selectDiv ' + td).style.top = y;
        document.getElementById('selectDiv ' + td).style.display = 'block';
        document.getElementById('TB_overlay').style.display = 'block';
    }

    function changeSelect(div) {
        "use strict";
        document.getElementById('selectDiv ' + div).style.display = 'none';
        var ourselect = document.getElementById('select ' + div);
        if (ourselect.value == 0) {
            document.getElementById('letter ' + div).style.display = 'none';
            document.getElementById('qestion ' + div).style.display = 'none';
            document.getElementById('arrow ' + div).style.display = 'block';
            document.getElementById('td ' + div).style.backgroundImage = 'url(resources/static/images/arrows/00.png)';

            document.getElementById('hiddentherletter ' + div).value = '0';
            document.getElementById('hiddenthearrow ' + div).value = '0';
            document.getElementById('hiddenthequestion ' + div).value = '0';

            document.getElementById('TB_overlay').style.display = 'none';
        }
        if (ourselect.value == 1) {
            document.getElementById('letter ' + div).style.display = 'block';
            document.getElementById('qestion ' + div).style.display = 'none';
            document.getElementById('arrow ' + div).style.display = 'none';
            document.getElementById('td ' + div).style.backgroundImage = 'url(resources/static/images/arrows/00.png)';

            document.getElementById('hiddentherletter ' + div).value = '1';
            document.getElementById('hiddenthearrow ' + div).value = '0';
            document.getElementById('hiddenthequestion ' + div).value = '0';

            document.getElementById('TB_overlay').style.display = 'none';
        }
        if (ourselect.value == 2) {
            document.getElementById('letter ' + div).style.display = 'block';
            document.getElementById('qestion ' + div).style.display = 'none';
            document.getElementById('arrow ' + div).style.display = 'none';
            document.getElementById('td ' + div).style.backgroundImage = 'url(resources/static/images/arrows/01.png)';

            document.getElementById('table ' + div).style.left = x;
            document.getElementById('table ' + div).style.top = y;
            document.getElementById('table ' + div).style.display = 'block';

            document.getElementById('hiddentherletter ' + div).value = '1';
            document.getElementById('hiddenthearrow ' + div).value = '1';
            document.getElementById('hiddenthequestion ' + div).value = '0';
        }
        if (ourselect.value == 3) {
            document.getElementById('letter ' + div).style.display = 'none';
            document.getElementById('qestion ' + div).style.display = 'block';
            document.getElementById('arrow ' + div).style.display = 'none';
            document.getElementById('td ' + div).style.backgroundImage = 'url(resources/static/images/arrows/00.png)';

            document.getElementById('hiddentherletter ' + div).value = '0';
            document.getElementById('hiddenthearrow ' + div).value = '0';
            document.getElementById('hiddenthequestion ' + div).value = '1';

            document.getElementById('TB_overlay').style.display = 'none';
        }
    }
</script>