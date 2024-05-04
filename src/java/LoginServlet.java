package Mypackage;

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

@WebServlet(name = "RegisterServlet", urlPatterns = {"/RegisterServlet"})
public class RegisterServlet extends HttpServlet {

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
        PrintWriter out = response.getWriter();
        out.println("Servlet is running");

        String name = request.getParameter("uname");
        String email = request.getParameter("uemail");
        String address = request.getParameter("uaddress");
        String pnumber = request.getParameter("upnumber");
        String password = request.getParameter("upassword");
        String conpassword = request.getParameter("uconpassword");

        String url = "jdbc:mysql://localhost:3306/dias_family";
        String sql = "INSERT INTO sign_in_sign_up (name, email, address, pnumber, password, conpassword) VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection con = DriverManager.getConnection(url, "root", "");
             PreparedStatement statement = con.prepareStatement(sql)) {

            statement.setString(1, name);
            statement.setString(2, email);
            statement.setString(3, address);
            statement.setString(4, pnumber);
            statement.setString(5, password);
            statement.setString(6, conpassword);

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
                out.println("Registered successfully");
            } else {
                out.println("Registration failed");
            }

        } catch (SQLException ex) {
            out.println("An error occurred during registration: " + ex.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Registration Servlet";
    }
}
