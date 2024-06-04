/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daisfamily;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author User
 */
@MultipartConfig
@WebServlet("/")
public class ProductServlet extends HttpServlet {

    private ProductDAO productDAO;
    
    @Override
    public void init(){
        productDAO =new ProductDAO();
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
		String action = request.getServletPath();

		try {
			switch (action) {
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertProduct(request, response);
				break;
			case "/delete":
				deleteProduct(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updateProduct(request, response);
				break;
			default:
				listProduct(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	
    }
    
    
    // Action "insert" ==>
    private void insertProduct(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException
    {
       //Getting parameters from the form 
      String productName = request.getParameter("productName");
      float productPrice =Float.parseFloat(request.getParameter("productPrice"));
      Part file = request.getPart("productImage");
      int categoryID = Integer.parseInt(request.getParameter("categoryID"));
      int sellerID = Integer.parseInt(request.getParameter("sellerID"));
      double qty = Double.parseDouble(request.getParameter("quantity"));
      
      
      String imageFileName = file.getSubmittedFileName();

      String uploadPath = request.getServletContext().getRealPath("/") + "images/" + "products/" + imageFileName;

      
      FileOutputStream fos = new FileOutputStream(uploadPath);
      InputStream inputImg = file.getInputStream();
      byte [] data = new byte[inputImg.available()];
      inputImg.read(data);
      fos.write(data);
      
      // create new  Product object ==> calling method
      Product product = new Product(productName,  productPrice, imageFileName, categoryID, sellerID,qty);
      productDAO.insertProduct(product);
      response.sendRedirect("list");
    }
    
    //view all products
    	private void listProduct(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException 
        {
		List<Product> listProduct = productDAO.selectAllProducts();
		request.setAttribute("listProducts", listProduct);
		RequestDispatcher dispatcher = request.getRequestDispatcher("Admin_ProductManagement.jsp");
		dispatcher.forward(request, response);
	}
        
    //update product    
	private void updateProduct(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException, ServletException {
		int productID = Integer.parseInt(request.getParameter("productID"));
                String productName = request.getParameter("productName");
                float productPrice = Float.parseFloat(request.getParameter("productPrice"));
                
                int categoryID =Integer.parseInt(request.getParameter("categoryID"));
                int sellerID = Integer.parseInt(request.getParameter("sellerID"));
                Part file = request.getPart("productImage");
                String imageFileName = file.getSubmittedFileName();
                double qty = Double.parseDouble(request.getParameter("quantity"));
                String uploadPath = request.getServletContext().getRealPath("/")+ "images" + imageFileName;
                FileOutputStream fos = new FileOutputStream(uploadPath);
                InputStream inputImg = file.getInputStream();
                byte [] data = new byte[inputImg.available()];
                inputImg.read(data);
                fos.write(data); 
		Product product = new Product(productID,productName, productPrice, imageFileName, categoryID,  sellerID,qty);
		productDAO.updateProduct(product);                 

		response.sendRedirect("list");
	}
        
   //delete product
	private void deleteProduct(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		int productID = Integer.parseInt(request.getParameter("productID"));
		productDAO.deleteProduct(productID);
		response.sendRedirect("list");

	}

   //show edit form
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		int productID = Integer.parseInt(request.getParameter("productID"));
		Product existingProduct = productDAO.selectProduct(productID);
		RequestDispatcher dispatcher = request.getRequestDispatcher("insertProducts.jsp");
		request.setAttribute("product", existingProduct);
		dispatcher.forward(request, response);

	}
        
   //show new form     
	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException
        {
		RequestDispatcher dispatcher = request.getRequestDispatcher("insertProducts.jsp");
		dispatcher.forward(request, response);  
        }        
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
  
    }

}
  

