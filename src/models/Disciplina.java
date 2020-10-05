package models;

public class Disciplina {
	
	private String nome;
	private String sigla;
	private Double nota = 0.0;
	
	
	
	public Disciplina(String nome, String sigla) {
		super();
		this.nome = nome;
		this.sigla = sigla;
	}
	
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getSigla() {
		return sigla;
	}
	public void setSigla(String sigla) {
		this.sigla = sigla;
	}
	public Double getNota() {
		return nota;
	}
	public void setNota(Double nota) {
		this.nota = nota;
	}
	
	

}
