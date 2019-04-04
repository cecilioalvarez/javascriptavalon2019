<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="java.util.List"%>
<%@page import="es.avalon.repositorios.LibroRepositorioJPA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style type="text/css">
</style>
<title>Insert title here</title>
<script type="text/javascript" src="jquery/jquery-3.3.1.js"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	$("p").mouseenter(function(){
		var texto = $(this).text();
		var datos = texto.replace(" ","").split(",");
		console.log(datos[0]);
		
		$.get("ListaCapitulos.jsp?titulo="+datos[0],function(resultado){
			var lista = JSON.parse(resultado.trim());
			
			$("#detalle").empty();
			for (var i = 0; i < lista.length; i++) {
				console.log(lista[i].titulo);
				$("#detalle").append("<p>" + lista[i].titulo + "," + lista[i].paginas + "</p>");
			}
		});
		
	});
});


</script>

<%

LibroRepositorioJPA repo = new LibroRepositorioJPA();
List<Libro> listaLibros = repo.getAllLibros();

for (Libro l:listaLibros) {%>
	
	<p> <%=l.getTitulo()%>,
	<%=l.getAutor()%>,
	<%=l.getPaginas()%> </p>
	
<%}%>

<p id="detalle">

</p>

</body>
</html>

