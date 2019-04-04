<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>
<%@ page import="es.avalon.repositorioslibro.LibroRepository" %>
<%@ page import="es.avalon.jpa.negocio.Libro" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.stream.Collectors" %>

<%

Thread.sleep(2000);
LibroRepository lr = new LibroRepository();
List<Libro> lstLibro = lr.buscarTodos();
List<Libro> lstLibro2;

if(request.getParameter("filtro") != null){
	
	lstLibro2 = lstLibro.stream()
            .filter((l)->l.getTitulo()
            .contains(request.getParameter("filtro")))
            .collect(Collectors.toList());
} else {
	
	lstLibro2 = lstLibro;
}

Gson gson = new Gson();
out.println(gson.toJson(lstLibro2));

%>
	
	


