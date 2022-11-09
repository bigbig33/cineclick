package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.SessaoDAO;
import DTO.ClienteDTO;
import DTO.SessaoDTO;
import email.EnviarEmail;

/**
 * Servlet implementation class ComprarIngresso
 */
@WebServlet("/ComprarIngresso")
public class ComprarIngresso extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ComprarIngresso() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		ClienteDTO objClienteDTO = (ClienteDTO) session.getAttribute("usuarioLogado");
		SessaoDTO objSessaoDTO = new SessaoDTO();
		boolean sucesso = false;
		boolean enviou = false;
		
		if(objClienteDTO == null) {
			response.sendRedirect("login.jsp");
		}else {
			try {
				
				
				Integer quantidadeInteiro = Integer.parseInt(request.getParameter("qtdInteiro"));
				String nomeFilmeInteiro = request.getParameter("nomeFilmeInteiro");
				String dataFilmeInteiro = request.getParameter("dataFilme");
				String horaFilmeInteiro = request.getParameter("horaFilme");
				Double precoInteiro = Double.parseDouble(request.getParameter("precoInteiro"));
				String tipoIngressoInteiro = request.getParameter("tipoIngressoInteiro");
				String tipoPagamentoInteiro = request.getParameter("tipoPagamento");
				
				if(quantidadeInteiro>0) {
					for(var i=1; i<=quantidadeInteiro; i++) {
						
						objSessaoDTO.setNomeFilme(nomeFilmeInteiro);
						objSessaoDTO.setDataFilme(dataFilmeInteiro);
						objSessaoDTO.setHoraFilme(horaFilmeInteiro);
						objSessaoDTO.setTipoIngresso(tipoIngressoInteiro);
						objSessaoDTO.setQuantidade(i);
						objSessaoDTO.setPreco(precoInteiro);
						objSessaoDTO.setTipoPagamento(tipoPagamentoInteiro);
						objSessaoDTO.setIdCliente(objClienteDTO.getIdCliente());
						
						sucesso = SessaoDAO.inserirSessao(objSessaoDTO);
					}
					
					if(sucesso) {
						EnviarEmail enviar = new EnviarEmail();
						enviar.setEmailDestinatario(objClienteDTO.getEmail());
						enviar.setAssunto("CINECLICK - Ingressos Inteiro");
						
						StringBuffer texto = enviar.montarEmail(objSessaoDTO);
						enviar.setMsg(texto.toString());
						
						enviou = enviar.enviarHotmail();
						
					}
				}
				
				Integer quantidadeMeia = Integer.parseInt(request.getParameter("qtdMeia"));
				String nomeFilmeMeia = request.getParameter("nomeFilmeMeia");
				String dataFilmeMeia = request.getParameter("dataFilme");
				String horaFilmeMeia = request.getParameter("horaFilme");
				Double precoMeia = Double.parseDouble(request.getParameter("precoMeia"));
				String tipoIngressoMeia = request.getParameter("tipoIngressoMeia");
				String tipoPagamentoMeia = request.getParameter("tipoPagamento");
				
				if(quantidadeMeia>0) {
					for(var i=1; i<=quantidadeMeia; i++) {
						
						objSessaoDTO.setNomeFilme(nomeFilmeMeia);
						objSessaoDTO.setDataFilme(dataFilmeMeia);
						objSessaoDTO.setHoraFilme(horaFilmeMeia);
						objSessaoDTO.setTipoIngresso(tipoIngressoMeia);
						objSessaoDTO.setQuantidade(i);
						objSessaoDTO.setPreco(precoMeia);
						objSessaoDTO.setTipoPagamento(tipoPagamentoMeia);
						objSessaoDTO.setIdCliente(objClienteDTO.getIdCliente());
						
						sucesso = SessaoDAO.inserirSessao(objSessaoDTO);
					}
					
					if(sucesso) {
						EnviarEmail enviar = new EnviarEmail();
						enviar.setEmailDestinatario(objClienteDTO.getEmail());
						enviar.setAssunto("CINECLICK - Ingressos Meia");
						
						StringBuffer texto = enviar.montarEmail(objSessaoDTO);
						enviar.setMsg(texto.toString());
						
						enviou = enviar.enviarHotmail();
					}
				}
				
				if(enviou) {
					response.sendRedirect("ticket-sucess.jsp");
				}else {
					response.sendRedirect("ticket-error.jsp");
				}
				
			}catch (Exception e) {
				System.out.println(e);
			}
		}
		
		
	}

}
