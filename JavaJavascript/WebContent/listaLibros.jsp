<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ page import="es.avalon.repositorioslibro.LibroRepository" %>
<%@ page import="es.avalon.jpa.negocio.Libro" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>

<%

LibroRepository lr = new LibroRepository();
List<Libro> lstLibro = lr.buscarTodos();
List<Libro> lstLibro2;

if(request.getParameter("filtro") != null){
	
	lstLibro2 = lstLibro.stream()
            .filter((l)->l.getTitulo()
            .contains(request.getParameter("filtro")))
            .collect(Collectors.toList());
} else {
	
	lstLibro2 = lstLibro;
}

for(Libro l : lstLibro2){%>
	
	
	<p class="datos"><%=l.getTitulo()%> - 
	<%=l.getAutor()%> - 
	<%=l.getPaginas()%></p>
	
	
<%}%>

