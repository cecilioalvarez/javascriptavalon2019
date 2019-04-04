<%@page import="java.util.List"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="es.avalon.repositorios.LibroRepositorioJPA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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