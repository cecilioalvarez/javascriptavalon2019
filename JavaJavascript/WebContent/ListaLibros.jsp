<%@page import="java.util.List"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="es.avalon.repositorios.LibroRepositorioJPA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	LibroRepositorioJPA repo= new LibroRepositorioJPA();
	List<Libro> lista= repo.buscarTodos();
	
	for (Libro l:lista){ %>
	
	<p><%=l.getTitulo()%> / 
	<%=l.getAutor()%> / 
	<%=l.getPagina()%></p>
	
	
	<%}

%>