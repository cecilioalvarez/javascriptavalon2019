<%@page import="com.google.gson.JsonArray"%>
<%@page import="com.google.gson.JsonParser"%>
<%@page import="com.google.gson.GsonBuilder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="es.avalon.repositorios.CapituloRepositorioJPA"%>
<%@page import="es.avalon.jpa.negocio.Capitulo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    


<%

String titulo = request.getParameter("titulo");
//String autor = request.getParameter("autor");
//int paginas = Integer.parseInt(request.getParameter("paginas"));


Libro libro = new Libro(titulo);
System.out.println(titulo);

CapituloRepositorioJPA repo = new CapituloRepositorioJPA();
List<Capitulo> lista= new ArrayList<Capitulo>();

lista =repo.buscarTodosParaUnLibro(libro);
//System.out.println(lista.length());
Gson gson = new Gson();
out.println(gson.toJson(lista));


//Gson prettyGson = new GsonBuilder().setPrettyPrinting().create();
//out.println(prettyGson.toJson(lista));


%>

