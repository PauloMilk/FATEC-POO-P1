<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="models.Aluno"%>
<%@page import="models.Disciplina"%>

<%
	Aluno aluno = (Aluno) application.getAttribute("aluno");

if (aluno == null) {
	aluno = new Aluno("Paulo Leite Costa", "123123123123");
	aluno.addDisciplina(new Disciplina("Metodologia da Pesquisa Científico-Tecnológica", "TTG001"));
	aluno.addDisciplina(new Disciplina("Inglês IV", "LIN400"));
	aluno.addDisciplina(new Disciplina("Sistemas Operacionais II", "ISO200"));
	aluno.addDisciplina(new Disciplina("Linguagem de Programação IV - INTERNET", "ILP512"));
	aluno.addDisciplina(new Disciplina("Programação Orientada a Objetos", "ILP007"));
	aluno.addDisciplina(new Disciplina("Engenharia de Software III", "IES300"));
	aluno.addDisciplina(new Disciplina("Banco de Dados", "IBD002"));
	application.setAttribute("aluno", aluno);

}

if (request.getParameter("update") != null) {
	Double nota = Double.parseDouble(request.getParameter("nota"));
	String sigla = request.getParameter("update");
	for (Disciplina dis : aluno.getDisciplinas()) {
		if (dis.getSigla().equalsIgnoreCase(sigla)) {
	dis.setNota(nota);
	break;
		}
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

<title>Hello, world!</title>
</head>
<body>
	<%@ include file="/WEB-INF/parts/menu.jspf"%>
	<main class="container mt-4">
		<h1 class="border-left border-dark pl-2">Disciplinas</h1>
		<div class="card mt-4">
			<div class="card-header">Meus dados</div>
			<div class="card-body">

				<%
					int count = 1;
				for (Disciplina disciplina : aluno.getDisciplinas()) {
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
									</button>
								</h2>

								<span class="badge badge-pill badge-primary"><%=disciplina.getNota()%></span>
							</div>
						</div>

						<div id="collapse-disciplina-<%=count%>" class="collapse"
							aria-labelledby="headingOne" data-parent="#disciplina-<%=count%>">
							<div class="card-body">
								<form class="form-inline row" method="post">

									<div class="form-group col-2 col-sm-8 col-md-2 mb-2">
										<label class="sr-only">Nota</label> <input type="number"
											class="form-control w-100" placeholder="Nota" min="0"
											max="10" name="nota">
									</div>
									<input type="hidden" value="<%=disciplina.getSigla()%>"
										name="update">
									<button type="submit" class="btn btn-primary mb-2">Salvar</button>
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

