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
 * Servlet implementation class RecuperarEmail
 */
@WebServlet("/RecuperarEmail")
public class RecuperarEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecuperarEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
		try {
			ClienteDTO objClienteDTO = ClienteDAO.buscarUsuarioPorEmail(email);
			
			if(objClienteDTO != null) {
				EnviarEmail sendMail = new EnviarEmail();
				sendMail.setEmailDestinatario(email);
				sendMail.setAssunto("CINECLICK - Reset Password");
				sendMail.setMsg("<a>http://localhost:8080/WebSiteCinema/atualizar-senha.jsp?id="+ objClienteDTO.getIdCliente() +"</a>");
				
				sendMail.enviarHotmail();
				
				response.sendRedirect("login.jsp");
			}else {
				request.setAttribute("erro", "E-mail does not exist");
				
				RequestDispatcher rd = request.getRequestDispatcher("confirm-email.jsp");
				rd.forward(request, response);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}

}
