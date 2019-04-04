<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="es.avalon.repositorios.LibroRepositorioJPA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%

LibroRepositorioJPA repo = new LibroRepositorioJPA();
List<Libro> listaLibros2 = repo.getAllLibros();
List<Libro> listaLibros;
if (request.getParameter("filtro") != null) {
	
	listaLibros = listaLibros2.stream()
					.filter((l)->l.getTitulo().toLowerCase()
					.contains(request.getParameter("filtro").toLowerCase()))
					.collect(Collectors.toList());
	
} else {
	listaLibros = listaLibros2;
}


for (Libro l:listaLibros) {%>
	
	<p> <%=l.getTitulo()%>
	<%=l.getAutor()%>
	<%=l.getPaginas()%> </p>
	
<%}

%>