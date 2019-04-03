<%@page import="es.avalon.repositorios.LibroRepositorioJPA"%>
<%@page import="es.avalon.jpa.negocio.Libro"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Collectors"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
	LibroRepositorioJPA repo=new LibroRepositorioJPA();
	List<Libro> lista2=repo.buscarTodos();
	List<Libro> lista;
			
		if(request.getParameter("filtro")!=null){
			
			lista=lista2.stream().filter((l)->l.getTitulo().contains(request.getParameter("filtro"))).collect(Collectors.toList());
		}else{
			lista=lista2;
		}
			
	
	for(Libro l:lista){%>
	<p><%=l.getTitulo()%>,<%=l.getAutor()%>,<%=l.getPaginas()%></p>
	<%}

%>