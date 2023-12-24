<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SNO CONSULTING SA</title>

<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap-select.min.css" rel="stylesheet">
<link href="static/css/bootstrap-select-country.min.css" rel="stylesheet"> 
<link href="static/css/bootstrap-datepicker.css" rel="stylesheet"> 
<link href="static/css/style2.css" rel="stylesheet">
<script type="text/javascript" src="static/js/jquery.js"></script>  
<script type="text/javascript" src="static/js/bootstrap.js"></script>
<script type="text/javascript" src="static/js/bootstrap-select.min.js"></script>  
<script type="text/javascript" src="static/js/bootstrap-select-country.min.js"></script>
<script type="text/javascript" src="static/js/bootstrap-datepicker.js"></script>

</head>

<body> 

<div class="container px-1 px-sm-5 mx-auto">
    <form autocomplete="off">
        <div class="flex-row d-flex justify-content-center">
            <div class="col-lg-6 col-11 px-1">
                <div class="input-group input-daterange"> 
                <input type="text" id="start" class="form-control text-left mr-2"> <label class="ml-3 form-control-placeholder" id="start-p" for="start">Start Date</label> <span class="fa fa-calendar" id="fa-1"></span> <input type="text" id="end" class="form-control text-left ml-2"> <label class="ml-3 form-control-placeholder" id="end-p" for="end">End Date</label> <span class="fa fa-calendar" id="fa-2"></span> </div>
            </div>
        </div>
    </form>
</div>



<script>
$(document).ready(function(){

$('.input-daterange').datepicker({
format: 'dd-mm-yyyy',
autoclose: true,
calendarWeeks : true,
clearBtn: true,
disableTouchKeyboard: true
});

});
</script>
 </body>
</html>