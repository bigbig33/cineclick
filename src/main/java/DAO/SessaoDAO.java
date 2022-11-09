package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import DTO.ClienteDTO;
import DTO.SessaoDTO;

public class SessaoDAO {
	private static Connection con;
	private static PreparedStatement pstm;
	private static final String INSERT_SQL = "insert into sessao (nomeFilme,dataFilme,horaFilme,tipoIngresso,quantidade,preco,tipoPagamento,idCliente) values (?,?,?,?,?,?,?,?)";
	private static final String SELECT_BY_USER_ID_SQL = "SELECT * FROM tarefa WHERE idCliente = ?";
	
	public static ArrayList<SessaoDTO> buscarSessaoCliente(ClienteDTO objClienteDTO) throws ClassNotFoundException{
		
		ArrayList<SessaoDTO> sessao = new ArrayList();
		
		try {
			con = new ConexaoDAO().conexaoBD();
			pstm = con.prepareStatement(SELECT_BY_USER_ID_SQL);	
			
			ResultSet rs = pstm.executeQuery();
			
			while (rs.next()) {
				int idSessao = rs.getInt("idSessao");
				String nomeFilme = rs.getString("nomeFilme");
				String dataFilme = rs.getString("dataFilme");
				String horaFilme = rs.getString("horaFilme");
				String tipoIngresso = rs.getString("tipoIngresso");
				int quantidade = rs.getInt("quantidade");
				double preco = rs.getDouble("preco");
				String tipoPagamento = rs.getString("tipoPagamento");
				
				SessaoDTO s = new SessaoDTO();
				s.setIdSessao(idSessao);
				s.setNomeFilme(nomeFilme);
				s.setDataFilme(dataFilme);
				s.setHoraFilme(horaFilme);
				s.setTipoIngresso(tipoIngresso);
				s.setQuantidade(quantidade);
				s.setPreco(preco);
				s.setTipoPagamento(tipoPagamento);
				s.setIdCliente(objClienteDTO.getIdCliente());
				
				sessao.add(s);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return sessao;
	}

	public static boolean inserirSessao(SessaoDTO objSessaoDTO) throws ClassNotFoundException {
		
		boolean sucesso = false;
		
		try {
			con = new ConexaoDAO().conexaoBD();
			pstm = con.prepareStatement(INSERT_SQL);
			
			pstm.setString(1, objSessaoDTO.getNomeFilme());
			pstm.setString(2, objSessaoDTO.getDataFilme());
			pstm.setString(3, objSessaoDTO.getHoraFilme());
			pstm.setString(4, objSessaoDTO.getTipoIngresso());
			pstm.setInt(5, objSessaoDTO.getQuantidade());
			pstm.setDouble(6, objSessaoDTO.getPreco());
			pstm.setString(7, objSessaoDTO.getTipoPagamento());
			pstm.setInt(8, objSessaoDTO.getIdCliente());
			
			int rowsAffected = pstm.executeUpdate();
			
			sucesso = rowsAffected > 0;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return sucesso;
	}
}
