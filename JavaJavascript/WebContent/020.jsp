<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.verde {
	color: green;
	front-size: 20px;
	padding: 10px;
}

.rosa {
	color: red;
	front-size: 20px;
	padding: 10px;
}

.azul {
	color: blue;
	front-size: 20px;
	padding: 10px;
}

.seleccionada {
	background-color: pink;
}
</style>

<title>Insert title here</title>
<script type="text/javascript" src="jquery-3.3.1.js"></script>

<script type="text/javascript">
	$(document).ready(function() {

		//me carga las dos listas a la vez, dando a un boton
	
		$("#ajax").click(function() {
			
			
			$.get("../ListaLibros4.jsp", function(datos){
				
				console.log(datos);
				
				var datos = JSON.parse(datos.trim());
			
				console.log(datos);
				
				for(var i =0; i<datos.length; i++){
				$("body").append("<p>"+datos[i].titulo+", "+datos[i].autor+", "+datos[i].paginas+"</p>");
					}
				})
				
				
			$.get("../ListaLibros5.jsp", function(datos){
				
				console.log(datos);
				
				var datos = JSON.parse(datos.trim());
			
				console.log(datos);
				
				for(var i =0; i<datos.length; i++){
				$("body").append("<p>"+datos[i].titulo+", "+datos[i].autor+", "+datos[i].paginas+"</p>");
					}
				})
				
			})
				

		})
			

</script>
</head>
<body>
