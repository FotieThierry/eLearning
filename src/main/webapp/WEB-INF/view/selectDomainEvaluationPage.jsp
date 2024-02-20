<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: RODRIGUE
  Date: 06/01/2024
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Evaluation</title>
    <%-- boostrap import beginning --%>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <link href="static/css/bootstrap-select.min.css" rel="stylesheet">
    <link href="static/css/bootstrap-select-country.min.css" rel="stylesheet">
    <link href="static/css/bootstrap-datepicker.css" rel="stylesheet">
    <link href="static/css/style2.css" rel="stylesheet">

    <script type="text/javascript" src="static/js/util.js"></script>
    <script type="text/javascript" src="static/js/jquery.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <script type="text/javascript" src="static/js/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap-select-country.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap-datepicker.js"></script>

    <%-- boostrap import end --%>
</head>
<body>
        <div class="container text-center">
            <h1>Choose your Question Paper </h1>
            <hr>
            <form action="startEvaluation" method="post">
                <div class="form-group">
                    <label class="control-label"> Choose the TEST : </label>
                    <select name="epreuve">
                        <c:forEach var="a" items="${liste_des_epreuves}">
                            <option value ="${a.nomEpreuve}">${a.nomEpreuve}</option>
                        </c:forEach>
                    </select>
                    </label>

                    <button class="btn btn-success"><span class="glyphicon glyphicon-download"></span>Choisir
                    </button>
                </div>
            </form>

        </div>
</body>
</html>
