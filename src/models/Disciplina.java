package models;

public class Disciplina {

	private String nome;
	private String sigla;
	private Double nota = 0.0;
	private String ementa;
	private int ciclo;

	public Disciplina(String nome, String sigla, String ementa, int ciclo) {
		super();
		this.nome = nome;
		this.sigla = sigla;
		this.ementa = ementa;
		this.ciclo = ciclo;
	}

	public String getEmenta() {
		return ementa;
	}

	public void setEmenta(String ementa) {
		this.ementa = ementa;
	}

	public int getCiclo() {
		return ciclo;
	}

	public void setCiclo(int ciclo) {
		this.ciclo = ciclo;
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
