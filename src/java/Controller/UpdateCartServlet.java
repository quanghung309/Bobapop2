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
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import org.eclipse.jdt.internal.compiler.codegen.IntegerCache;

/**
 *
 * @author duong
 */
@WebServlet(name = "UpdateCartServlet", urlPatterns = {"/updateCart"})
public class UpdateCartServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateCartServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateCartServlet at " + request.getContextPath() + "</h1>");
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
        String cartId = request.getParameter("cartId");
        String productId = request.getParameter("productId");
        HttpSession session = request.getSession();
        List<Cart> carts = (List<Cart>) session.getAttribute("carts");
        Cart cart;
        ProductDAO pd = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();
        Product p = pd.getProductById(productId);
        List<Category> listC = cd.getAllCategorys();

        float total_price = 0;
        for (Cart c : carts) {
            total_price += c.getPrice();
        }
        for (Cart c : carts) {
            if (c.getCartId().equals(cartId)) {
                cart = c;
                Product cp = pd.getProductById(c.getProductId());
                request.setAttribute("cartProduct", cp);
                request.setAttribute("cart", cart);
                request.setAttribute("listC", listC);
                request.setAttribute("product", p);
                request.setAttribute("carts", carts);
                request.setAttribute("total_price", total_price);
                request.getRequestDispatcher("viewUpdateCart.jsp").forward(request, response);
            }
        }
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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String cartId = request.getParameter("cartId");
        List<Cart> carts = (List<Cart>) session.getAttribute("carts");
        String size = request.getParameter("sizenameU");
        String productId = request.getParameter("productId");
        String cartProductId = request.getParameter("cartProductId");
        int quantity = Integer.parseInt(request.getParameter("quantityU"));
        float price = Float.parseFloat(request.getParameter("priceProduct")) * quantity;
        int icePercent = Integer.parseInt(request.getParameter("iceU"));
        int sugarPercent = Integer.parseInt(request.getParameter("sgU"));
        
        for (Cart cartItem : carts) {
            if (!cartItem.getCartId().equals(cartId) && cartItem.getProductId().equals(productId) && cartItem.getSize().equals(size) && cartItem.getIcePercent() == icePercent && cartItem.getSugarPercent() == sugarPercent) {
                cartItem.setQuantity(cartItem.getQuantity() + quantity);
                cartItem.setPrice(cartItem.getPrice() + price);
                Iterator<Cart> iterator = carts.iterator();
                // Duyệt qua danh sách carts
                while (iterator.hasNext()) {
                    Cart ca = iterator.next();
                    if (ca.getCartId().equals(cartId)) {
                        iterator.remove(); // Xóa Cart khỏi danh sách
                        break; // Bạn có thể bỏ break nếu muốn xóa tất cả các mục có cùng productId
                    }
                }
                break;
            }
        }
        for (Cart c : carts) {
            if (c.getCartId().equals(cartId)) {
                c.setIcePercent(icePercent);
                c.setQuantity(quantity);
                c.setSize(size);
                c.setSugarPercent(sugarPercent);
                c.setPrice(price);
                break;
            }
        }
        session.setAttribute("carts", carts);
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
        request.getRequestDispatcher("product_3.jsp").forward(request, response);
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