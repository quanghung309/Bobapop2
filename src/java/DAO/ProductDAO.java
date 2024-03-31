/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

/**
 *
 * @author haqua
 */

import DBConnect.DBContext;
import Model.Product;
import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class ProductDAO {
    Connection conn =null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    public void addProduct(Product p) {
        String sql = "INSERT INTO [Product](product_id, product_name, product_picture, price,category_id) VALUES (?, ?, ?, ?, ?)";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, p.getProduct_id());
            ps.setString(2, p.getProduct_name());
            ps.setString(3, p.getProduct_picture());
            ps.setFloat(4, p.getPrice());
            ps.setString(5, p.getCategory_id());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public Product getProductById(String product_id) {
        String sql = "select * from [Product] where product_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Product p = new Product(rs.getString("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_picture"),
                        rs.getFloat("price"),
                        rs.getString("category_id")
                );
                return p;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public void deleteProduct(String product_id) {
        String sql = "DELETE FROM [dbo].[Product] WHERE product_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, product_id);
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    
    public void updateProduct(Product p) {
        String sql = "UPDATE [Product] SET product_name=?, product_picture=?, price=?, category_id=? WHERE product_id=?";
        try {
            conn=new DBContext().getConnection();
            ps=conn.prepareStatement(sql);          
            ps.setString(1, p.getProduct_name());
            ps.setString(2, p.getProduct_picture());
            ps.setFloat(3, p.getPrice());
            ps.setString(4, p.getCategory_id());
            ps.setString(5, p.getProduct_id());
            ps.executeUpdate();
            
        } catch (Exception e) {
            System.out.println(e);
        }
    }
    public List<Product> getProductByCid(String category_id){
        List<Product> list = new ArrayList<>();
        String sql = "Select * from Product where category_id=?";

        try {
            conn=new DBContext().getConnection();
            ps=conn.prepareStatement(sql);
            ps.setNString(1, category_id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_picture"),
                        rs.getFloat("price"),
                        rs.getString("category_id")
                );
                list.add(p);
            }
            
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Product> getAllProducts() {
        List<Product> list = new ArrayList<>();
        String sql = "select * from product";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_picture"),
                        rs.getFloat("price"),
                        rs.getString("category_id")
                );
                list.add(p);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
    
    public List<Product> searchByName(String txtSearch) {
        List<Product> list = new ArrayList<>();
        String sql = "select * from Product where upper(product_name) like upper(?) escape '_'";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + txtSearch + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_picture"),
                        rs.getFloat("price"),
                        rs.getString("category_id")
                );
                list.add(p);
            }

        } catch (Exception e) {
        }
        return list;
    }
    
    public ArrayList<Product> getProductsByPage(int start, int recordsPerPage) {
        ArrayList<Product> products = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            PreparedStatement preparedStatement;
            if (start == 0) { // Trang đầu tiên
                preparedStatement = conn.prepareStatement("SELECT TOP 7 * FROM Product ORDER BY product_id");
            } else {
                preparedStatement = conn.prepareStatement("SELECT * FROM Product ORDER BY product_id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
                preparedStatement.setInt(1, start);
                preparedStatement.setInt(2, recordsPerPage);
            }
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Product p = new Product(rs.getString("product_id"),
                        rs.getString("product_name"),
                        rs.getString("product_picture"),
                        rs.getFloat("price"),
                        rs.getString("category_id")
                );
                products.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return products;
    }

    public int getNumberOfRecords() {
        String sql = "SELECT COUNT(*) AS count FROM [Product]";
        int numOfRecords = 0;
        try {
            conn = DBContext.getConnection();
            ps = conn.prepareStatement(sql);
            rs= ps.executeQuery();
            if (rs.next()) {
                numOfRecords = rs.getInt("count");
            }
//            connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return numOfRecords;
    }

    public static void main(String[] args) {
        // Tạo một đối tượng ProductDAO
        ProductDAO productDAO = new ProductDAO();

        // Thử nghiệm phương thức getProductByCName
        String category_id = "C1"; // Thay thế bằng tên category bạn muốn thử nghiệm
        List<Product> productList = productDAO.getProductByCid(category_id);

        // In ra thông tin sản phẩm từ danh sách sản phẩm
        if (productList != null && !productList.isEmpty()) {
            System.out.println("Danh sách sản phẩm:");
            for (Product product : productList) {
                System.out.println("Tên: " + product.getProduct_name());
                System.out.println();
            }
        } else {
            System.out.println("Không có sản phẩm nào thuộc danh mục " + category_id);
        }
    }

    
}

