<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="java.util.List"%>
<%@page
	import="es.avalon.respositorios.respositoriosJPA.LibroRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	LibroRepository repo = new LibroRepository();
	List<Libro> lista = repo.buscarTodosLib();
	
	for(Libro l: lista){ %>
		
		<p><%=l.getTitulo()%></p>
		<p><%=l.getTitulo()%></p>
		<p><%=l.getTitulo()%></p>
		
	<%}
	
	
%>