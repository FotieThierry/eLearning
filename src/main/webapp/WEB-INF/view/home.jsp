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
                        <li><a href="/questionAdd">Creer des questions</a></li>
                        <li><a href="/questionList">Liste des questions</a></li>
                        <li><a href="/epreuveAdd">Creer une épreuve</a></li>
                        <li><a href="/epreuveList">Liste des épreuves</a></li>
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
        <div class="container">
            <div>
                <marquee><h2> Bienvenue sur eLearning</h2></marquee>
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
            <h1>Enregistrement d'un utilisateur</h1>
            <hr>
            <form class="form-horizontal" action="save-user" method="post">
                <div class="form-group">
                    <label class="control-label col-md-3">Nom : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="nom" value="" placeholder="saisir le nom"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Prenom : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="prenom" value="" placeholder="saisir le prenom"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Mot de passe : </label>
                    <div class="col-md-3">
                        <input type="password" class="form-control" name="password" value=""
                               placeholder="saisir le mot de passe" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Email : </label>
                    <div class="col-md-3">
                        <input type="email" class="form-control" name="email" value="" placeholder="saisir l'email"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Sexe : </label>
                    <div class="col-md-3">
                        <select name="sexe">
                            <option value="masculin"> Masculin</option>
                            <option value="feminin"> Feminin</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Type : </label>
                    <div class="col-md-3">
                        <select name="type">
                            <option value="administrateur"> Administrateur</option>
                            <option value="simpleUtilisateur"> Simple utilisateur</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <button class="btn btn-success btn-lg"><span class="glyphicon glyphicon-download"></span>Enregistrer
                    </button>
                </div>

            </form>
        </div>
    </c:when>

    <c:when test="${mode=='USER_LIST'}">
        <div class="container text-center">
            <h1> Liste des utilisateurs </h1>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                    <tr class="success">
                        <th>Nom</th>
                        <th>Prenom</th>
                        <th>Email</th>
                        <th>Sexe</th>
                        <th>Type</th>
                        <th align="center">Modifier</th>
                        <th align="center">Supprimer</th>
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
            <input type="hidden" name="id" value="${utilisateur_a_modifier.id}">
            <input type="hidden" name="password" value="${utilisateur_a_modifier.password}">
            <h1>Modification de l'utilisateur</h1>
            <hr>
            <form class="form-horizontal" action="update-user" method="post">
                <div class="form-group">
                    <label class="control-label col-md-3">Nom : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="nom" value="${utilisateur_a_modifier.nom}"
                               placeholder="saisir le nom" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Prenom : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="prenom" value="${utilisateur_a_modifier.prenom}"
                               placeholder="saisir le prenom" required>
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
                               placeholder="saisir l'email" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Sexe : </label>
                    <div class="col-md-3">
                        <select name="sexe">
                            <option value="${utilisateur_a_modifier}"></option>
                            <option value="masculin"> Masculin</option>
                            <option value="feminin"> Feminin</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Type : </label>
                    <div class="col-md-3">
                        <select name="type">
                            <option value="${utilisateur_a_modifier}"></option>
                            <option value="administrateur"> Administrateur</option>
                            <option value="simpleUtilisateur"> Simple utilisateur</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <button class="btn btn-info btn-lg"><span class="glyphicon glyphicon-pencil"></span>Modifier
                    </button>
                </div>

            </form>
        </div>
    </c:when>

    <c:when test="${mode=='QUESTIONS'}">
        <div class="container text-center">
            <h1>Création des questions</h1>
            <hr>
            <form class="form-horizontal" action="save-question" method="post">
                <div class="form-group">
                    <label class="control-label col-md-3">Intitulé de la question : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="question" value=""
                               placeholder="saisir la question" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Domaine : </label>
                    <div class="col-md-3">
                        <select name="domaine">
                            <option value="anglais"> Anglais</option>
                            <option value="mathematique"> Mathématiques</option>
                            <option value="francais"> Français</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Réponse : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="reponse" value=""
                               placeholder="saisir la réponse correcte" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Proposition fausse 1 : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="proposition1" value=""
                               placeholder="saisir la proposition fausse 1" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Proposition fausse 2 : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="proposition2" value=""
                               placeholder="saisir la proposition fausse 2" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Proposition fausse 3 : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="proposition3" value=""
                               placeholder="saisir la proposition fausse 3" required>
                    </div>
                </div>

                <div class="form-group">
                    <button class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-ok-sign"></span>Enregistrer
                    </button>
                </div>

            </form>
        </div>
    </c:when>

    <c:when test="${mode=='QUESTION_LIST'}">
        <div class="container text-center">
            <h1>Liste des questions</h1>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark text-center">
                    <tr class="success">
                        <th class="text-center">N°</th>
                        <th class="text-center">Domaine</th>
                        <th class="text-center">Libellé</th>
                        <th class="text-center">Modifier</th>
                        <th class="text-center">Supprimer</th>
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
                                <strong>Propositions : </strong><br>
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
            <h1> Modification des questions</h1>
            <hr>
            <form class="form-horizontal" action="save-question" method="post">
                <input type="hidden" name="id" value="${question_a_modifier.id}">
                <div class="form-group">
                    <label class="control-label col-md-3">Intitulé de la question : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="question" value="${question_a_modifier.question}"
                               placeholder="saisir la question" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Domaine : </label>
                    <div class="col-md-3">
                        <select name="domaine">
                            <option value="${question_a_modifier.domaine}">${question_a_modifier.domaine}</option>
                            <option value="anglais"> Anglais</option>
                            <option value="mathematique"> Mathématiques</option>
                            <option value="francais"> Français</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Réponse : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="reponse" value="${question_a_modifier.reponse}"
                               placeholder="saisir la réponse correcte" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Proposition fausse 1 : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="propositione1"
                               value="${question_a_modifier.proposition1}" placeholder="saisir la proposition fausse 1"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Proposition fausse 2 : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="proposition2"
                               value="${question_a_modifier.proposition2}" placeholder="saisir la proposition fausse 2"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Proposition fausse 3 : </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="proposition3"
                               value="${question_a_modifier.proposition3}" placeholder="saisir la proposition fausse 3"
                               required>
                    </div>
                </div>

                <div class="form-group">
                    <button class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-ok-sign"></span>Enregistrer
                    </button>
                </div>

            </form>
        </div>
    </c:when>

    <c:when test="${mode== 'CREATE_EPREUVE'}">
        <div class="container text-center">
            <h1>Création d'une épreuve</h1>
            <hr>
            <form action="create-epreuve1" method="post">
                <div class="form-group">
                    <label class="control-label"> Choisir le domaine : </label>
                    <select name="domaine">
                        <option value="anglais"> Anglais</option>
                        <option value="mathematique"> Mathématiques</option>
                        <option value="francais"> Français</option>
                    </select>
                    </label>

                    <button class="btn btn-success"><span class="glyphicon glyphicon-download"></span>Choisir
                    </button>
                </div>
            </form>

        </div>
    </c:when>

    <c:when test="${mode== 'LISTE_QUESTION_BY_DOMAINE'}">
        <div class="container text-center">
            <marquee><h1>Veuillez selectionner les questions et la durée de l'épreuve puis cliquer sur créer</h1>
            </marquee>
            <hr>
            <form class="form-horizontal" action="create-epreuve2" method="post">
                <input type="hidden" name="domaine" value="${domaine_name}">
                <div class="form-group">
                    <label class="control-label col-md-3">Durée de l'épreuve (En minutes): </label>
                    <div class="col-md-3">
                        <input type="number" class="form-control" name="temps" value="1" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-3">Nom de l'épreuve: </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="nom_epreuve" value="" required>
                    </div>
                </div>


                <table class="table table-striped table-bordered">
                    <thead class="thead-dark text-center">
                    <tr class="success">
                        <th class="text-center"></th>
                        <th class="text-center">Domaine</th>
                        <th class="text-center">Libellé</th>
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
                    <button class="btn btn-success btn-lg"><span class="glyphicon glyphicon-download"></span>Créer
                        l'épreuve
                    </button>
                </div>

            </form>
        </div>


    </c:when>

    <c:when test="${mode== 'LIST_EPREUVE'}">
        <div class="container text-center">
            <h1>Liste des épreuves</h1>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered">
                    <thead class="thead-dark">
                    <tr class="success">
                        <th class="text-center">N°</th>
                        <th class="text-center">Nom</th>
                        <th class="text-center">Domaine</th>
                        <th class="text-center">Durée (Minutes)</th>
                        <th class="text-center">Supprimer</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% int i =1; %>
                    <c:forEach var="t" items="${listeEpreuve}">
                        <tr>
                            <td class="text-center"><% out.print(i); %></td>
                            <td class="text-center">${t.nom_epreuve}</td>
                            <td class="text-center">${t.domaine}</td>
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

    <c:when test="${mode=='MODE_EDIT_EPREUVE'}">
        <div class="container text-center">
            <h1> Modification des Epreuves</h1>
            <hr>

        </div>
    </c:when>

    <c:when test="${mode=='EVALUATION_PAGE'}">
        <h1> evalution page</h1>
    </c:when>

</c:choose>


</body>
</html>
