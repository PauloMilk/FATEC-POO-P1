package models;

import java.util.ArrayList;
import java.util.List;

public class Aluno {

	private String nome;
	private String matricula;
	private List<Disciplina> disciplinas = new ArrayList<>();

	public Aluno(String nome, String matricula) {
		super();
		this.nome = nome;
		this.matricula = matricula;
	}

	public void addDisciplina(Disciplina disciplina) {
		this.disciplinas.add(disciplina);
	}
	
	public int getQuantidadeDisciplinas() {
		return this.disciplinas.size();
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getMatricula() {
		return matricula;
	}

	public void setMatricula(String matricula) {
		this.matricula = matricula;
	}

	public List<Disciplina> getDisciplinas() {
		return disciplinas;
	}

	public void setDisciplinas(List<Disciplina> disciplinas) {
		this.disciplinas = disciplinas;
	}

}
