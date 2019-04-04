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

</script>
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