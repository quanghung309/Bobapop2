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
import Model.Category;
import Model.Product;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class CategoryDAO {
    Connection conn =null;
    PreparedStatement ps=null;
    ResultSet rs=null;
    
    
    public List<Category> getAllCategorys() {
        List<Category> list = new ArrayList<>();
        String sql = "select * from Category";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category(
                        rs.getString("category_id"),
                        rs.getString("name")
                       
                );
                list.add(c);
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
//    public Category getCategoryByName(String name) {
//        String sql = "select * from Category where name=?";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(sql);
//            ps.setString(1, name);
//            rs = ps.executeQuery();
//            if (rs.next()) {
//                Category c = new Category(rs.getString("category_id"),
//                        rs.getString("name")
//                       
//                );
//                return c;
//            }
//        } catch (Exception e) {
//            System.out.println(e);
//        }
//        return null;
//    }
    public Category getCategoryById(String category_id) {
        String sql = "select * from Category where category_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, category_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Category c = new Category(rs.getString("category_id"),
                        rs.getString("name")                     
                );
                return c;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
}
