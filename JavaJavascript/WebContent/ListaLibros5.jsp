<%@page import="com.google.gson.Gson"%>
<%@page
	import="es.avalon.respositorios.respositoriosJPA.LibroRepository"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Collectors"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	Thread.sleep(3000);

	LibroRepository repo = new LibroRepository();
	List<Libro> lista = repo.buscarTodosLib();

	Gson gson = new Gson();
	out.println(gson.toJson(lista));
%>