<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>

<%

int numero1 = Integer.parseInt(request.getParameter("numero1"));
int numero2 = Integer.parseInt(request.getParameter("numero2"));
out.println(numero1 + numero2);

%>