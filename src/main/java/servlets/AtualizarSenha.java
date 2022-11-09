package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.ClienteDAO;

/**
 * Servlet implementation class AtualizarSenha
 */
@WebServlet("/AtualizarSenha")
public class AtualizarSenha extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AtualizarSenha() {
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
		try {
			int idCliente = Integer.parseInt(request.getParameter("id"));
			String password = request.getParameter("password");
			String confirmPassword = request.getParameter("confirmPassword");
			
			if(password == confirmPassword) {
				boolean sucesso = ClienteDAO.atualizarSenha(password, idCliente);
				
				if(sucesso) {
					response.sendRedirect("LoginServlet");
				}else {
					request.setAttribute("erro", "error update password");
					
					RequestDispatcher rd = request.getRequestDispatcher("atualizar-senha.jsp");
					rd.forward(request, response);
				}
			}else {
				request.setAttribute("erro", "Please enter the password and confirm the same password");
				
				RequestDispatcher rd = request.getRequestDispatcher("atualizar-senha.jsp");
				rd.forward(request, response);
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
