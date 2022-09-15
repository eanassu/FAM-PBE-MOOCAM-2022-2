<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Primeira página JSP</title>
</head>
<body>
Teste JSP<br/>
<%-- comentário em JSP --%>
<% 
String texto = "Texto para teste";
out.println(texto);
%>
<br/>
<%=texto%>
<%
System.out.println("Tudo foi executado!");
%>
</body>
</html>