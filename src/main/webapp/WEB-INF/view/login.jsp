<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/login.css" rel="stylesheet">
<script type="text/javascript" src="static/js/jquery.js"></script>  
<script type="text/javascript" src="static/js/bootstrap.js"></script>
<title>LOGIN PAGE</title>
</head>
<body>


<div class="container">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <form class="box" action="/login" method="POST" >
                    <h1>Login</h1>
                    <p class="text-muted"> Entrez votre login et votre mot de passe!</p> 
                    <input type="text" name="login" placeholder="Login"> 
                    <input type="password" name="password" placeholder="mot de passe"> 
                   		 <a class="forgot text-muted" href="#">mot de passe oublié?</a> 
                    <input type="submit" value="Login" >
                  
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>