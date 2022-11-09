package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.cj.jdbc.Driver;
import com.mysql.cj.xdevapi.Result;

import DTO.ClienteDTO;

public class ClienteDAO {
	
	private static Connection con;
	private static PreparedStatement pstm;
	private static final String INSERT_SQL = "insert into cliente (nome,sobrenome,email,senha,cpf,telefone) values (?,?,?,?,?,?)";
	private static final String SELECT_SQL = "SELECT * FROM cliente";
	private static final String SELECT_BY_EMAIL_SQL = "SELECT * FROM cliente WHERE email = ?";
	private static final String SELECT_BY_CPF_SQL = "SELECT * FROM cliente WHERE cpf = ?";
	private static final String UPDATE_ID_EMAIL_SQL = "UPDATE cliente SET confirmaEmail = ? WHERE idCliente = ?";
	private static final String UPDATE_PASSWORD_SQL = "UPDATE cliente SET senha = ? WHERE idCliente = ?";
	
	public static boolean CadastrarCliente(ClienteDTO objClienteDTO) throws ClassNotFoundException {
		
		boolean sucesso = false;
		
		try {
			con = new ConexaoDAO().conexaoBD();
			
			pstm = con.prepareStatement(INSERT_SQL);
			pstm.setString(1, objClienteDTO.getNome());
			pstm.setString(2, objClienteDTO.getSobrenome());
			pstm.setString(3, objClienteDTO.getEmail());
			pstm.setString(4, objClienteDTO.getSenha());
			pstm.setString(5, objClienteDTO.getCpf());
			pstm.setString(6, objClienteDTO.getTelefone());
			
			int rowsAffected = pstm.executeUpdate();
			
			if(rowsAffected > 0) {
				sucesso = true;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return sucesso;
	}
	
	public static ArrayList<ClienteDTO> buscarClientes() throws ClassNotFoundException {

		ArrayList<ClienteDTO> clientes = new ArrayList();
		
		try {
			con = new ConexaoDAO().conexaoBD();
			pstm = con.prepareStatement(SELECT_SQL);	
			
			ResultSet rs = pstm.executeQuery();
			
			while (rs.next()) {
				int id = rs.getInt("idCliente");
				String email = rs.getString("email");
				String senha = rs.getString("senha");
				
				ClienteDTO c = new ClienteDTO();
				c.setIdCliente(id);
				c.setEmail(email);
				c.setSenha(senha);
				
				clientes.add(c);
				
			}
			
			pstm.close();
			con.close();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return clientes;
	}

	public static ClienteDTO buscarUsuarioPorEmail(String email) throws ClassNotFoundException {
		
		ClienteDTO c = null;
		
		try {
			con = new ConexaoDAO().conexaoBD();
			pstm = con.prepareStatement(SELECT_BY_EMAIL_SQL);
			
			pstm.setString(1, email);
			
			ResultSet rs = pstm.executeQuery();
			
			if(rs.next()) {
				int id =  rs.getInt("idCliente");
				String senha = rs.getString("senha");
				boolean confirmaEmail = rs.getBoolean("confirmaEmail");
				
				c = new ClienteDTO();
				c.setIdCliente(id);
				c.setEmail(email);
				c.setSenha(senha);
				c.setConfirmaEmail(confirmaEmail);
				
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return c;
	}
	
	public static ClienteDTO buscarUsuarioPorCpf(String cpf) throws ClassNotFoundException {
		
		ClienteDTO c = null;
		
		try {
			con = new ConexaoDAO().conexaoBD();
			pstm = con.prepareStatement(SELECT_BY_CPF_SQL);
			
			pstm.setString(1, cpf);
			
			ResultSet rs = pstm.executeQuery();
			
			if(rs.next()) {
				int id =  rs.getInt("idCliente");
				String email = rs.getString("email");
				String senha = rs.getString("senha");
				
				c = new ClienteDTO();
				c.setIdCliente(id);
				c.setEmail(email);
				c.setSenha(senha);
				c.setCpf(cpf);
				
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		
		return c;
	}

	public static boolean confirmaEmail(int idCliente) throws ClassNotFoundException {
		
		boolean sucesso = false;
		
		try {
			con = new ConexaoDAO().conexaoBD();
			
			pstm = con.prepareStatement(UPDATE_ID_EMAIL_SQL);
			pstm.setBoolean(1, true);
			pstm.setInt(2, idCliente);
			
			int rowsAffected = pstm.executeUpdate();
			
			if(rowsAffected > 0) {
				sucesso = true;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return sucesso;
	}
	
	public static boolean atualizarSenha(String password, int idCliente) throws ClassNotFoundException {
		
		boolean sucesso = false;
		
		try {
			con = new ConexaoDAO().conexaoBD();
			
			pstm = con.prepareStatement(UPDATE_PASSWORD_SQL);
			pstm.setString(1, password);
			pstm.setInt(2, idCliente);
			
			int rowsAffected = pstm.executeUpdate();
			
			if(rowsAffected > 0) {
				sucesso = true;
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return sucesso;
	}
}
	
