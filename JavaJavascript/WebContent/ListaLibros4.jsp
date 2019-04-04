<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="es.avalon.repositorios.LibroRepositorioJPA"%>
<%@page import="java.util.stream.Collectors"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	Thread.sleep(4000);

	LibroRepositorioJPA repo= new LibroRepositorioJPA();
	List<Libro> lista2= repo.buscarTodos();
	List<Libro> lista;
	if (request.getParameter("filtro")!=null) {
		
		lista=lista2.stream()
				.filter((l)->l.getTitulo()
				.contains(request.getParameter("filtro")))
				.collect(Collectors.toList());
	}else {
		
		lista=lista2;
	}
	Gson gson = new Gson();
	out.println(gson.toJson(lista));
%>