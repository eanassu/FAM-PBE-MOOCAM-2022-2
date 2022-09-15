package br.vemprafam.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import br.vemprafam.pojo.Funcionario;

public class DaoFuncionario {
	private Connection connection;
	private String url = "jdbc:hsqldb:hsql://localhost/";
	private String user = "SA";
	private String password = "";
	
	public DaoFuncionario() {
		try {
			connection = DriverManager.getConnection(url,user,password);
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	public void inserirFuncionario( Funcionario funcionario ) {
		try {
			String sql = "INSERT INTO FUNCIONARIOS VALUES(?,?,?,?)";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, funcionario.getRe());
			pstmt.setString(2, funcionario.getNome());
			pstmt.setDate( 3, new java.sql.Date(funcionario.getDataAdmissao().getTime()));
			pstmt.setDouble(4, funcionario.getSalario());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		
	}
	
	public void excluirFuncionario( Funcionario funcionario ) {
		try {
			String sql = "DELETE FROM FUNCIONARIOS WHERE RE=?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, funcionario.getRe());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}		
	}
	
	public List<Funcionario> getLista() {
		List<Funcionario> result = new ArrayList<>();
		try {
			Statement stmt = connection.createStatement();
			ResultSet rs = stmt.executeQuery("SELECT * FROM FUNCIONARIOS");
			while( rs.next() ) {
				int re = rs.getInt("re");
				String nome = rs.getString(2);
				Date dataAdmissao = rs.getDate(3);
				double salario  = rs.getDouble("salario");
				Funcionario funcionario = new Funcionario(re,nome,dataAdmissao,salario);
				result.add(funcionario);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
		return result;
	}
	
	public Funcionario buscarPeloRe( int re ) {
		try {
			String sql = "SELECT * FROM FUNCIONARIOS WHERE RE=?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, re);
			ResultSet rs = pstmt.executeQuery();
			if ( rs.next() ) {
				return new Funcionario(rs.getInt(1),
									   rs.getString(2),
									   rs.getDate(3),
									   rs.getDouble(4));
			} else {
				return null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}		
		
	}
	
	public void atualizarFuncionario(Funcionario funcionario) {
		try {
			String sql = "UPDATE FUNCIONARIOS SET NOME=?, DATAADMISSAO=?, SALARIO=? WHERE RE=?";
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, funcionario.getNome());
			pstmt.setDate(2, new java.sql.Date(funcionario.getDataAdmissao().getTime()));
			pstmt.setDouble(3, funcionario.getSalario());
			pstmt.setInt(4, funcionario.getRe());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}		
	}
}
