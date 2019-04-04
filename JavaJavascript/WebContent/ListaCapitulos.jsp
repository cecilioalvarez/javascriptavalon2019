<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.List"%>
<%@page import="es.avalon.respositorios.respositoriosJPA.CapituloRepository"%>
<%@page import="es.avalon.jpa.negocio.Capitulo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%

CapituloRepository cap= new CapituloRepository();
List<Capitulo> lista = cap.buscarTodosCapitulosPorLibro(request.getParameter("titulo"));

Gson gson = new Gson();
out.println(gson.toJson(lista));

%>