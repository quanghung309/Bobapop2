/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import Model.Cart;
import Model.Category;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.*;

/**
 *
 * @author duong
 */
@WebServlet(name = "DeleteCartServlet", urlPatterns = {"/deleteCart"})
public class DeleteCartServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet DeleteCartServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteCartServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<Cart> carts = (List<Cart>) session.getAttribute("carts");
        String cartId = request.getParameter("cartId");
        if (carts != null) {
        // Tạo một Iterator cho danh sách carts
        Iterator<Cart> iterator = carts.iterator();

        // Duyệt qua danh sách carts
        while (iterator.hasNext()) {
            Cart cartItem = iterator.next();
            if (cartItem.getCartId().equals(cartId)) {
                iterator.remove(); // Xóa Cart khỏi danh sách
                break; // Bạn có thể bỏ break nếu muốn xóa tất cả các mục có cùng productId
                }
            }
        }
        ProductDAO pd = new ProductDAO();
        CategoryDAO cd= new CategoryDAO();
        String productId = request.getParameter("productId");
        Product p = pd.getProductById(productId);
        List<Category> listC= cd.getAllCategorys();
        float total_price = 0;
        for (Cart cart:carts) {
            total_price += cart.getPrice();
        }
        request.setAttribute("listC", listC);
        request.setAttribute("product", p);
        request.setAttribute("carts",carts);
        request.setAttribute("total_price", total_price);
        request.getRequestDispatcher("product_3.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
