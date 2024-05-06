package cartServlets;

import CartModel.cartDAO;
import database_connection.dbCon;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Dewmini
 */
@WebServlet(name = "updateCartQty", urlPatterns = {"/updateCartQty"})
public class updateCartQty extends HttpServlet {

    private static final long serialVersionUID = 1L;
    ResultSet resultSet;
    cartDAO dao = new cartDAO(dbCon.connectToDB());

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        //String action = request.getParameter("action");
        int productId = Integer.parseInt(request.getParameter("productId"));
        double quantity = Double.parseDouble(request.getParameter("quantity"));
        //String userId = request.getParameter("userId");
        int userId = Integer.parseInt(request.getParameter("userId"));
        String operation = request.getParameter("operation");
  
        // update the cart quantity
        dao.updateCartQuantity(userId, productId,quantity,operation);
        
        // Redirect back to the cart page
        response.sendRedirect("cart.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // processRequest(request, response);
        //doPost(request, response);
    }
}
