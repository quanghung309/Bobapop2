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
import Model.Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
public class AccountDAO {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public Account checkAccount(String email, String password){
        String sql= "SELECT [account_id]\n" +
"      ,[full_name]\n"+
"      ,[email]\n" +
"       ,[password]\n"+ 
"       ,[phone]\n"+     
"       ,[address]\n"+
"       ,[role]\n"+                     
"  FROM [dbo].[Account]\n" +
"  where email=? and password=?";
        try {
            conn=new DBContext().getConnection();
            ps=conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs= ps.executeQuery();
            if(rs.next()){
                Account a= new Account(rs.getString("account_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getInt("role"));
                return a;
            }
        } catch (Exception e) {
        }
    return null;
    }
    public void insertAccount(Account a){
        String sql="Insert into [dbo].[Account](account_id, full_name, email,password,phone,address,role) values (?,?,?,?,?,?,?)";
        try {
            conn=new DBContext().getConnection();
            ps=conn.prepareStatement(sql);
            ps.setString(1, a.getAccount_id());
            ps.setString(2, a.getFull_name());
            ps.setString(3, a.getEmail());
            ps.setString(4, a.getPassword());
            ps.setString(5, a.getPhone());
            ps.setString(6, a.getAddress());
            ps.setInt(7, a.getRole());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    
    }
     public Account getAccountById(String account_id) {
        String sql = "select * from account where account_id=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, account_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Account a= new Account(rs.getString("account_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getInt("role"));
                return a;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
     public void updateAccount(Account a){
         String sql=" Update [Account] set full_name=? , email=? , password=? , phone= ?, address = ?,role = ? where account_id =? ";
         try {
            conn=new DBContext().getConnection();
            ps=conn.prepareStatement(sql);            
            ps.setString(1, a.getFull_name());
            ps.setString(2, a.getEmail());
            ps.setString(3, a.getPassword());
            ps.setString(4, a.getPhone());
            ps.setString(5, a.getAddress());
            ps.setInt(6, a.getRole());
            ps.setString(7, a.getAccount_id());
            ps.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
     
     }
     public Account getAccountByEmail(String email) {
        String sql = "select * from account where email=?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                Account a= new Account(rs.getString("account_id"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("password"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getInt("role"));
                return a;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
