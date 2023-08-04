/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContextSQL;
import entity.Category;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KhongDuyTuan
 */
public class CategoryDAO extends DBContextSQL{
    public List<Category> getAllCategory()  {
        List<Category> list = new ArrayList<>();
        String query = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Category(rs.getInt(1),
                        rs.getString(2)));
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }
    public static void main(String[] args) {
        CategoryDAO sql = new CategoryDAO();
        List<Category> list = sql.getAllCategory();
        for (Category category : list) {
            System.out.println(category.getCid() + " " + category.getCname());
        }
                
    }
}
