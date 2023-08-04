/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContextSQL;
import entity.OrderDetail;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KhongDuyTuan
 */
public class OrderDetailDAO extends DBContextSQL{
    
    public void addOrderDetail(OrderDetail orderDetail) {
        String query = "insert into `shoeweb`.`orderdetail` (orderID,productID, quantity, price )\n"
                + "values (?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setInt(1, orderDetail.getOrderID());
            st.setInt(2, orderDetail.getProductID());
            st.setInt(3, orderDetail.getQuantity());
            st.setDouble(4, orderDetail.getPrice());
//            rs = ps.executeQuery(); Khi chay cau lech tren khong co result tra ve, chi Update
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

//get all orderdetail
    public List<OrderDetail> getAllOrderDetail() {
        List<OrderDetail> list = new ArrayList<>();
        
        String query = "SELECT * FROM orderdetail";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getDouble(5)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        
        return list;
    }
    
    public static void main(String[] args) {
        OrderDetailDAO sql = new OrderDetailDAO();
        List<OrderDetail> list = sql.getAllOrderDetail();
        for (OrderDetail orderDetail : list) {
            System.out.println(orderDetail.getPrice());
        }
    }
}
