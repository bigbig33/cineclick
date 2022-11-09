package servlets;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ClienteDAO;
import DTO.ClienteDTO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginServlet() {
        super();
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		ClienteDTO objClienteDTO = (ClienteDTO) session.getAttribute("usuarioLogado");
		
		if(objClienteDTO != null) {
			response.sendRedirect("index.jsp");
		} else {
			response.sendRedirect("login.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String senha = request.getParameter("password");
		
		try {
			ClienteDTO objClienteDTO = ClienteDAO.buscarUsuarioPorEmail(email);
			
			boolean loginSucesso = false;
			
			if(objClienteDTO != null && objClienteDTO.getSenha().equals(senha)) {
				if(objClienteDTO.getConfirmaEmail() == true) {
					loginSucesso = true;
				}
			}
			
			if(loginSucesso) {
				
				HttpSession session = request.getSession();
				session.setAttribute("usuarioLogado", objClienteDTO);
				
				RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
				rd.forward(request, response);
			}else {
				request.setAttribute("erro", "Incorrect email/password");
				
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

}
