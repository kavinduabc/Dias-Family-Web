package cartServlets;

import CartModel.cartDAO;
import database_connection.dbCon;
import java.io.IOException;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
        int productId = Integer.parseInt(request.getParameter("productId"));
        double quantity = Double.parseDouble(request.getParameter("quantity"));
        int userId = Integer.parseInt(request.getParameter("userId"));
        String operation = request.getParameter("operation");
  
        // update the cart quantity
        dao.updateCartQuantity(userId, productId,quantity,operation);
        
        // Redirect back to the cart page
        response.sendRedirect("Cart_Deliver.jsp");
    }
}
