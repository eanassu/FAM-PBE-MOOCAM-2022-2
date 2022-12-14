<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Funcion?rios</title>
</head>
<body>
<c:import url="cabecalho.jsp"/>
<jsp:useBean id="dao" class="br.vemprafam.dao.DaoFuncionario"/>
<table border='1'>
<tr>
<th>RE</th><th>nome</th><th>data adm.</th><th>sal?rio</th><th>e-mail</th>
</tr>
<c:forEach var="funcionario" items="${dao.lista}" varStatus="id">
	<tr bgcolor="#${id.count%2==0?'aaee88':'ffffff'}">
		<td>${funcionario.re}</td>
		<td>${funcionario.nome}</td>
		<td><fmt:formatDate value="${funcionario.dataAdmissao}" pattern="dd/MM/yyyy"/></td>
		<td><fmt:formatNumber value="${funcionario.salario}" type="currency"/></td>
		<td>
		<c:if test="${not empty funcionario.email}">
			<a href="mailto:${funcionario.email}">${funcionario.email}</a>
		</c:if>
		<c:if test="${empty funcionario.email}">
			n?o informado
		</c:if>
		
		</td>
	</tr>
</c:forEach>
</table>
<br/>
<a href='/Projeto'>voltar ao menu principal</a>
<br/>
<c:import url="rodape.jsp"/>
</body>
</html>