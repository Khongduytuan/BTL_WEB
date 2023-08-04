/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContextSQL;
import entity.Order;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KhongDuyTuan
 */
public class OrderDAO extends DBContextSQL{
    

    // Luu Order moi vao Database
    public void addOrder(Order order) {
        String query = "insert into shoewebbtl.dbo.[order] (accountID, orderDate)\n"
                + "values (?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, order.getAccountID());
            st.setString(2, order.getOrderDate());

//            rs = ps.executeQuery(); Khi chay cau lech tren khong co result tra ve, chi Update
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    //Lay ra Order theo Date
    public Order getOrderbyDate(String orderDate) {
        String query = "select * from shoewebbtl.dbo.[order]\n"
                + "where orderDate = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, orderDate);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return null;
    }

//get all order
    public List<Order> getAllOrder() {
        List<Order> list = new ArrayList<>();

        String query = "select * from shoewebbtl.dbo.[order]\n";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(
                        rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return list;
    }
    public static void main(String[] args) {
        OrderDAO sql = new OrderDAO();
        List<Order> list = sql.getAllOrder();
        for (Order order : list) {
            System.out.println(order.getId() + " "  + order.getOrderDate());
        }
    }
}
