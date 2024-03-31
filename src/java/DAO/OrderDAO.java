/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBContext;
import Model.Order;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author duong
 */
public class OrderDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();
        String query = "select * from [Order] ORDER BY order_date DESC;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getString("order_id"),
                        rs.getTimestamp("order_date"),
                        rs.getFloat("total_price"),
                        rs.getString("status"),
                        rs.getString("email"),
                        rs.getString("full_name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("shipment"),
                        rs.getString("message")
                ));
            }
        } catch (Exception e) {
            System.out.println("Failed");
        }
        return list;
    }
    public void createOrder(Order order) {
        String query = "insert into [Order] values(?,?,?,?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,order.getOrderId());
            ps.setTimestamp(2,order.getOrderDate());
            ps.setFloat(3,order.getTotalPrice());
            ps.setString(4,order.getStatus());
            ps.setString(5,order.getEmail());
            ps.setString(6,order.getFullName());
            ps.setString(7,order.getPhone());
            ps.setString(8,order.getAddress());
            ps.setString(9,order.getShipment());
            ps.setString(10,order.getMessage());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void updateOrderStatus(String order_id, String status) {
        String query = "UPDATE [Order] SET status = ? WHERE order_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            ps.setString(2, order_id);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public void deleteOrderById(String order_id) {
        String query = "DELETE FROM Order where order_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,order_id);
            ps.executeQuery();
        } catch (Exception e) {
            System.out.println("Failed!");
        }
    }
    public List<Order> getOrderByUser(String email){
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM [Order] WHERE email = ? ORDER BY order_date DESC ;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while(rs.next()){
                list.add(new Order(rs.getString("order_id"),
                                             rs.getTimestamp("order_date"),
                                             rs.getFloat("total_price"),
                                             rs.getString("status"),
                                             rs.getString("email"),
                                             rs.getString("full_name"),
                                             rs.getString("phone"),
                                             rs.getString("address"),
                                             rs.getString("shipment"),
                                             rs.getString("message")
                ));
            
            }
        } catch (Exception e) {
        }
        
    return list;
    }
    public float calculateTotalPrice() {
    float totalPrice = 0;
    String query = "SELECT total_price FROM [Order] WHERE status = 'DONE'";
    try {
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        rs = ps.executeQuery();
        while (rs.next()) {
            totalPrice += rs.getFloat("total_price");
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return totalPrice;
}

    public double totalMoneyMonth(int month) {
        String query = "select SUM(total_price) from [dbo].[Order] where MONTH(order_date) = ? group by MONTH(order_date)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, month);
            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getDouble(1);
            }
        } catch (Exception e) {
        }
        return 0;
    }

        public double totalMoneyDay(int day) {
        String query = "select SUM(total_price) from [dbo].[Order] where DATEPART(dw,[order_date]) = ? group by DAY(order_date)";
        try {
            conn = new DBContext().getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, day);
            rs = ps.executeQuery();
            while (rs.next()) {
               return rs.getDouble(1);
            }
        } catch (Exception e) {

        }
        return 0;
    }
        public List<Order> getAllOrderByStatus(String status) {
        List<Order> list = new ArrayList<>();
        String query = "select * from [Order] where status = ? ORDER BY order_date DESC;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, status);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getString("order_id"),
                        rs.getTimestamp("order_date"),
                        rs.getFloat("total_price"),
                        rs.getString("status"),
                        rs.getString("email"),
                        rs.getString("full_name"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("shipment"),
                        rs.getString("message")
                ));
            }
        } catch (Exception e) {
            System.out.println("Failed");
        }
        return list;
    }

}

