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
    <title>IMPLEMENTATION OF A COMPUTERISED PSYCHOTECHNIC TESTS</title>
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
<%
    String nom = (String) session.getAttribute("nom");
%>
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="/home"><span class="glyphicon glyphicon-th-large"> HOME PAGE</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/evaluation1-selectDomain"><span class="glyphicon glyphicon-education"></span>
                        Pass a TEST</a>
                </li>

                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"> <span class="glyphicon glyphicon-user"></span> Administration <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/adduser">Add User</a></li>
                        <li><a href="/getuser">List of Users</a></li>
                        <li><a href="/questionAdd">Create Questions</a></li>
                        <li><a href="/questionList">List of Questions</a></li>
                        <li><a href="/epreuveAdd">Create a Test</a></li>
                        <li><a href="/epreuveList">List of Tests</a></li>
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
                    <a class="nav-link" href="/edit-userByUser"><span class="glyphicon glyphicon-cog"></span> <%= nom %>
                    </a>
                    <p></p>
                </li>

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
        <div class="container">
            <div>
                <marquee><h2> QUIZ MANAGEMENT SYSTEM</h2></marquee>
            </div>
            <h3></h3>
            <div id="myCarousel" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#myCarousel" data-slide-to="insamlogo" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="book1"></li>
                    <li data-target="#myCarousel" data-slide-to="book2"></li>
                    <li data-target="#myCarousel" data-slide-to="1"></li>
                    <li data-target="#myCarousel" data-slide-to="2"></li>
                    <li data-target="#myCarousel" data-slide-to="3"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner">
                    <div class="item active">
                        <div class="desc">Insam</div>
                        <img src="images/insamlogo.jpg" alt="Insam" style="width:100%; height: 70%;">
                    </div>

                    <div class="item">
                        <div class="desc">Insam</div>
                        <img src="images/book1.jpg" alt="Insam" style="width:100%; height: 70%;">
                    </div>

                    <div class="item">
                        <div class="desc">Insam</div>
                        <img src="images/book2.jpg" alt="Insam" style="width:100%; height: 70%;">
                    </div>

                    <div class="item">
                        <div class="desc">Insam</div>
                        <img src="images/1.jpg" alt="Insam" style="width:100%; height: 70%;">
                    </div>

                    <div class="item">
                        <div class="desc">Insam</div>
                        <img src="images/2.jpg" alt="Insam" style="width:100%; height: 70%;">
                    </div>

                    <div class="item">
                        <div class="desc">Insam</div>
                        <img src="images/3.jpg" alt="Insam" style="width:100%; height: 70%;">
                    </div>


                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </c:when>

    <c:when test="${mode=='ADD_USER'}">
        <div class="container text-center">
            <h1>User Registration</h1>
            <hr>
            <form class="form-horizontal" action="save-user" method="post">
                <div class="form-group">
                    <label class="control-label col-md-3">First Name : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="nom" value="" placeholder="enter first name"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Last name : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="prenom" value="" placeholder="enter last name"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Password : </label>
                    <div class="col-md-3">
                        <input type="password" class="form-control" name="password" value=""
                               placeholder="enter a password" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Email : </label>
                    <div class="col-md-3">
                        <input type="email" class="form-control" name="email" value="" placeholder="enter a valid email"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Gender : </label>
                    <div class="col-md-3">
                        <select name="sexe">
                            <option value="masculin"> Male</option>
                            <option value="feminin"> Female</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Type : </label>
                    <div class="col-md-3">
                        <select name="type">
                            <option value="administrateur"> Administrator</option>
                            <option value="simpleUtilisateur"> Simple user</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <button class="btn btn-success btn-lg"><span class="glyphicon glyphicon-download"></span>Save
                    </button>
                </div>

            </form>
        </div>
    </c:when>

    <c:when test="${mode=='USER_LIST'}">
        <div class="container text-center">
            <h1> List of users</h1>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                    <tr class="success">
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Gender</th>
                        <th>Type</th>
                        <th align="center">Modify</th>
                        <th align="center">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="p" items="${listeUtilisateur}">
                        <tr>
                            <td>${p.nom}</td>
                            <td>${p.prenom}</td>
                            <td>${p.email}</td>
                            <td>${p.sexe}</td>
                            <td>${p.type}</td>
                            <td align="center"><a href="/edit-user?id=${p.id}"><span
                                    class="glyphicon glyphicon-pencil text-info"></span></a></td>
                            <td align="center"><a href="/delete-user?id=${p.id}"><span
                                    class="glyphicon glyphicon-trash text-danger"></span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

    </c:when>

    <c:when test="${mode == 'MODE_EDIT_UTILISATEUR'}">
        <div class="container text-center">

            <h1>User modification</h1>
            <hr>
            <form class="form-horizontal" action="update-user" method="post">
                <input type="hidden" name="id" value="${utilisateur_a_modifier.id}">
                <input type="hidden" name="password" value="${utilisateur_a_modifier.password}">
                <div class="form-group">
                    <label class="control-label col-md-3">First Name : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="nom" value="${utilisateur_a_modifier.nom}"
                               placeholder="enter first name" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Last Name : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="prenom" value="${utilisateur_a_modifier.prenom}"
                               placeholder="enter last name" required>
                    </div>
                </div>

                    <%-- <div class="form-group">
                         <label class="control-label col-md-3">Mot de passe :  </label>
                         <div class="col-md-3">
                             <input type="password" class="form-control" name="password" value="" placeholder="saisir le mot de passe" required>
                         </div>
                     </div>--%>

                <div class="form-group">
                    <label class="control-label col-md-3">Email : </label>
                    <div class="col-md-3">
                        <input type="email" class="form-control" name="email" value="${utilisateur_a_modifier.email}"
                               placeholder="enter a valid email" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Gender : </label>
                    <div class="col-md-3">
                        <select name="sexe">
                            <option value="masculin"> Male</option>
                            <option value="feminin"> Female</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Type : </label>
                    <div class="col-md-3">
                        <select name="type">
                            <option value="administrateur"> Administrator</option>
                            <option value="simpleUtilisateur"> Simple user</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <button class="btn btn-info btn-lg"><span class="glyphicon glyphicon-pencil"></span>Modify
                    </button>
                </div>

            </form>
        </div>
    </c:when>

    <c:when test="${mode=='QUESTIONS'}">
        <div class="container text-center">
            <h1>Question creation</h1>
            <hr>
            <form class="form-horizontal" action="save-question" method="post">
                <div class="form-group">
                    <label class="control-label col-md-3">Question : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="question" value=""
                               placeholder="type the question" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Domain : </label>
                    <div class="col-md-3">
                        <select name="domaine">
                            <option value="anglais"> English</option>
                            <option value="mathematique"> Maths</option>
                            <option value="francais"> French</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Answer : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="reponse" value=""
                               placeholder="type the correct answer" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">False option 1 : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="proposition1" value=""
                               placeholder="type false option 1" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">False option 2 : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="proposition2" value=""
                               placeholder="type false option 2" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">False option 3 : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="proposition3" value=""
                               placeholder="type false option 3" required>
                    </div>
                </div>

                <div class="form-group">
                    <button class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-ok-sign"></span>Save
                    </button>
                </div>

            </form>
        </div>
    </c:when>

    <c:when test="${mode=='QUESTION_LIST'}">
        <div class="container text-center">
            <h1>List of questions</h1>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark text-center">
                    <tr class="success">
                        <th class="text-center">N°</th>
                        <th class="text-center">Domain</th>
                        <th class="text-center">Question</th>
                        <th class="text-center">Modify</th>
                        <th class="text-center">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% int i=1; %>
                    <c:forEach var="x" items="${listQuestion}">
                        <tr>
                            <td class="text-center"> <% out.print(i);%></td>
                            <td class="text-center">${x.domaine}</td>
                            <td>
                                <strong>Question : </strong> ${x.question} <br>
                                <strong>Options : </strong><br>
                                - ${x.proposition1} <br>
                                - ${x.proposition2} <br>
                                - ${x.proposition3} <br>
                                <span class="text-success">
                                        - ${x.reponse} <br>
                                    </span>
                                <br>
                            </td>
                            <td class="text-center"><a href="/edit-question?id=${x.id}"><span
                                    class="glyphicon glyphicon-pencil text-info"></span></a></td>
                            <td class="text-center"><a href="/delete-question?id=${x.id}"><span
                                    class="glyphicon glyphicon-trash text-danger"></span></a></td>
                        </tr>
                        <% i++; %>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:when>

    <c:when test="${mode=='MODE_EDIT_QUESTION'}">
        <div class="container text-center">
            <h1> Question modification</h1>
            <hr>
            <form class="form-horizontal" action="save-question" method="post">
                <input type="hidden" name="id" value="${question_a_modifier.id}">
                <div class="form-group">
                    <label class="control-label col-md-3">Question : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="question" value="${question_a_modifier.question}"
                               placeholder="type the question" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Domain : </label>
                    <div class="col-md-3">
                        <select name="domaine">
                            <option value="${question_a_modifier.domaine}">${question_a_modifier.domaine}</option>
                            <option value="anglais"> English</option>
                            <option value="mathematique"> Maths</option>
                            <option value="francais"> French</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Answer : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="reponse" value="${question_a_modifier.reponse}"
                               placeholder="type the correct answer" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">False option 1 : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="propositione1"
                               value="${question_a_modifier.proposition1}" placeholder="type false option 1"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">False option 2 : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="proposition2"
                               value="${question_a_modifier.proposition2}" placeholder="type false option 2"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">False option 3 : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="proposition3"
                               value="${question_a_modifier.proposition3}" placeholder="type false option 3"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <button class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-ok-sign"></span>Save
                    </button>
                </div>

            </form>
        </div>
    </c:when>

    <c:when test="${mode== 'CREATE_EPREUVE'}">
        <div class="container text-center">
            <h1>Create a Test</h1>
            <hr>
            <form action="create-epreuve1" method="post">
                <div class="form-group">
                    <label class="control-label"> Choose the Domain : </label>
                    <select name="domaine">
                        <option value="anglais"> English</option>
                        <option value="mathematique"> Maths</option>
                        <option value="francais"> French</option>
                    </select>
                    </label>

                    <button class="btn btn-success"><span class="glyphicon glyphicon-download"></span>Choose
                    </button>
                </div>
            </form>

        </div>
    </c:when>

    <c:when test="${mode== 'LISTE_QUESTION_BY_DOMAINE'}">
        <div class="container text-center">
            <marquee><h1>Please select the questions and the duration of the test, then click on create.</h1>
            </marquee>
            <hr>
            <form class="form-horizontal" action="create-epreuve2" method="post">
                <input type="hidden" name="domaine" value="${domaine_name}">
                <div class="form-group">
                    <label class="control-label col-md-3">Test duration (in minutes) : </label>
                    <div class="col-md-3">
                        <input type="number" class="form-control" name="temps" value="1" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Test Name : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="nomEpreuve" value="" required>
                    </div>
                </div>


                <table class="table table-striped table-bordered">
                    <thead class="thead-dark text-center">
                    <tr class="success">
                        <th class="text-center"></th>
                        <th class="text-center">Domain</th>
                        <th class="text-center">Question</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="x" items="${listQuestionDomain}">
                        <tr>
                            <td class="text-center">
                                <input type="checkbox" name="questionId" value="${x.id}">
                            </td>
                            <td class="text-center">${x.domaine}</td>
                            <td>
                                <strong>Question : </strong> ${x.question} <br>
                                <strong>Propositions : </strong><br>
                                - ${x.proposition1} <br>
                                - ${x.proposition2} <br>
                                - ${x.proposition3} <br>
                                <span class="text-success">
                                        - ${x.reponse} <br>
                                </span>
                                <br>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <div class="form-group">
                    <button class="btn btn-success btn-lg"><span class="glyphicon glyphicon-download"></span>Create the Test
                    </button>
                </div>

            </form>
        </div>


    </c:when>

    <c:when test="${mode== 'LIST_EPREUVE'}">
        <div class="container text-center">
            <h1>List of tests</h1>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                    <tr class="success">
                        <th class="text-center">N°</th>
                        <th class="text-center">Test Name</th>
                        <th class="text-center">Domain</th>
                        <th class="text-center">Questions</th>
                        <th class="text-center">Duration (Minutes)</th>
                        <th class="text-center">Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% int i =1; %>
                    <c:forEach var="t" items="${listeEpreuve}">
                        <tr>
                            <td class="text-center"><% out.print(i); %></td>
                            <td class="text-center">${t.nomEpreuve}</td>
                            <td class="text-center">${t.domaine}</td>
                            <td >
                                <c:forEach var="x" items="${t.rf_id_question}">
                                    <strong>Question : </strong> ${x.question} <br>
                                    <strong>Options : </strong><br>
                                    - ${x.proposition1} <br>
                                    - ${x.proposition2} <br>
                                    - ${x.proposition3} <br>
                                    <span class="text-success">
                                        - ${x.reponse} <br>
                                </span>
                                    <br>
                                </c:forEach>
                            </td>
                            <td class="text-center">${t.temps}</td>
                            <td class="text-center"><a href="/deleteEpreuve?id=${t.id}"><span class="glyphicon glyphicon-trash text-danger"></span></a></td>
                        </tr>

                        <% i++;%>

                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:when>

    <c:when test="${mode=='EVALUATION_STATISTICS'}">
        <div class="container text-center">
            <p>
                Hello Mr, Mrs ${userName}, <br>
                ${appreciation}. <br>
                Score : ${score}. <br>
                Grade : ${grade}. <br>
            </p>

        </div>
    </c:when>

    <c:when test="${mode == 'EDIT_USER_BY_USER'}">
        <div class="container text-center">

            <h1>User modification</h1>
            <hr>
            <form class="form-horizontal" action="update-user" method="post">
                <input type="hidden" name="id" value="${utilisateur_a_modifier.id}">
                <div class="form-group">
                    <label class="control-label col-md-3">First Name : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="nom" value="${utilisateur_a_modifier.nom}"
                               placeholder="enter first name" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Last Name : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="prenom" value="${utilisateur_a_modifier.prenom}"
                               placeholder="enter last name" required>
                    </div>
                </div>

                    <div class="form-group">
                         <label class="control-label col-md-3">Password :  </label>
                         <div class="col-md-3">
                             <input type="password" class="form-control" name="password" value="${utilisateur_a_modifier.password}">
                         </div>
                     </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Email : </label>
                    <div class="col-md-3">
                        <input type="email" class="form-control" name="email" value="${utilisateur_a_modifier.email}"
                               placeholder="enter a valid email" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Gender : </label>
                    <div class="col-md-3">
                        <select name="sexe">
                            <option value="masculin"> Male</option>
                            <option value="feminin"> Female</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Type : </label>
                    <div class="col-md-3">
                        <select name="type">
                            <option value="administrateur"> Administrator</option>
                            <option value="simpleUtilisateur"> Simple user</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <button class="btn btn-info btn-lg"><span class="glyphicon glyphicon-pencil"></span>Modify
                    </button>
                </div>

            </form>
        </div>
    </c:when>
</c:choose>


</body>
</html>
