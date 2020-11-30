<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="models.Aluno"%>
<%@page import="models.Disciplina"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	ArrayList<Disciplina> disciplinas = Disciplina.getList();
application.setAttribute("disciplinas", disciplinas);

if (request.getParameter("create") != null) {
	try {
		application.setAttribute("successMessage", null);
		application.setAttribute("errorMessage", null);
		String nome = request.getParameter("nome");
		String sigla = request.getParameter("sigla");
		String ementa = request.getParameter("ementa");
		Integer ciclo = Integer.parseInt(request.getParameter("ciclo"));
		Disciplina disciplina = new Disciplina(nome, sigla, ementa, ciclo);
		disciplina.cadastrar();
		application.setAttribute("successMessage", "Disciplina cadastrada com sucesso");
	} catch (Exception err) {
		application.setAttribute("errorMessage", "Ocorreu um erro ao cadastrar a disciplina");
	}
	response.sendRedirect(request.getRequestURI());
}

if (request.getParameter("delete") != null) {
	try {
		application.setAttribute("successMessage", null);
		application.setAttribute("errorMessage", null);
		Integer id = Integer.parseInt(request.getParameter("delete"));
		Disciplina.apagarDisciplina(id);
		application.setAttribute("successMessage", "Disciplina removida com sucesso");
	} catch (Exception err) {
		application.setAttribute("errorMessage", "Ocorreu um erro ao remover a disciplina");
	}
	response.sendRedirect(request.getRequestURI());
}

if (request.getParameter("update") != null) {
	try {
		application.setAttribute("successMessage", null);
		application.setAttribute("errorMessage", null);
		Double nota = Double.parseDouble(request.getParameter("nota"));
		Integer id = Integer.parseInt(request.getParameter("update"));
		Disciplina.atualizarNota(id, nota);
		application.setAttribute("successMessage", "Nota atualizada com sucesso");
	} catch (Exception err) {
		application.setAttribute("errorMessage", "Ocorreu um erro ao atualizar a nota");
	}
	response.sendRedirect(request.getRequestURI());
}
%>

<!doctype html>
<html lang="pt-br">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<title>Minhas Disciplinas</title>
</head>
<body>
	<%@ include file="/WEB-INF/parts/menu.jspf"%>
	<main class="container mt-4">
		<h1 class="border-left border-dark pl-2">Disciplinas</h1>
		<c:if test="${!empty errorMessage}">
			<div class="alert alert-danger">
				<c:out value="${errorMessage}"></c:out>
			</div>

		</c:if>
		<c:if test="${!empty successMessage}">
			<div class="alert alert-success">
				<c:out value="${successMessage}"></c:out>
			</div>
		</c:if>

		<div class="card mt-4">
			<div
				class="card-header d-flex justify-content-between align-item-center">
				<h4>Meus dados</h4>

				<button type="button" class="btn btn-primary" data-toggle="modal"
					data-target="#exampleModal" data-whatever="@mdo">+ Nova
					Disciplina</button>
			</div>
			<div class="card-body">

				<%
					int count = 1;
				for (Disciplina disciplina : disciplinas) {
				%>
				<div class="accordion" id="disciplina-<%=count%>">
					<div class="card">
						<div class="card-header"
							id="heading-collapse-disciplina-<%=count%>">
							<div class="d-flex justify-content-between align-items-center">
								<h2 class="mb-0">
									<button class="btn btn-link" type="button"
										data-toggle="collapse"
										data-target="#collapse-disciplina-<%=count%>"
										aria-expanded="true"
										aria-controls="collapse-disciplina-<%=count%>">
										<%=disciplina.getSigla()%>
										-
										<%=disciplina.getNome()%>
										(<%=disciplina.getCiclo()%>
										ciclo)
									</button>
								</h2>

								<span class="badge badge-pill badge-primary"><%=disciplina.getNota()%></span>
							</div>
						</div>

						<div id="collapse-disciplina-<%=count%>" class="collapse"
							aria-labelledby="headingOne" data-parent="#disciplina-<%=count%>">
							<div class="card-body mb-5">
								<p>
									Ementa:
									<%=disciplina.getEmenta()%></p>

								<form class="form-inline row" method="post">

									<div class="form-group col-2 col-sm-8 col-md-2 mb-2">
										<label class="sr-only">Nota</label> <input type="number"
											class="form-control w-100" placeholder="Nota" min="0"
											max="10" name="nota" step="0.1">
									</div>
									<input type="hidden" value="<%=disciplina.getId()%>"
										name="update">
									<button type="submit" class="btn btn-primary mb-2">Salvar</button>
								</form>
								<form method="post">
									<input type="hidden" value="<%=disciplina.getId()%>"
										name="delete">
									<button type="submit" class="btn btn-danger float-right">Apagar</button>
								</form>

							</div>
						</div>
					</div>

				</div>

				<%
					count++;
				}
				%>
			</div>
	</main>



	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Nova Disciplina</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<form method="post">
					<div class="modal-body">
						<input type="hidden" value="" name="create">
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Nome:</label>
							<input type="text" class="form-control" id="nome" name="nome"
								required>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Sigla:</label>
							<input type="text" class="form-control" id="sigla" name="sigla"
								required>
						</div>
						<div class="form-group">
							<label for="recipient-name" class="col-form-label">Ciclo:</label>
							<input type="number" min="1" max="6" class="form-control"
								id="ciclo" name="ciclo" required>
						</div>
						<div class="form-group">
							<label for="message-text" class="col-form-label">Ementa:</label>
							<textarea class="form-control" id="ementa" name="ementa" required></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-primary">Cadastrar</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<style>
.btn {
	white-space: normal;
}
</style>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>

