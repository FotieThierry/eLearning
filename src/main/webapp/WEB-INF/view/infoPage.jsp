<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CONTROLE QUALITE PREFORME | Info</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap-select.min.css" rel="stylesheet">
<link href="static/css/style2.css" rel="stylesheet">
<style>
#grad1 {  
   background-image: linear-gradient(to right, white,blue,blue,white,blue,white);
}
</style>
</head>
<body background="images/fond.jpg"> 
  <center> <h1>  <a href="/result"> << RETOUR</a></h1> </center>
	 




<div class="container text-center" id="tasksDiv">
	  		<h3> RECAPITULATIF DES ANALYSES </h3>
	  		
	  		<center><h4> comparaison des r&eacute;sultats avec la norme </h4></center>
       <canvas id="mylineChart" style="height: 370px; width: 100%;"></canvas>
 
   <br><br><br>
	  		<center> <h2> NUMERO DE CAVITE : <b style="color:blue;"> ${infoPreforme.numero_cavite} <b> </h2> </center>
	  		<hr>
	  		<div class="table-responsive">
	  			<table class="table table-striped table-bordered">
	  			<thead class="thead-dark">
	  				<tr class="success">
	  					<th align="center" style="color:blue;"> PARAMETRES </th> 
	  					<th align="center" style="color:blue;"> DIAMETRE INTERIEUR </th>
	  					<th align="center" style="color:blue;"> DIAMETRE FILET </th>
	  					<th align="center" style="color:blue;"> OVALISATION </th>
	  					<th align="center" style="color:blue;"> VERTICALITE </th>
	  					<th align="center" style="color:blue;"> POIDS </th>
	  					<th align="center" style="color:blue;"> DEFORMATION CORPS </th>
	  					
	  				</tr>
	  			</thead>
	  			<tbody>
	  				
	  					<tr class="active">
	  						<td align="center" > RESULTAT ACTUEL</td> 
	  						<td align="center">${infoPreforme.diametre_interieur} </td>
	  						<td align="center">${infoPreforme.diametre_filet} </td>
	  						<td align="center">${infoPreforme.ovalisation} </td>
	  						<td align="center">${infoPreforme.verticalite} </td>
	  						<td align="center">${infoPreforme.poids} </td>
	  						<td align="center">${infoPreforme.deformation_corps} </td>
	  					</tr>
	  					
	  				
	  					<tr class="active">
	  						<td align="center" style="color:green;"> NORME </td> 
	  						<td align="center" style="color:green;"> ${infoPreformeNorme.diametre_interieur_norme} </td>
	  						<td align="center" style="color:green;"> ${infoPreformeNorme.diametre_filet_norme} </td>
	  						<td align="center" style="color:green;"> ${infoPreformeNorme.ovalisation_norme} </td>
	  						<td align="center" style="color:green;"> ${infoPreformeNorme.verticalite_norme} </td>
	  						<td align="center" style="color:green;"> ${infoPreformeNorme.poids_norme} </td>
	  						<td align="center" style="color:green;"> ${infoPreformeNorme.deformation_corps_norme} </td>
	  					</tr>
	  			
	  					 
	  					<tr class="active">
	  						<td align="center"> MIN </td> 
	  						<td align="center"> ${infopreforme_min.diametre_interieur_min} </td>
	  						<td align="center"> ${infopreforme_min.diametre_filet_min} </td>
	  						<td align="center"> ${infopreforme_min.ovalisation_min} </td>
	  						<td align="center"> ${infopreforme_min.verticalite_min} </td>
	  						<td align="center"> ${infopreforme_min.poids_min} </td>
	  						<td align="center"> ${infopreforme_min.deformation_corps_min} </td>
	  					</tr>
	  					
	  					<tr class="active">
	  						<td align="center"> MAX </td> 
	  						<td align="center"> ${infopreforme_max.diametre_interieur_max} </td>
	  						<td align="center"> ${infopreforme_max.diametre_filet_max} </td>
	  						<td align="center"> ${infopreforme_max.ovalisation_max} </td>
	  						<td align="center"> ${infopreforme_max.verticalite_max} </td>
	  						<td align="center"> ${infopreforme_max.poids_max} </td>
	  						<td align="center"> ${infopreforme_max.deformation_corps_max} </td>
	  					</tr>
	  					
	  					<tr class="active">
	  						<td align="center"> DELTA </td> 
	  						<td align="center"> ${delta.delta_diametre_interieur} </td>
	  						<td align="center"> ${delta.delta_diametre_filet} </td>
	  						<td align="center"> ${delta.delta_ovalisation} </td>
	  						<td align="center"> ${delta.delta_verticalite} </td>
	  						<td align="center"> ${delta.delta_poids} </td>
	  						<td align="center"> ${delta.delta_deformation_corps} </td>
	  					</tr>
	  					
	  					<tr class="active">
	  						<td align="center"> MOYENNE </td> 
	  						<td align="center"> ${moyenne.moy_diametre_interieur} </td>
	  						<td align="center"> ${moyenne.moy_diametre_filet} </td>
	  						<td align="center"> ${moyenne.moy_ovalisation} </td>
	  						<td align="center"> ${moyenne.moy_verticalite} </td>
	  						<td align="center"> ${moyenne.moy_poids} </td>
	  						<td align="center"> ${moyenne.moy_deformation_corps} </td>
	  					</tr>
	  					
	  				 
	 					<tr class="active">
	  						<td align="center"> STD DEV </td> 
	  						<td align="center"> ${std.std_diametre_interieur} </td>
	  						<td align="center"> ${std.std_diametre_filet} </td>
	  						<td align="center"> ${std.std_ovalisation} </td>
	  						<td align="center"> ${std.std_verticalite} </td>
	  						<td align="center"> ${std.std_poids} </td>
	  					    <td align="center"> ${std.std_deformation_corps} </td>
	  					</tr>
	  				       
	  				   
	  			</tbody>
	  			</table>
	  		</div>
	  	</div>


<script type="text/javascript" src="static/js/chart.min.js"></script> 

<script>
var ctx = document.getElementById('mylineChart').getContext('2d');

var myChart = new Chart(ctx, {
	animationEnabled: true,
	exportEnabled: true,
    type: 'line',
    data: {
        labels: ['diametre filet',  'ovalisation',  'deformation corps', 'verticalite'],
        datasets: [{
            label: 'NORMES',
            data: [${infoPreformeNorme.diametre_filet_norme}, ${infoPreformeNorme.ovalisation_norme}, ${infoPreformeNorme.deformation_corps_norme}, ${infoPreformeNorme.verticalite_norme}],
            fill: false,
            borderColor: 'rgb(255, 99, 132)',
            tension: 0.4
        },{
            label: 'RESULTATS',
            data: [${infoPreforme.diametre_filet}, ${infoPreforme.ovalisation}, ${infoPreforme.deformation_corps},${infoPreforme.verticalite}],
            fill: false,
            borderColor: 'rgb(54, 162, 235)',
            tension: 0.4
            
        }]//fin data set
    },
    
}); 
</script>


 <script type="text/javascript" src="static/js/util.js"></script>
<script type="text/javascript" src="static/js/jquery.js"></script>  
<script type="text/javascript" src="static/js/bootstrap.js"></script>
<script type="text/javascript" src="static/js/bootstrap-select.min.js"></script> 
</body> 
</html>