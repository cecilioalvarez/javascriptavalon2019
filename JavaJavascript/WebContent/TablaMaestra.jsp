<%@page import="com.google.gson.Gson"%>
<%@page import="es.avalon.repositorios.LibroRepositorioJPA"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.stream.Collectors"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
</style>
<title>Insert title here</title>
<script type="text/javascript" src="jQuery/jquery-3.3.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("p").mouseenter(function(){
		var texto=$(this).text();
		var datos=texto.split(",");
		console.log(datos[0])
		$.get("ListaCapitulos.jsp?titulo="+datos[0],function(resultado){
			var lista=JSON.parse(resultado.trim());
			$("#detalle").empty();
// 			for(var i=0;i<lista.length;i++){
// 				$("#detalle").append("<p>"+lista[i].titulo+","+lista[i].paginas+"</p>");
// 			}
			lista.forEach((capitulo)=>{
				var plantilla=`<p>\${capitulo.titulo},${capitulo.paginas}</p>`;
				$("#detalle").append(plantilla);
			})
		})
	})
});

</script>
</head>
<body>

<%
LibroRepositorioJPA repo=new LibroRepositorioJPA();
List<Libro> lista=repo.buscarTodos();

for(Libro l:lista){%>
<p><%=l.getTitulo()%>,<%=l.getAutor()%>,<%=l.getPaginas()%></p>
<%}%>
<p>Los capitulos son:</p>
<p id="detalle"/>
</body>
</html>