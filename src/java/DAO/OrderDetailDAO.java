/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBConnect.DBContext;
import Model.OrderDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


/**
 *
 * @author duong
 */
public class OrderDetailDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public ArrayList<OrderDetail> getAllOrderProductByOrderId(String order_id) {
        ArrayList<OrderDetail> list = new ArrayList<>();
        String query = "select * from [Order_Detail] where order_id = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, order_id);
            rs = ps.executeQuery();
            while(rs.next()) {
                list.add(new OrderDetail(rs.getString("order_detail_id"),rs.getInt("quantity"),rs.getString("size"),rs.getFloat("price") ,rs.getInt("ice"),rs.getInt("suggar"),rs.getString("product_id"),rs.getString("order_id")));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    public void createOrderProduct(OrderDetail orderDetail) {
        String query = "insert into Order_Detail values(?,?,?,?,?,?,?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1,orderDetail.getOrderDetailId());
            ps.setInt(2,orderDetail.getQuantity());
            ps.setString(3, orderDetail.getSize());
            ps.setFloat(4,orderDetail.getPrice());           
            ps.setInt(5,orderDetail.getIce());
            ps.setInt(6,orderDetail.getSugar());
            ps.setString(7, orderDetail.getProductId());
            ps.setString(8, orderDetail.getOrderId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Failed!");
        }
    }
    public void updateQuantityProduct(OrderDetail orderDetail,int quantity) {
        String query = "UPDATE Order_Detail SET quantity=? WHERE id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1,quantity);
            ps.setString(2,orderDetail.getOrderDetailId());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("Failed!");
        }
    }
}
