/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DBConnect;
import java.sql.Connection;
import java.sql.DriverManager;
 
public class DBContext {
    static String DB_URL = "jdbc:sqlserver://localhost:1433;"
            + "databaseName=bobapop5;"
            + "encrypt=false";
    static String USER_NAME = "sa";
    static String PASSWORD = "123anh121";

    public static Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(DB_URL, USER_NAME, PASSWORD);
            System.out.println("connect successfully!");
        } catch (Exception ex) {
            System.out.println("connect failure!");
            ex.printStackTrace();
        }
        return conn;
    }

}
