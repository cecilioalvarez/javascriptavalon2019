<%@page import="es.avalon.jpa.negocio.Capitulo"%>
<%@page import="es.avalon.repositorios.CapituloRepositorioJPA"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="es.avalon.repositorios.CapituloRepositorioJPA"%>
<%@page import="java.util.stream.Collectors"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CapituloRepositorioJPA  repo= new CapituloRepositorioJPA();

	List<Capitulo> lista= repo.buscarTodosParaUnLibro(new Libro(request.getParameter("titulo")));
	Gson gson = new Gson();
	out.println(gson.toJson(lista));
%>