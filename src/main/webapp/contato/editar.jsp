<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de contato</title>
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/css/memoriam.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>
				Memori<i class="glyphicon glyphicon-phone"></i>m
			</h2>
			<nav class="navbar navbar-default">
			<div class="navbar-header">
				<a class="navbar-brand" href="${pageContext.request.contextPath}">
					Memoriam </a>
			</div>
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class="active"><a
						href="${pageContext.request.contextPath}">Contatos</a></li>
					<li><a
						href="${pageContext.request.contextPath}/controller.do?op=conope">Operadoras</a></li>
				</ul>
			</div>
			</nav>
			<h4>Dados do contato</h4>
			<c:if test="${not empty msgs}">
				<div align="left">
					<div style="color: red">
						<ul style="padding-left: 0px;">
							<c:forEach var="msg" items="${msgs}">
								<li style="list-style-type: none;">${msg}</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</c:if>

			<form action="${pageContext.request.contextPath}/controller.do"
				method="post" class="form-horizontal">
				<input type="hidden" name="op" value="edtctt"> <input
					type="hidden" name="id" value="${contato.id}"> <input
					id="nome" value="${contato.nome}" name="nome" type="text"
					class="form-control" placeholder="Nome"> <input id="fone"
					value="${contato.fone}" name="fone" type="text"
					class="form-control" placeholder="Fone">

				<fmt:formatDate var="dataAniv" value="${contato.dataAniversario}"
					pattern="dd/MM/yyyy" />

				<input id="dataaniv" value="${dataAniv}" name="dataaniv"
					class="form-control" type="date"
					placeholder="Data de criação (dd/mm/aaaa)" /> <select
					class="form-control" id="operadora" name="operadora">
					<option value="${null}" label="Selecione a operadora">Selecione
						a operadora</option>
					<c:forEach var="operadora" items="${utilBean.operadoras}">
						<c:if test="${operadora.id eq contato.operadora.id}">
							<option value="${operadora.id}" label="${operadora.nome}"
								selected>${operadora.nome}</option>
						</c:if>
						<c:if test="${operadora.id ne contato.operadora.id}">
							<option value="${operadora.id}" label="${operadora.nome}">
								${operadora.nome}</option>
						</c:if>
					</c:forEach>
				</select>

				<div class="row">
					<div class="col-md-6">
						<input type="submit" class="form-control btn btn-primary"
							value="Salvar">
					</div>
					<div class="col-md-6">
						<a class="form-control btn btn-success"
							href="${pageContext.request.contextPath}">Voltar</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<c:set var="endofconversation" value="true" scope="request" />
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>