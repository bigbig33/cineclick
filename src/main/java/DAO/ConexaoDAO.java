package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexaoDAO {
	
	public Connection conexaoBD() throws ClassNotFoundException {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/cinema?user=root&password=root&useTimezone=true&serverTimezone=UTC";
			con = DriverManager.getConnection(url);
			
		} catch (SQLException e) {
			System.out.println(e);
		}
		
		return con;
	}
	
}
