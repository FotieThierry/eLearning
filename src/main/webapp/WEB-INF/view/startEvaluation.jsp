<%--
  Created by IntelliJ IDEA.
  User: RODRIGUE
  Date: 06/01/2024
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<div class="container">

    <h1 class="text-center">Evaluation</h1>

    <form id="questionForm" action="corrigerEvaluation" method="post">
        <input type="hidden" name="nom_epreuve" value="${nom_Epreuve}">
        <input type="hidden" name="exam_time" value="${timeInSeconds}">

        <div class="text-right">
            <label>
                <p class="texte-evaluation">Temps restant : <span id="countdown"></span> </p>
            </label>
        </div>

        <h4><label> ${nom_Epreuve}</label></h4>
        <hr>

        <!-- Conteneur pour les divs de questions -->
        <div id="questionsContainer">

        </div>


        <br><br>
        <div class="btn-toolbar">
            <button id="prevButton" type="button" class="btn btn-default" style="display: none">Précédent</button>
            <button id="nextButton" type="button" class="btn btn-primary">Suivant</button>
            <button id="submitButton" type="submit" class="btn btn-success" style="display: none">Soumettre</button>
        </div>

    </form>
</div>

<script>
    var currentQuestion = 1;
    var totalQuestion = ${totalQuestion};
    var timeInSeconds = ${timeInSeconds};
    var counter = timeInSeconds;
    var questionList = [
        <c:forEach var="questionItem" items="${questionList}" varStatus="loop">
        {
            id: '${questionItem.id}',
            question: '${questionItem.question}',
            domaine: '${questionItem.domaine}',
            reponse: '${questionItem.reponse}',
            proposition1: '${questionItem.proposition1}',
            proposition2: '${questionItem.proposition2}',
            proposition3: '${questionItem.proposition3}'
        }<c:if test="${!loop.last}">, </c:if>
        </c:forEach>
    ];

      // Fonction pour mélanger un tableau aléatoirement
    function shuffleArray(array) {
        for (let i = array.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            [array[i], array[j]] = [array[j], array[i]];
        }
        return array;
    }

    // Fonction pour créer des boutons radio
    function createRadioInput(name, value) {
        const input = document.createElement('input');
        input.setAttribute('type', 'radio');
        input.setAttribute('name', name);
        input.setAttribute('value', value);

        const label = document.createElement('label');
        label.appendChild(input);
        label.appendChild(document.createTextNode(value));

        const divRadio = document.createElement('div');
        divRadio.classList.add('radio');
        divRadio.appendChild(label);

        return divRadio;
    }

    // Fonction pour créer dynamiquement les divs de questions
    function createQuestionDiv(questionIndex) {
        const question = document.createElement('div');
        question.id = 'question' + questionIndex + 'Group';
        question.setAttribute('name', 'question' + questionIndex + 'Group')

        const label = document.createElement('label');
        label.setAttribute('for', 'question' + questionIndex);
        label.textContent = 'Question : ' + questionList[questionIndex - 1].question;
        question.appendChild(label);


        const radioInputProposition1 = createRadioInput('question' + questionIndex, questionList[questionIndex - 1].proposition1);
        const radioInputProposition2 = createRadioInput('question' + questionIndex, questionList[questionIndex - 1].proposition2);
        const radioInputProposition3 = createRadioInput('question' + questionIndex, questionList[questionIndex - 1].proposition3);
        const radioInputReponse = createRadioInput('question' + questionIndex, questionList[questionIndex - 1].reponse);

        // Tableau contenant les éléments à mélanger
        const elementsToShuffle = [
            radioInputProposition1,
            radioInputProposition2,
            radioInputProposition3,
            radioInputReponse
        ];

        // Mélanger les éléments de manière aléatoire
        const shuffledElements = shuffleArray(elementsToShuffle);

        // Ajouter les éléments mélangés à la div de question dans l'ordre aléatoire
        shuffledElements.forEach(element => {
            question.appendChild(element);
        });

       /* question.appendChild(radioInputProposition1);
        question.appendChild(radioInputProposition2);
        question.appendChild(radioInputProposition3);
        question.appendChild(radioInputReponse);*/


        return question;
    }


    // fonction pour gerer le compter de temps
    function startCounter() {
        timer = setInterval(function () {
            counter--;

            if (counter < 0) {
                clearInterval(timer);
                executeEvaluation();
            } else {
                var hours = Math.floor(counter / 3600);
                var minutes = Math.floor((counter % 3600) / 60);
                var seconds = counter % 60;

                var formattedTime = ('0' + hours).slice(-2) + ':' + ('0' + minutes).slice(-2) + ':' + ('0' + seconds).slice(-2);
                document.getElementById('countdown').innerText = formattedTime;

                // Vérifier s'il reste moins de 10% du temps initial
                var tenPercentOfInitialTime = timeInSeconds * 0.5;
                if (counter <= tenPercentOfInitialTime) {
                    document.getElementById('countdown').style.color = 'red';
                }
            }
        }, 1000);
    }

    // fonction qui redirige à la page d'acceuil lorsque le timing est à 0
    function executeEvaluation() {
        $.ajax({
            type: 'POST',
            url: '/corrigerEvaluation',
            success: function () {
                // Redirection vers une nouvelle URL après le succès de la méthode getEvaluation
                window.location.href = '/home'; // Redirection vers '/home'
            },
            error: function () {
                console.error('Erreur lors de l\'appel de la méthode getEvaluation.');
            }
        });
    }

    // converti le temps en HH:MM:SS
    function convertToHHMMSS(seconds) {
        var hours = Math.floor(seconds / 3600);
        var minutes = Math.floor((seconds % 3600) / 60);
        var remainingSeconds = seconds % 60;

        return ('0' + hours).slice(-2) + ':' + ('0' + minutes).slice(-2) + ':' + ('0' + remainingSeconds).slice(-2);
    }

    // gestion des boutons events
    function buttonEvent(){
        if (totalQuestion == 0) {
            document.getElementById('nextButton').style.display = 'none';
            document.getElementById('submitButton').style.display = 'none';
            document.getElementById('prevButton').style.display = 'none';
        }
        if (totalQuestion == 1) {
            document.getElementById('nextButton').style.display = 'none';
            document.getElementById('submitButton').style.display = 'block';
            document.getElementById('prevButton').style.display = 'none';
        }

        document.getElementById('nextButton').addEventListener('click', function () {
            if (currentQuestion < totalQuestion) {
                document.getElementById('question' + currentQuestion + 'Group').style.display = 'none';
                currentQuestion++;
                document.getElementById('question' + currentQuestion + 'Group').style.display = 'block';
                document.getElementById('prevButton').style.display = 'block';
            }
            if (currentQuestion == totalQuestion) {
                document.getElementById('nextButton').style.display = 'none';
                document.getElementById('submitButton').style.display = 'block';
            }
        });

        document.getElementById('prevButton').addEventListener('click', function () {
            if (currentQuestion > 1) {
                document.getElementById('question' + currentQuestion + 'Group').style.display = 'none';
                currentQuestion--;
                document.getElementById('question' + currentQuestion + 'Group').style.display = 'block';
            }
            if (currentQuestion == 1) {
                document.getElementById('prevButton').style.display = 'none';
                document.getElementById('nextButton').style.display = 'block';
            }
            if (currentQuestion < totalQuestion) {
                document.getElementById('submitButton').style.display = 'none';
                document.getElementById('nextButton').style.display = 'block';
            }
        });
    }

    //fonction qui s'exécute au chargement de la page
    function initializePage() {
        const questionsContainer = document.getElementById('questionsContainer');

        //creation des div questions
        for (let i = 1; i <= totalQuestion; i++) {
            const questionDiv = createQuestionDiv(i);
            if (i !== 1) {
                questionDiv.style.display = 'none'; // Masquer les divs de questions sauf la première
            }
            questionsContainer.appendChild(questionDiv);
        }

        // creation des evenements sur les boutons
        buttonEvent();

        // gestion du temps
        document.getElementById('countdown').innerText = convertToHHMMSS(timeInSeconds);
        startCounter();

        // gestionnaire d'événement pour la fermerture de la page
        window.addEventListener('beforeunload', function (event) {
           // event.preventDefault();
            event.returnValue = 'Vos réponses pourraient être perdues. Êtes-vous sûr de vouloir quitter cette page ?';
            //  executeEvaluation();
        });

    }

    // Appel d'initialisation au chargement de la page
    window.onload = initializePage;


</script>
</body>
</html>
