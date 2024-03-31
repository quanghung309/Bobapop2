/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.OrderDAO;
import DAO.OrderDetailDAO;
import DAO.ProductDAO;
import Model.Cart;
import Model.Email;
import Model.EmailUtils;
import Model.Order;
import Model.OrderDetail;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.RandomId;

/**
 *
 * @author duong
 */
@WebServlet(name = "OrderBanking", urlPatterns = {"/orderBanking"})
public class OrderBanking extends HttpServlet {

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
            out.println("<title>Servlet OrderBanking</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderBanking at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
        String bankingStatus = request.getParameter("vnp_ResponseCode");
        if (bankingStatus.equals("00")) {
            HttpSession session = request.getSession();
            List<Cart> carts = (List<Cart>) session.getAttribute("carts");
            String orderId = RandomId.generateRandomID();
            Date orderDate = new Date();
            float totalPrice = (Float) session.getAttribute("totalPrice");
            String status = "PENDING";
            String phone = (String) session.getAttribute("phone");
            String email = (String) session.getAttribute("email");
            String address = (String) session.getAttribute("address");
            String message = (String) session.getAttribute("message");
            String fullname = (String) session.getAttribute("fullname");
            String shippingMethod = "BANKING";
            ProductDAO pd = new ProductDAO();
            List<Product> listP = pd.getAllProducts();
            OrderDAO orderDAO = new OrderDAO();
            OrderDetailDAO orderDetailDAO = new OrderDetailDAO();
            Order newOrder = new Order(orderId, orderDate, totalPrice, status, address, email, fullname, phone, shippingMethod, message);
            sendMail(carts, email, fullname, address, phone, listP);
            request.setAttribute("mess", "Dat hang thanh cong!");
            try {
                orderDAO.createOrder(newOrder);
                for (Cart cart : carts) {
                    String orderDetailId = RandomId.generateRandomID();
                    OrderDetail orderDetail = new OrderDetail(orderDetailId, cart.getQuantity(), cart.getSize(), cart.getPrice(), cart.getIcePercent(), cart.getSugarPercent(), cart.getProductId(), orderId);
                    orderDetailDAO.createOrderProduct(orderDetail);
                }
                response.sendRedirect("vieworder");
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        else {
            response.sendRedirect("orderError.jsp");
        }
        
    }

    public void sendMail(List<Cart> carts, String email, String fullname, String address, String phone, List<Product> listP) {
        Email email1 = new Email();
        email1.setFrom("bobaboptea@gmail.com"); //chinh lai email quan tri tai day [chu y dung email con hoat dong]
        email1.setFromPassword("zbve hhup xvis yjes"); //mat khau email tren
        email1.setTo(email);
        email1.setSubject("Order success from BobapopReal \uD83D\uDE4F");
        StringBuilder sb = new StringBuilder();
        sb.append("Dear ").append(fullname).append("<br>");
        sb.append("Bạn đặt hàng thành công từ BobapopReal. <br> ");
        sb.append("Địa chỉ nhận hàng của bạn là: <b>").append(address).append(" </b> <br>");
        sb.append("Số điện thoại: <b>").append(phone).append(" </b> <br>");
        sb.append("Các sản phẩm đã đặt: <br>");
        for (Cart c : carts) {
            for (Product p : listP) {
                if (c.getProductId().equals(p.getProduct_id())) {
                    sb.append(p.getProduct_name()).append(" | ").append("Price:").append(p.getPrice()).append("$").append(" | ").append("Quantity:").append(c.getQuantity()).append(" | ").append("Size:").append(c.getSize()).append(" | ").append("Ice percent:").append(c.getIcePercent()).append(" | ").append("Sugar percent:").append(c.getSugarPercent()).append("<br>");
                }
            }
        }
        float total_price = 0;
        for (Cart cart : carts) {
            total_price += cart.getPrice();
        }
        sb.append("Tong Tien: ").append(String.format("%.02f", total_price)).append("$").append("<br>");
        sb.append("Cam on ban da dat hang tai Bobapop \uD83D\uDC9B\uD83D\uDC9C\uD83D\uDC9D <br>");
        sb.append("Than ai!");

        email1.setContent(sb.toString());

        try {
            EmailUtils.send(email1);
        } catch (Exception ex) {
            Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
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
