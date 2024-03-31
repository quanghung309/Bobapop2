package Controller;

import DAO.CategoryDAO;
import DAO.ProductDAO;
import Model.Category;
import Model.Product;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SearchServlet", urlPatterns = {"/search"})
public class SearchServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        String txtSearch = request.getParameter("txt");
        ProductDAO pd = new ProductDAO();
        CategoryDAO cd = new CategoryDAO();
        List<Product> list = pd.searchByName(txtSearch);
        List<Category> listC = cd.getAllCategorys();
        String pageParam = request.getParameter("page");

// Nếu tham số page không null và không trống, đặt thuộc tính currentPage
//        if (pageParam != null && !pageParam.isEmpty()) {
//            int currentPage = Integer.parseInt(pageParam);
//            request.setAttribute("currentPage", currentPage);
//        } else {
//            // Nếu không có tham số page, đặt currentPage mặc định là 1 hoặc giá trị khác tùy vào trường hợp của bạn
//            request.setAttribute("currentPage", 1);
//        }

        // Debugging: Print the size of the search results list
        System.out.println("Search Results Size: " + list.size());

        request.setAttribute("listP", list);
        request.setAttribute("listC", listC);

        // Forwarding to category.jsp
        request.getRequestDispatcher("category.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
