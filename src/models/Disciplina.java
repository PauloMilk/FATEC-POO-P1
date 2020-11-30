package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import web.DBListener;

public class Disciplina {
	private Integer id;
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

	public Disciplina(Integer id, String nome, String sigla, Double nota, String ementa, int ciclo) {
		super();
		this.id = id;
		this.nome = nome;
		this.sigla = sigla;
		this.nota = nota;
		this.ementa = ementa;
		this.ciclo = ciclo;
	}

	public static String getCreateStatement() {
		return "CREATE TABLE IF NOT EXISTS disciplinas(id INTEGER primary key AUTOINCREMENT, "
				+ "nome VARCHAR(200) UNIQUE NOT NULL," + "sigla VARCHAR(40) UNIQUE NOT NULL,"
				+ "nota DECIMAL(2,2) DEFAULT 0.0," + "ementa VARCHAR(255) NOT NULL," + "ciclo INT NOT NULL DEFAULT 1"
				+ ")";
	}

	public static ArrayList<Disciplina> getList() throws Exception {
		ArrayList<Disciplina> list = new ArrayList<Disciplina>();
		Connection conn = DBListener.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM disciplinas");
		while (rs.next()) {
			list.add(new Disciplina(rs.getInt("id"), rs.getString("nome"), rs.getString("sigla"), rs.getDouble("nota"),
					rs.getString("ementa"), rs.getInt("ciclo")));
		}
		conn.close();
		stmt.close();
		return list;
	}

	public static void atualizarNota(Integer id, Double nota) throws Exception {
		Connection conn = DBListener.getConnection();
		PreparedStatement stmt = conn.prepareStatement("UPDATE disciplinas SET nota = ? WHERE id = ?");
		stmt.setDouble(1, nota);
		stmt.setInt(2, id);
		stmt.execute();
		conn.close();
		stmt.close();
		System.out.println("ATUALIZADO");
	}
	

	public static void apagarDisciplina(Integer id) throws Exception {
		Connection conn = DBListener.getConnection();
		PreparedStatement stmt = conn.prepareStatement("DELETE FROM disciplinas WHERE id = ?");
		stmt.setDouble(1, id);
		stmt.execute();
		conn.close();
		stmt.close();
		System.out.println("REMOVIDO");
	}
	
	public void cadastrar()  throws Exception {
		Connection conn = DBListener.getConnection();
		PreparedStatement stmt = conn.prepareStatement("INSERT INTO disciplinas(nome,sigla, nota, ementa, ciclo) values(?,?,0,?,?)");
		stmt.setString(1, this.getNome());
		stmt.setString(2, this.getSigla());
		stmt.setString(3, this.getEmenta());
		stmt.setInt(4, this.ciclo);
		stmt.execute();
		conn.close();
		stmt.close();
		System.out.println("CADASTRADO");
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

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

}
