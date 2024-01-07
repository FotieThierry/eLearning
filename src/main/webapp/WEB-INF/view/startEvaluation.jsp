<%--
  Created by IntelliJ IDEA.
  User: RODRIGUE
  Date: 06/01/2024
  Time: 14:32
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
<div class="container">

    <h1 class="text-center">Evaluation</h1>

    <form id="questionForm" action="corrigerEpreuve" method="post">
        <h4><label> ${nom_Epreuve}</label></h4>
        <hr>

       <div id="question1Group">
            <label for="question1"> Question 1 : </label>
            <div class="radio">
                <label>
                    <input type="radio" name="question1" value="option1"> option 1
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="question1" value="option2"> option 2
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="question1" value="option3"> option 3
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="question1" value="option4"> option 4
                </label>
            </div>

        </div>

       <div id="question2Group" style="display: none">
            <label for="question2"> Question 2 : </label>
            <div class="radio">
                <label>
                    <input type="radio" name="question2" value="option1"> option 1
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="question2" value="option2"> option 2
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="question2" value="option3"> option 3
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="question2" value="option4"> option 4
                </label>
            </div>

        </div>

        <div id="question3Group" style="display: none">
            <label for="question3"> Question 3 : </label>
            <div class="radio">
                <label>
                    <input type="radio" name="question3" value="option1"> option 1
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="question3" value="option2"> option 2
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="question3" value="option3"> option 3
                </label>
            </div>

            <div class="radio">
                <label>
                    <input type="radio" name="question3" value="option4"> option 4
                </label>
            </div>

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
    var totalQuestion = 3;
    var listQuestion = null;

    if(totalQuestion ==0){
        document.getElementById('nextButton').style.display='none';
        document.getElementById('submitButton').style.display='none';
        document.getElementById('prevButton').style.display='none';
    }
    if(totalQuestion == 1){
        document.getElementById('nextButton').style.display='none';
        document.getElementById('submitButton').style.display='block';
        document.getElementById('prevButton').style.display='none';
    }

    document.getElementById('nextButton').addEventListener('click', function () {
        if(currentQuestion <totalQuestion){
            document.getElementById('question' + currentQuestion + 'Group').style.display ='none';
            currentQuestion++;
            document.getElementById('question' + currentQuestion+ 'Group').style.display ='block';
            document.getElementById('prevButton').style.display='block';
        }
        if(currentQuestion == totalQuestion){
            document.getElementById('nextButton').style.display='none';
            document.getElementById('submitButton').style.display='block';
        }
    });

    document.getElementById('prevButton').addEventListener('click', function () {
        if(currentQuestion >1){
            document.getElementById('question' + currentQuestion + 'Group').style.display ='none';
            currentQuestion--;
            document.getElementById('question' + currentQuestion + 'Group').style.display = 'block';
        }
        if(currentQuestion == 1){
            document.getElementById('prevButton').style.display='none';
            document.getElementById('nextButton').style.display='block';
        }
        if(currentQuestion < totalQuestion){
            document.getElementById('submitButton').style.display='none';
            document.getElementById('nextButton').style.display='block';
        }
    });



</script>
</body>
</html>
