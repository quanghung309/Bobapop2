/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import Model.Account;
import Model.Category;
import Model.Product;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AdminServlet", urlPatterns = {"/admin"})
public class AdminServlet extends HttpServlet {

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

    // Số lượng sản phẩm hiển thị trên mỗi trang
    int recordsPerPage = 8;

    // Lấy số trang hiện tại, nếu không có thì mặc định là trang 1
     int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

    // Tạo một đối tượng ProductDAO để lấy danh sách sản phẩm dựa trên trang hiện tại và số lượng sản phẩm trên mỗi trang
    ProductDAO pd = new ProductDAO();
    List<Product> list = pd.getProductsByPage((currentPage - 1) * recordsPerPage, recordsPerPage);

    // Đếm số lượng sản phẩm
    int numOfRecords = pd.getNumberOfRecords();

    // Tính toán số lượng trang cần hiển thị
    int numOfPages = (int) Math.ceil(numOfRecords * 1.0 / recordsPerPage);

    // Đưa danh sách sản phẩm, số trang và trang hiện tại vào request attribute
    request.setAttribute("listP", list);
    request.setAttribute("numOfPages", numOfPages);
    request.setAttribute("currentPage", currentPage);
    
    CategoryDAO cd = new CategoryDAO();
    List<Category> listC= cd.getAllCategorys();
            
    request.setAttribute("listC", listC);
    request.getRequestDispatcher("home.jsp").forward(request, response);
    


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