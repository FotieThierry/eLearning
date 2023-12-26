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

    <c:when test="${mode=='EVALUATION_PAGE'}">
        <h1> evalution page</h1>
    </c:when>

    <c:when test="${mode=='ADD_USER'}">
        <div class="container text-center">
            <h1>Enregistrement d'un utilisateur</h1>
            <hr>
            <form class="form-horizontal" action="save-user" method="post">
                <div class="form-group">
                    <label class="control-label col-md-3">Nom :  </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="nom" value="" placeholder="saisir le nom" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Prenom :  </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="prenom" value="" placeholder="saisir le prenom" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Mot de passe :  </label>
                    <div class="col-md-3">
                        <input type="password" class="form-control" name="mot_de_passe" value="" placeholder="saisir le mot de passe" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Email :  </label>
                    <div class="col-md-3">
                        <input type="email" class="form-control" name="email" value="" placeholder="saisir l'email" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Sexe :  </label>
                    <div class="col-md-3">
                       <select name="sexe">
                           <option value="masculin"> Masculin</option>
                           <option value="feminin"> Feminin</option>
                       </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Type :  </label>
                    <div class="col-md-3">
                        <select name="type">
                            <option value="administrateur"> Administrateur</option>
                            <option value="simpleUtilisateur"> Simple utilisateur</option>
                        </select>
                    </div>
                </div>


                <div class="form-group">
                    <button class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-import"></span>Enregistrer</button>
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
                    <tr>
                        <td>talla</td>
                        <td>jean</td>
                        <td>talla@jean</td>
                        <td>Masculin</td>
                        <td>simple utilisateur</td>
                        <td align="center"><a href="#"><span class="glyphicon glyphicon-pencil text-info"></span></a></td>
                        <td align="center"><a href="#"><span class="glyphicon glyphicon-trash text-danger"></span></a></td>
                    </tr>
                    <tr>
                        <td>talla</td>
                        <td>jean</td>
                        <td>talla@jean</td>
                        <td>Masculin</td>
                        <td>simple utilisateur</td>
                        <td align="center"><a href="#"><span class="glyphicon glyphicon-pencil text-info"></span></a></td>
                        <td align="center"><a href="#"><span class="glyphicon glyphicon-trash text-danger"></span></a></td>
                    </tr>
                    <tr>
                        <td>talla</td>
                        <td>jean</td>
                        <td>talla@jean</td>
                        <td>Masculin</td>
                        <td>simple utilisateur</td>
                        <td align="center"><a href="#"><span class="glyphicon glyphicon-pencil text-info"></span></a></td>
                        <td align="center"><a href="#"><span class="glyphicon glyphicon-trash text-danger"></span></a></td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>

    </c:when>
    <c:when test="${mode=='QUESTIONS'}">
        <div class="container text-center">
            <h1>Création des questions</h1>
            <hr>
            <form class="form-horizontal" action="save-question" method="post">
                <div class="form-group">
                    <label class="control-label col-md-3">Intitulé de la question :  </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="question" value="" placeholder="saisir la question" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Domaine :  </label>
                    <div class="col-md-3">
                        <select name="domaine">
                            <option value="anglais"> Anglais</option>
                            <option value="mathematique"> Mathématiques</option>
                            <option value="francais"> Français</option>
                        </select>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Réponse :  </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="reponse" value="" placeholder="saisir la réponse correcte" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Proposition fausse 1 :  </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="propositionFausse1" value="" placeholder="saisir la proposition fausse 1" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Proposition fausse 2 :  </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="propositionFausse2" value="" placeholder="saisir la proposition fausse 2" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-md-3">Proposition fausse 3 :  </label>
                    <div class="col-md-3">
                        <input type="text" class="form-control" name="propositionFausse3" value="" placeholder="saisir la proposition fausse 3" required>
                    </div>
                </div>

                <div class="form-group">
                    <button class="btn btn-primary btn-lg"><span class="glyphicon glyphicon-ok-sign"></span>Enregistrer</button>
                </div>

            </form>
        </div>
    </c:when>

</c:choose>


</body>
</html>
