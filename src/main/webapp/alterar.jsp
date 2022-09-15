<%@page import="java.text.SimpleDateFormat"%>
<%@page import="br.vemprafam.pojo.Funcionario"%>
<%@page import="br.vemprafam.dao.DaoFuncionario"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Formulário de alteração</title>
</head>
<body>
<%
int re = Integer.parseInt(request.getParameter("re"));

DaoFuncionario dao = new DaoFuncionario();
Funcionario f = dao.buscarPeloRe(re);
SimpleDateFormat format = new SimpleDateFormat("dd/MM/yyyy");
String dataAdmissaoStr = format.format(f.getDataAdmissao());
%>

<form action="executaAlteracao.jsp">
RE:<input type='text' name='re' value='<%=f.getRe()%>'/><br/>
nome:<input type='text' name='nome' value='<%=f.getNome()%>'/><br/>
data de admissão:<input type='text' name='dataAdm' value='<%=dataAdmissaoStr%>'/><br/>
salário:<input type='text' name='salario' value='<%=f.getSalario()%>'/><br/>
<input type='submit' value='Enviar'>
</form>
<br/>
<a href='/Projeto'>voltar ao menu principal</a>
</body>
</html>