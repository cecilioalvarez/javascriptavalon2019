<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="java.util.List"%>
<%@page import="es.avalon.respositorios.respositoriosJPA.LibroRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="jquery/jquery-3.3.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("p").mouseenter(function(){
		var texto = $(this).text();
		var datos = texto.split(",");
		console.log(datos[0]);
		$.get("ListaCapitulos.jsp?titulo="+datos[0], function(resultado){
			var lista = JSON.parse(resultado.trim());
			
			$("#detalle").empty();
			
			for(var i=0;i<lista.length;i++){

				console.log("<p>"+lista[i].nombre+","+lista[i].paginas+"</p>");
				$("#detalle").append("<p>"+lista[i].nombre+","+lista[i].paginas+"</p>");
				
			}
			
			
		})
	})
	
})

</script>

</head>
<body>

<%

LibroRepository repo = new LibroRepository();
List<Libro> lista = repo.buscarTodosLib();

for(Libro l : lista){
%>

<p><%=l.getTitulo() %>, <%=l.getTitulo() %>, <%=l.getTitulo() %></p>

<%} %>

<p>************************************</p>

<div id="detalle"></div>

</body>
</html>