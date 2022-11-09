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

/**
 * Servlet implementation class ConfirmarEmail
 */
@WebServlet("/ConfirmarEmail")
public class ConfirmarEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConfirmarEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("confirm-email.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		
		try {
			ClienteDTO objClienteDTO = ClienteDAO.buscarUsuarioPorEmail(email);
			
			boolean emailExiste = false;
			
			if(objClienteDTO != null) {
				emailExiste = true;
			}
			
			if(emailExiste) {
				boolean sucesso = ClienteDAO.confirmaEmail(objClienteDTO.getIdCliente());
				
				if(sucesso) {
					response.sendRedirect("LoginServlet");
				}else {
					request.setAttribute("erro", "error confirm e-mail");
					
					RequestDispatcher rd = request.getRequestDispatcher("confirm-email.jsp");
					rd.forward(request, response);
				}
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
