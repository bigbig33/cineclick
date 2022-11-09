package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ClienteDAO;
import DTO.ClienteDTO;
import email.EnviarEmail;

/**
 * Servlet implementation class CadastrarUsuarioServlet
 */
@WebServlet("/CadastrarUsuarioServlet")
public class CadastrarUsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CadastrarUsuarioServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			String nome = request.getParameter("firstName");
			String sobrenome = request.getParameter("lastName");
			String email = request.getParameter("email");
			String senha = request.getParameter("password");
			String cpf = request.getParameter("cpf");
			String telefone = request.getParameter("phone");
			
			ClienteDTO verificaEmail = ClienteDAO.buscarUsuarioPorEmail(email);
			ClienteDTO verificaCpf = ClienteDAO.buscarUsuarioPorCpf(cpf);
			
			if(verificaEmail == null && verificaCpf == null) {
				ClienteDTO objClienteDTO = new ClienteDTO();
				objClienteDTO.setNome(nome);
				objClienteDTO.setSobrenome(sobrenome);
				objClienteDTO.setEmail(email);
				objClienteDTO.setSenha(senha);
				objClienteDTO.setCpf(cpf);
				objClienteDTO.setTelefone(telefone);
				
				boolean inserido = ClienteDAO.CadastrarCliente(objClienteDTO);
				
				if(inserido) {
					
					EnviarEmail sendMail = new EnviarEmail();
					sendMail.setEmailDestinatario(objClienteDTO.getEmail());
					sendMail.setAssunto("CINECLICK - Confirm E-mail");
					sendMail.setMsg("<a>http://localhost:8080/WebSiteCinema/ConfirmarEmail</a>");
					
					sendMail.enviarHotmail();
					
					response.sendRedirect("login.jsp");
				}else {
					RequestDispatcher rd = request.getRequestDispatcher("register-error.html");
					rd.forward(request, response);
				}
			}else {
				request.setAttribute("erro", "Email/CPF already exists");
					
				RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
				rd.forward(request, response);
			}
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
