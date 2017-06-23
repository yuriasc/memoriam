<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Memoriam</title>
<link
	href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/memoriam.css"
	rel="stylesheet">
</head>
<body>
	<div class="container">
		<div class="jumbotron">
			<h2>
				Memori<i class="glyphicon glyphicon-phone"></i>m.
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
			<table class="table table-striped table-bordered">
				<tr align="left">
					<th></th>
					<th style="width: 30%">Nome</th>
					<th>Telefone</th>
					<th>Operadora</th>
				</tr>
				<form
					action="${pageContext.request.contextPath}/controller.do?op=deletectt"
					id="form_del" method="POST">
					<c:forEach var="contato" items="${contatos}">
						<tr align="left">
							<td align="center"><input class="selections"
								name="del_selected" type="checkbox" value="${contato.id}" /></td>
							<td><a href="controller.do?op=edtctt&id=${contato.id}">${contato.nome}</a></td>
							<td>${contato.fone}</td>
							<td>${contato.operadora.nome}</td>
						</tr>
					</c:forEach>
				</form>
			</table>

			<div class="row">
				<div class="col-md-6">
					<a href="contato/cadastro.jsp" class="form-control btn btn-primary"
						style="width: 350px;">Novo Contato</a><br>
				</div>
				<div class="col-md-6">
					<a class="form-control btn btn-danger btn_delete"
						style="display: none; width: 350px">Apagar selecionados</a>
				</div>
			</div>

		</div>
	</div>
	<form id="form_oculto" action="" style="display: none;"></form>
</body>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/bootstrap/dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/bootstrap/dist/sweetalert.css">
<script>
	$(document)
			.ready(
					function() {

						$(".selections").change(function() {
							if ($('.selections:checkbox:checked').length > 0) {
								$(".btn_delete").show();
								$(".btn_novo").hide();
							} else {
								$(".btn_delete").hide();
								$(".btn_novo").show();
							}

						});

						$(".btn_delete")
								.click(
										function() {
											selecionados = $('.selections:checkbox:checked');
											swal(
													{
														title : "Você tem certeza?",
														text : "Você não sera capaz de recuperar esses dados!",
														type : "warning",
														showCancelButton : true,
														confirmButtonColor : "#DD6B55",
														confirmButtonText : "Sim, delete!",
														cancelButtonText : "Não, cancele!",
														closeOnConfirm : false,
														closeOnCancel : false
													},
													function(isConfirm) {
														if (isConfirm) {
															swal(
																	"Deletado!",
																	"Dados deletados com sucesso.",
																	"success");
															$("#form_del")
																	.submit();
														} else {
															swal(
																	"Cancelado",
																	"Voce cancelou a operação :)",
																	"error");
														}
													});
										});
					});
</script>
</html>
