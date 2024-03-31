/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CategoryDAO;
import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import Model.Account;
import Model.Cart;
import Model.Category;
import Model.Order;
import Model.OrderDetail;
import Model.Product;
import Model.UserGoogleDto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author haqua
 */
@WebServlet(name = "ViewOrderServlet", urlPatterns = {"/vieworder"})
public class ViewOrderServlet extends HttpServlet {

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
        OrderDAO od = new OrderDAO();
        OrderDetailDAO odd = new OrderDetailDAO(); 
        ProductDAO pd = new ProductDAO();
        List<Product> listP = new ArrayList<>();
        HttpSession session = request.getSession();        
        Account a = (Account) session.getAttribute("account");   
        List<Order> listO = new ArrayList<>();
        List<OrderDetail> orderd = new ArrayList<>();
        if(a != null) {
            listO = od.getOrderByUser(a.getEmail());
        } else {
            UserGoogleDto ag = (UserGoogleDto) session.getAttribute("google");
            
            listO = od.getOrderByUser(ag.getEmail());
        }
        
        CategoryDAO cd = new CategoryDAO();
        List<Category> listC = cd.getAllCategorys();
//        if(a == null) {
//            String email = request.getParameter("email");
//            listO = od.getOrderByUser(email);
//        } else {
//            listO = od.getOrderByUser(a.getEmail());
//        }
        for(Order order : listO){
            orderd.addAll(odd.getAllOrderProductByOrderId(order.getOrderId()));
            System.out.println("Order:"+order.getOrderId());
        }
        for(OrderDetail orderDetail : orderd){
            Product p = pd.getProductById(orderDetail.getProductId());
            p.setProduct_id(orderDetail.getOrderDetailId()+p.getProduct_id());
            listP.add(p);
            System.out.println("OrderD:"+orderDetail.getOrderId());
        }
        request.setAttribute("listP", listP);
        request.setAttribute("listO", listO);
        request.setAttribute("listOdd", orderd);
        request.setAttribute("listC", listC);
        session.removeAttribute("carts");
        request.getRequestDispatcher("vieworder.jsp").forward(request, response);
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
        processRequest(request, response);
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