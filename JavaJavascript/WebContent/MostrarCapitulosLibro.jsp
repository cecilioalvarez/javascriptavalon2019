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
String autor = request.getParameter("autor");
int paginas = Integer.parseInt(request.getParameter("paginas"));

Libro libro = new Libro(titulo,autor,paginas);
//out.println(numero1+numero2);


CapituloRepositorioJPA repo = new CapituloRepositorioJPA();
List<Capitulo> lista= new ArrayList<Capitulo>();
if (lista != null) {
lista =repo.buscarTodosParaUnLibro(libro);
	
Gson gson = new Gson();
Gson prettyGson = new GsonBuilder().setPrettyPrinting().create();
//out.println(prettyGson.toJson(lista));

JsonParser parser = new JsonParser();

// Obtain Array
JsonArray json = parser.parse(prettyGson.toJson(lista)).getAsJsonArray();
out.println(json);

}
%>
<body>	

<p><%request.getParameter("titulo");%></p>
<p><%request.getParameter("autor");%></p>
<p><%request.getParameter("paginas");%></p>

</body>
 
