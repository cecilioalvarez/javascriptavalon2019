<%@page import="java.util.List"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="es.avalon.repositorios.LibroRepositorioJPA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<script type="text/javascript" src="jquery/jquery-3.3.1.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	
	var titulo;

	$("tr").mouseenter(function(){
		
		
		$(this).find("td").each(function(index){
			if(index == 0){
				titulo = $(this).eq(0).text();
				console.log(titulo);
			}
		})
		
		
	$.get("MostrarCapitulosLibro.jsp?titulo="+titulo, function(datos){
	
	
		console.log("llega :",datos);

		datos = JSON.parse(datos.trim());
	
		console.log("JSON: ",datos);
		
	
		
		$("#detalle").empty();
		
		for (var i = 0; i < datos.length; i++) {
			
			$("#detalle").append("<p>"+datos[i].titulo+" - "+datos[i].paginas+"</p>")
		}
		
		

	})	
		
	})
	
})


</script>

</head>
<body>
<%
LibroRepositorioJPA repo = new LibroRepositorioJPA();
List<Libro> lista = repo.buscarTodos();
%>

<table border="1">
<tr>
<th>Titulo</th><th>Autor</th><th>Páginas</th>
</tr>
<%for(Libro l:lista){%>

<tr>
<td><%=l.getTitulo()%></td>
<td><%=l.getAutor()%></td>
<td><%=l.getPaginas()%></td>
</tr>
<%	
}
%>
</table>

<div id="detalle">
</div>

</body>
</html>