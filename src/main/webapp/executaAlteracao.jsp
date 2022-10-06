<%@page import="br.vemprafam.pojo.Funcionario"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.vemprafam.dao.DaoFuncionario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Alteração</title>
</head>
<body>
<%
int re = Integer.parseInt(request.getParameter("re"));
String nome = request.getParameter("nome");
SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
Date dataAdmissao;
try {
	dataAdmissao = format.parse(request.getParameter("dataAdm"));
} catch (ParseException e) {
	dataAdmissao = null;
} 
double salario = Double.parseDouble(request.getParameter("salario"));
String email = request.getParameter("email");
DaoFuncionario dao = new DaoFuncionario();
dao.atualizarFuncionario(new Funcionario(re,nome,dataAdmissao,salario,email));
%>
Funcionario atualizado
<br/>
<a href='/Projeto'>voltar ao menu principal</a>

</body>
</html>