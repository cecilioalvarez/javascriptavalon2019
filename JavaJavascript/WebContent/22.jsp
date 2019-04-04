<%@page import="es.avalon.jpa.negocio.Capitulo"%>
<%@page import="es.avalon.repositorios.CapitulosRepositorioJPA"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="es.avalon.repositorios.LibroRepositorioJPA"%>
<%@page import="java.util.stream.Collectors" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
<script type="text/javascript" src="jquery/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$("p").mouseenter(function(){
		var texto=$(this).text();
		var datos= texto.split(",");
		
		console.log(datos[0]);
		$.get("ListaCapitulos.jsp?titulo="+datos[0],function(resultado){
			console.log(resultado.trim());
			var lista=JSON.parse(resultado.trim());
			console.log(lista);
			$("#detalle").empty();
			lista.forEach((capitulo)=>{
			$("#detalle").append(`<p> \${capitulo.titulo} \${capitulo.paginas} </p>`);
				
			})
			
		})
	});
});
</script>
</head>
<body>
    
<%

	LibroRepositorioJPA repo= new LibroRepositorioJPA();
	List<Libro> lista= repo.buscarTodos();
		
	for (Libro l:lista){ %>
	
	<p><%=l.getTitulo()%>,
	<%=l.getAutor()%>, 
	<%=l.getPagina()%></p> 

<% 	}
%>
<div id="detalle">

</div>
</body>
</html>