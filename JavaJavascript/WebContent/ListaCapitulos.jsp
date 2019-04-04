<%@page import="com.google.gson.Gson"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="java.util.List"%>
<%@page import="es.avalon.jpa.negocio.Capitulo"%>
<%@page import="es.avalon.repositorios.CapituloRepositorioJPA2"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<% 
CapituloRepositorioJPA2 repo=new CapituloRepositorioJPA2();
List<Capitulo> lista=repo.buscarTodosCapitulosPorLibro(new Libro(request.getParameter("titulo")));		
Gson gson=new Gson();
out.println(gson.toJson(lista));
%>
