<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.vemprafam.pojo.Funcionario"%>
<%@page import="br.vemprafam.dao.DaoFuncionario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="fam" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formul�rio de altera��o</title>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
<%
int re = Integer.parseInt(request.getParameter("re"));

DaoFuncionario dao = new DaoFuncionario();
Funcionario f = dao.buscarPeloRe(re);
SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
String dataAdmissaoStr = format.format(f.getDataAdmissao());
%>

<form action="mvc">
RE:<input type='text' name='re' value='<%=f.getRe()%>'/><br/>
nome:<input type='text' name='nome' value='<%=f.getNome()%>'/><br/>
data de admiss�o:<fam:campoData id='dataAdm' value='<%=dataAdmissaoStr%>'/><br/>
sal�rio:<input type='text' name='salario' value='<%=f.getSalario()%>'/><br/>
e-mail:<input type='text' name='email' value='<%=f.getEmail()%>'/><br/>
<input type="hidden" name="logica" value="LogicaAlteracao"/>
<input type='submit' value='Enviar'>
</form>
<br/>
<a href='/Projeto'>voltar ao menu principal</a>
</body>
</html>