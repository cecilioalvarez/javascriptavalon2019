<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="es.avalon.repositorios.LibroRepositorioJPA"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%

Thread.sleep(4000);

LibroRepositorioJPA repo = new LibroRepositorioJPA();
List<Libro> lista2 = repo.buscarTodos();
List<Libro> lista;

if(request.getParameter("filtro")!=null){
	//filtra por conjunto de palabras como un %LIKE%
 lista = lista2.stream()
.filter((l)->l.getTitulo()
		.contains(request.getParameter("filtro")))
.collect(Collectors.toList());
	
}else{
	lista=lista2;
}


Gson gson = new Gson();
out.println(gson.toJson(lista));


%>