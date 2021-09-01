package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogOutUser")
public class LogOutUser extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		session.setAttribute("username", "");
		session.setAttribute("password", "");
		session.setAttribute("email", "");
		session.setAttribute("order", null);
		session.setMaxInactiveInterval(0);
				
		response.sendRedirect(request.getContextPath() + "/TrangChu");
	}

}
