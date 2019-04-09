<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="es.avalon.jpa.negocio.Capitulo"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="es.avalon.repositorios.jpa.CapituloRepositorioJPA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
CapituloRepositorioJPA repo = new CapituloRepositorioJPA();
List<Capitulo> listaCapitulos = repo.getAllCapitulosPorTituloLibro(request.getParameter("titulo"));

Gson gson = new Gson();
out.println(gson.toJson(listaCapitulos));

%>