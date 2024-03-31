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
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author duong
 */
@WebServlet(name = "CartServlet", urlPatterns = {"/addCart/*"})
public class CartServlet extends HttpServlet {

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
            out.println("<title>Servlet CartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CartServlet at " + request.getContextPath() + "</h1>");
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
        String productName = request.getParameter("productName");
        String size = request.getParameter("sizename");
        String productId = request.getParameter("productId");
        String productImg = request.getParameter("productImg");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        float price = Float.parseFloat(request.getParameter("price"))*quantity;
        int icePercent = Integer.parseInt(request.getParameter("ice"));
        int sugarPercent = Integer.parseInt(request.getParameter("sg"));

        if (carts == null) {
            carts = new ArrayList<>();
            session.setAttribute("carts", carts);
        }
        boolean found = false;
        for (Cart cartItem : carts) {
            if (cartItem.getProductId().equals(productId) && cartItem.getSize().equals(size) && cartItem.getIcePercent() == icePercent && cartItem.getSugarPercent() == sugarPercent) {
                cartItem.setQuantity(cartItem.getQuantity() + quantity);
                cartItem.setPrice(cartItem.getPrice() + price);
                found = true;
                break;
            }
        }
        if (!found) {
            Cart newItem = new Cart(productId, productImg, productName, size, quantity, price, icePercent, sugarPercent);
            carts.add(newItem);
        }
        ProductDAO pd = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();
        Product p = pd.getProductById(productId);
        List<Category> listC = cd.getAllCategorys();
        float total_price = 0;
        for (Cart cart : carts) {
            total_price += cart.getPrice();
        }
        request.setAttribute("listC", listC);
        request.setAttribute("product", p);
        request.setAttribute("carts", carts);
        request.setAttribute("total_price", total_price);
        request.getRequestDispatcher("product_2.jsp").forward(request, response);
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
