<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: RODRIGUE
  Date: 24/12/2023
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Welcome to eLearning</title>
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

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="/home"><span class="glyphicon glyphicon-th-large"> ACCEUIL</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/eval"><span class="glyphicon glyphicon-education"></span>
                        Passer une evaluation</a>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"> <span class="glyphicon glyphicon-user"></span> Administration <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/adduser">Ajouter un utilisateur</a></li>
                        <li><a href="/getuser">Liste des utilisateurs</a></li>
                        <li><a href="/question">Creer des questions</a></li>
                    </ul>
                </li>
            </ul>


            <ul class="nav navbar-nav navbar-right">

                <form class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Search">
                    </div>
                    <button class="btn btn-outline-success" type="submit">Search</button>
                </form>

                <li class="nav-item">
                    <a class="nav-link" href="/logout"><span class="glyphicon glyphicon-off"></span> Logout</a>
                    <p></p>
                </li>

            </ul>

        </div>
    </div>
</nav>

<c:choose>
    <c:when test="${mode=='MODE_HOME'}">
        <h1> home page </h1>
    </c:when>

    <c:when test="${mode=='EVALUATION_PAGE'}">
        <h1> evalution page</h1>
    </c:when>

    <c:when test="${mode=='ADD_USER'}">
        <h1> add user</h1>
    </c:when>

    <c:when test="${mode=='USER_LIST'}">
        <h1> user list</h1>
    </c:when>
    <c:when test="${mode=='QUESTIONS'}">
        <h1> my questions </h1>
    </c:when>

</c:choose>


</body>
</html>
