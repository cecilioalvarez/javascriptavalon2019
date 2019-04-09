<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="java.util.List"%>
<%@page import="es.avalon.repositorios.jpa.LibroRepositorioJPA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

LibroRepositorioJPA repo = new LibroRepositorioJPA();
List<Libro> listaLibros = repo.getAllLibros();

for (Libro l:listaLibros) {%>
	
	<p> <%=l.getTitulo()%>
	<%=l.getAutor()%>
	<%=l.getPaginas()%> </p>
	
<%}

%>