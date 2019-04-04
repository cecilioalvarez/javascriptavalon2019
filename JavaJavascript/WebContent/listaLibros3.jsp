<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ page import="es.avalon.repositorioslibro.LibroRepository" %>
<%@ page import="es.avalon.jpa.negocio.Libro" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>

<%

LibroRepository lr = new LibroRepository();
List<Libro> lstLibro = lr.buscarTodos();

Gson gson = new Gson();
out.println(gson.toJson(lstLibro));

%>
	
	


