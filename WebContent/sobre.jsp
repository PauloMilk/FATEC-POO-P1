<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="models.Aluno"%>
<%@page import="models.Disciplina"%>

<%
	Aluno aluno = (Aluno) application.getAttribute("aluno");

if (aluno == null) {
	aluno = new Aluno("Paulo Leite Costa", "123123123123");
	aluno.addDisciplina(new Disciplina("Inglês IV", "LIN400", "descricao da ementa", 4));
	aluno.addDisciplina(new Disciplina("Sistemas Operacionais II", "ISO200", "descricao da ementa", 4));
	aluno.addDisciplina(new Disciplina("Linguagem de Programação IV - INTERNET", "ILP512", "descricao da ementa", 4));
	aluno.addDisciplina(new Disciplina("Programação Orientada a Objetos", "ILP007", "descricao da ementa", 4));
	aluno.addDisciplina(new Disciplina("Engenharia de Software III", "IES300", "descricao da ementa", 4));
	aluno.addDisciplina(new Disciplina("Banco de Dados", "IBD002", "descricao da ementa", 4));
	application.setAttribute("aluno", aluno);

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
		<h1 class="border-left border-dark pl-2">Sobre</h1>
		<div class="card mt-4">
			<div class="card-header">Meus dados</div>
			<div class="card-body">
				<div class="row">
					<div class="form-group col-sm-12 col-md-4 col-4">
						<label for="nome">Nome:</label> <input type="text" readonly
							class="form-control-plaintext border text-center" id="nome"
							value=<%=aluno.getNome()%>">

					</div>

					<div class="form-group col-sm-12 col-md-4 col-4">
						<label for="matricula">Matricula:</label> <input type="text"
							readonly class="form-control-plaintext border text-center"
							id="matricula" value="<%=aluno.getMatricula()%>">

					</div>

					<div class="form-group col-sm-12 col-md-4 col-4">
						<label>Link do GitHub :</label> <a href="#"
							class="form-control-plaintext border text-center">GitHub</a>

					</div>
				</div>
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

