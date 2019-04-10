<%@page import="es.avalon.jpa.negocio.Capitulo"%>
<%@page import="es.avalon.repositorios.jpa.CapitulosRepositorioJPA"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="es.avalon.repositorios.jpa.LibroRepositorioJPA"%>
<%@page import="java.util.stream.Collectors" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%

	
CapitulosRepositorioJPA repocap= new CapitulosRepositorioJPA();
List<Capitulo> lista= repocap.buscarTodosParaUnLibro(new Libro(request.getParameter("titulo")));
	
	Gson gson=new Gson();
	out.println(gson.toJson(lista));
		
%>