/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.AccountDAO;

import Model.Account;

import Model.Email;
import Model.EmailUtils;

import java.io.IOException;
import java.io.PrintWriter;

import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.util.net.SSLSupport;

/**
 *
 * @author haqua
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/signup"})
public class RegisterServlet extends HttpServlet {

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
            out.println("<title>Servlet RegisterServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterServlet at " + request.getContextPath() + "</h1>");
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
        HttpSession session = request.getSession();
        String mxtsession = (String) session.getAttribute("mxt");
        String mxt = request.getParameter("mxt");
        if (mxt.equals(mxtsession)) {
            AccountDAO ad = new AccountDAO();
            try {
               
                Account a = (Account) session.getAttribute("newaccount");
                ad.insertAccount(a);

                Email email1 = new Email();
                email1.setFrom("bobaboptea@gmail.com"); //chinh lai email quan tri tai day [chu y dung email con hoat dong]
                email1.setFromPassword("zbve hhup xvis yjes"); //mat khau email tren
                email1.setTo(a.getEmail());
                email1.setSubject("Register success from Bobapop! \uD83D\uDE04\uD83C\uDF8A\uD83D\uDE04\uD83C\uDF89");
                StringBuilder sb = new StringBuilder();
                sb.append("Dear ").append(a.getFull_name()).append("<br>");
                sb.append("Bạn vừa đăng kí thành công account từ BobapopReal.\uD83D\uDC4B\uD83D\uDC4B <br> ");
                sb.append("Email của bạn là: <b>").append(a.getEmail()).append(" </b> <br>");
                sb.append("Số điện thoại của bạn là: <b>").append(a.getPhone()).append(" </b> <br>");
                sb.append("Thân ái!");
                email1.setContent(sb.toString());
                try {
                    EmailUtils.send(email1);
                } catch (Exception ex) {
                    Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                request.setAttribute("success", "Register success");
//                response.sendRedirect("login");
                request.getRequestDispatcher("loginsignup.jsp").forward(request, response);
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        else {
            request.setAttribute("errorCapcha", "Sai ma xac thuc");
            request.getRequestDispatcher("inputmxt.jsp").forward(request, response);
        }

        
    }
    

    public String generateRandomId(int length) {
        String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder id = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < length; i++) {
            int randomIndex = random.nextInt(CHARACTERS.length());
            id.append(CHARACTERS.charAt(randomIndex));
        }
        return id.toString();
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
        //lay du lieu tu form
        String account_id = generateRandomId(10);
        String full_name = request.getParameter("full_name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        int role = 2;

        AccountDAO ad = new AccountDAO();
        try {
           
            Account a1 = ad.getAccountByEmail(email);
            if (a1 == null) {
                String storedVerificationCode = generateRandomId(5);
                HttpSession session = request.getSession();
                session.setAttribute("mxt", storedVerificationCode);
                Account aNew = new Account(account_id, full_name, email, password, phone, address, role);
                session.setAttribute("newaccount", aNew);
                 Email email1 = new Email();
                email1.setFrom("bobaboptea@gmail.com"); //chinh lai email quan tri tai day [chu y dung email con hoat dong]
                email1.setFromPassword("zbve hhup xvis yjes"); //mat khau email tren
                email1.setTo(email);
                email1.setSubject("Ma xac thuc");
                StringBuilder sb = new StringBuilder();
                sb.append("Dear ").append(full_name).append("<br>");
                sb.append("Bobapop vừa gửi mã xác thực đến bạn!. <br> ");
                sb.append("Mã xác thực của bạn là: <b>").append(storedVerificationCode).append(" </b> <br>");
                sb.append("Thân ái!");
                email1.setContent(sb.toString());
                try {
                    EmailUtils.send(email1);
                } catch (Exception ex) {
                    Logger.getLogger(OrderServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.sendRedirect("inputmxt.jsp");
            }
            else {
                request.setAttribute("errorEmail", "Email existed");
                request.getRequestDispatcher("loginsignup.jsp").forward(request, response);
            
            }
        } catch (Exception e) {
            System.out.println(e);
        }
    
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
