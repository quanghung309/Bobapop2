/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.OrderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "DoanhThuTheoNgay", urlPatterns = {"/doanhThuTheoNgay"})
public class DoanhThuTheoNgay extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
      
        OrderDAO orderDao = new OrderDAO();
        double totalMoneyDayCn = orderDao.totalMoneyDay(1);
        double totalMoneyDay2 = orderDao.totalMoneyDay(2);
        double totalMoneyDay3 = orderDao.totalMoneyDay(3);
        double totalMoneyDay4 = orderDao.totalMoneyDay(4);
        double totalMoneyDay5 = orderDao.totalMoneyDay(5);
        double totalMoneyDay6 = orderDao.totalMoneyDay(6);
        double totalMoneyDay7 = orderDao.totalMoneyDay(7);
        
        
        
        request.setAttribute("totalMoneyDayCn", totalMoneyDayCn);
        request.setAttribute("totalMoneyDay2", totalMoneyDay2);
        request.setAttribute("totalMoneyDay3", totalMoneyDay3);
        request.setAttribute("totalMoneyDay4", totalMoneyDay4);
        request.setAttribute("totalMoneyDay5", totalMoneyDay5);
        request.setAttribute("totalMoneyDay6", totalMoneyDay6);
        request.setAttribute("totalMoneyDay7", totalMoneyDay7);
        
       
    
        request.getRequestDispatcher("doanhThuTheoNgay.jsp").forward(request, response);
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