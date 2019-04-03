<%@page import="com.google.gson.Gson"%>
<%@page
	import="es.avalon.respositorios.respositoriosJPA.LibroRepository"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Collectors"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%
	LibroRepository repo=new LibroRepository();
	List<Libro> lista2=repo.buscarTodosLib();
	List<Libro> lista;
			
		if(request.getParameter("filtro")!=null){
			lista=lista2.stream().filter((l)->l.getTitulo().contains(request.getParameter("filtro"))).collect(Collectors.toList());
		}else{
			lista=lista2;
		}
			
	out.println(lista);
	
	Gson gson=new Gson();
	out.println(gson.toJson(lista));
	
%>