import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Registration Status</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Registration Status</h1>");
            out.println("<p>This servlet is for registration processing.</p>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html; charset=UTF-8");
        
        // Get parameters from the request
        String email = request.getParameter("email");
        String pass = request.getParameter("password");  // Make sure to use the correct parameter name as defined in your HTML
        
        // Simple validation (In real scenarios, you should validate against database records)
        String correctEmail = "user@example.com";
        String correctPassword = "1234";

        if (email.equals(correctEmail) && pass.equals(correctPassword)) {
            // Authentication successful
            HttpSession session = request.getSession();
            session.setAttribute("user", email);
            
            // Redirect to a success page
            response.sendRedirect("manepage.jsp");
        } else {
            // Authentication failed
            request.setAttribute("errorMessage", "Invalid email or password");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "Registration Servlet";
    }
}
