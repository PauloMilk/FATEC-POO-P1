package web;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import models.Disciplina;

public class DBListener implements ServletContextListener {

	private static final String CLASS_NAME = "org.sqlite.JDBC";
	private static final String URL = "jdbc:sqlite:my_disciplinas";

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("STOP");
	}

	public static Connection getConnection() throws Exception {
		return DriverManager.getConnection(URL);
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("Initialized");
		Connection conn = null;
		Statement stmt = null;
		try {
			Class.forName(CLASS_NAME);
			conn = DriverManager.getConnection(URL);
			stmt = conn.createStatement();
			stmt.execute("DROP TABLE disciplinas");
			stmt.execute(Disciplina.getCreateStatement());
			System.out.println("TABELA CRIADA");
			if (Disciplina.getList().isEmpty()) {
				stmt.execute("INSERT INTO disciplinas(nome,sigla, nota, ementa, ciclo) values"
						+ "('Sistemas Operacionais II', 'ISO200', 0,'descricao da ementa', 4),"
						+ "('Linguagem de Programação IV - INTERNET', 'ILP512', 0,'descricao da ementa', 4),"
						+ "('Programação Orientada a Objetos', 'ILP007', 0, 'descricao da ementa', 4),"
						+ "('Engenharia de Software III', 'IES300', 0, 'descricao da ementa', 4),"
						+ "('Banco de Dados', 'IBD002', 0, 'descricao da ementa', 4)");
			}

			ResultSet rs = stmt.executeQuery("SELECT * FROM disciplinas");
			while (rs.next()) {
				System.out.println(rs.getString("nome"));
			}
		} catch (Exception e) {
			System.out.println("ERRO: " + e.getLocalizedMessage());
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			try {
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
