<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ page import="es.avalon.repositorioscapitulo.CapituloRepository" %>
<%@ page import="es.avalon.jpa.negocio.Capitulo" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>

<%

CapituloRepository cr = new CapituloRepository();
List<Capitulo> lstCapitulo = cr.buscarPorTituloLibro(request.getParameter("tituloLibro"));

Gson gson = new Gson();
out.println(gson.toJson(lstCapitulo));

%>
	
	


