<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>CONTROLE QUALITE PREFORME | home</title>
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

    <style>
        #grad1 {
            background-image: linear-gradient(to right, white, blue, blue, white, blue, white);
        }
    </style>
</head>
<body background="images/fond.jpg">
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="nav-item active">
                    <a class="nav-link" href="/home"><span class="glyphicon glyphicon-th-large"> ACCEUIL</span></a>
                </li>

                <li class="nav-item">
                    <a class="nav-link" href="/registrate_controle"><span class="glyphicon glyphicon-save"></span>
                        ENREGISTRER UN CONTROLE</a>
                </li>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"> <span class="glyphicon glyphicon-list-alt"></span> RESULTATS ET
                        INTERPRETATIONS <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/result">RESULTATS ANALYSES</a></li>
                        <li><a href="/poids">EVOLUTION DES PARAMETRES D'ANALYSE</a></li>
                        <li><a href="/defaut">ANALYSES DES PARAMETRES PAR DEFAUTS</a></li>
                        <li><a href="/defaut_cavite">SUIVIS DES CAVITES</a></li>
                        <li><a href="/analyse_controle">ANALYSES DES CONTROLES</a></li>
                        <li><a href="#">----------------------</a></li>
                        <li><a href="/Ajout_utilisateur">Ajouter un utilisateur</a></li>
                        <li><a href="/Liste_utilisateur">Liste des utilisateurs</a></li>

                    </ul>
                </li>


                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false"> <span class="glyphicon glyphicon-user"></span> Administration <span
                            class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/Ajout_utilisateur">Ajouter un utilisateur</a></li>
                        <li><a href="/Liste_utilisateur">Liste des utilisateurs</a></li>
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

    <center>
        <marquee><h1>CONTROLE QUALITE PREFORMES </h1></marquee>
    </center>
    <div class="container">
        <h3></h3>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="preforme" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="0"></li>
                <li data-target="#myCarousel" data-slide-to="preforme1"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <div class="desc">SNO CONSULTING</div>
                    <img src="images/preforme.jpg" alt="sno consulting" style="width:100%; height: 70%;">
                </div>

                <div class="item">
                    <div class="desc">SNO CONSULTING</div>
                    <img src="images/0.PNG" alt="sno consulting" style="width:100%;height: 70%;">
                </div>

                <div class="item">
                    <div class="desc">SNO CONSULTING</div>
                    <img src="images/preforme1.jpg" alt="sno consulting" style="width:100%;height: 70%;;">
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


<script>
    $(function () {
        $.fn.datepicker.dates['fr'] = {
            days: ["dimanche", "lundi", "mardi", "mercredi", "jeudi", "vendredi", "samedi"],
            daysShort: ["dim.", "lun.", "mar.", "mer.", "jeu.", "ven.", "sam."],
            daysMin: ["dim", "lun", "mar", "mer", "jeu", "ven", "sam"],
            months: ["janvier", "f�vrier", "mars", "avril", "mai", "juin", "juillet", "ao�t", "septembre", "octobre", "novembre", "d�cembre"],
            monthsShort: ["janv.", "f�vr.", "mars", "avril", "mai", "juin", "juil.", "ao�t", "sept.", "oct.", "nov.", "d�c."],
            today: "Aujourd'hui",
            monthsTitle: "Mois",
            clear: "Effacer",
            weekStart: 1,
            format: "dd/mm/yyyy"
        };
    }(jQuery));


    $('.datepicker ').datepicker({
        language: 'fr',
        autoclose: true,
        todayHighlight: true
    })


    $('.dates #dateProd').datepicker({
        'format': 'dd-mm-yyyy',
        'autoclose': true,
        language: 'fr'
    });

    // Time Picker Initialization
    $('#input_starttime').pickatime({});

    //start bouton
    $('#input_starttime').pickatime({
        // Light or Dark theme
        darktheme: true
    });

    //stop bouton
    $('#input_stoptime').pickatime({
        // Light or Dark theme
        darktheme: true
    });


    function random() {
        alert("bonjour");
    }
</script>
</body>
</html>