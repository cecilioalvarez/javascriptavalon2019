<%@page import="java.util.List"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="es.avalon.repositorios.LibroRepositorioJPA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
<title>Insert title here</title>
<script type="text/javascript" src="jquery/jquery-3.3.1.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	
	$("p").mouseenter(function() {
		
		var texto=$(this).text();
		var datos= texto.split(",");
		console.log(datos[0]);
		$.get("MostrarCapitulosLibro.jsp?titulo="+datos[0],function(resultado){
			
			
				var lista=JSON.parse(resultado.trim());
				
				
				$("#detalle").empty();
				
				if(lista.length > 0){
				$("#detalle").append("<h2>Capitulos</h2>");
					
				
				lista.forEach((capitulo)=> {	
					$("#detalle").append(`<p>\${capitulo.titulo} \${capitulo.paginas}</p>`);
				})
			
				}
		})
	});
	
});
</script>

</head>
<body>
<h2>Libros</h2>
<%
	LibroRepositorioJPA repo= new LibroRepositorioJPA();
	List<Libro> lista= repo.buscarTodos();
	for (Libro l:lista) { %>
		
	<p><%=l.getTitulo()%>,
	<%=l.getAutor()%>,
	<%=l.getPaginas()%></p>
		
		
<%	}
	
%>
<div id="detalle">

</div>

</body>
</html>