/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContextSQL;
import entity.Account;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author KhongDuyTuan
 */
public class AccountDAO extends DBContextSQL {

    public boolean checkLogin2(String username, String password) {
        boolean isValid = false;
        String sql = "SELECT * FROM dbo.account WHERE user = ? AND pass = ?";
        try ( PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);
            try ( ResultSet resultSet = statement.executeQuery()) {
                isValid = resultSet.next(); // Nếu có dòng kết quả thì thông tin đăng nhập hợp lệ
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return isValid;
    }

    public Account checkLogin(String user, String pass) {
        String query = "select * from account where user =? and pass =?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, user);
            st.setString(2, pass);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Account> getAllAccount() {
        List<Account> list = new ArrayList<>();
        String query = "select * from account";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8))
                );
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return list;
    }

    public Account checkAccountExist(String user) {
        String query = "select * from account\n"
                + "where user = ?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public Account getAccountById(String id) {
        String query = "SELECT * FROM account where uID=?";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();

            while (rs.next()) {
                return new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
            }

        } catch (SQLException e) {

        }
        return null;
    }

    // Sign Up: Them Account moi vao Database
    public void signUp(Account account) {
        String query = "insert into account (user, pass, isSell, isAdmin, name, address, phone)\n"
                + "values (?, ?, 0, 0, ?, ?, ?)"; //0,0 : not Seller, not Admin => Normal User
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, account.getUser());
            st.setString(2, account.getPass());
            st.setString(3, account.getName());
            st.setString(4, account.getAddress());
            st.setString(5, account.getPhone());

//            rs = ps.executeQuery(); Khi chay cau lech tren khong co result tra ve, chi Update
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Account account) {
        String query = "update account set pass = ?, name = ?, address = ?, phone = ? where user = ?;";
//        String query = "update account set pass = ?, name = ?, address = ?, phone = ? where id = ?;";
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, account.getPass());
            st.setString(2, account.getName());
            st.setString(3, account.getAddress());
            st.setString(4, account.getPhone());
            st.setString(5, account.getUser());
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(int id) {
        String query = "delete from account where uid = '" + id + "'";
        try {
            PreparedStatement st = connection.prepareStatement(query);
//            rs = ps.executeQuery(); Khi chay cau lech tren khong co result tra ve, chi Update
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Account getAccountbyId(String id) throws ClassNotFoundException {
        //san pham moi nhat: co ID cao nhat
        String query = "select * from account\n"
                + "where uID = ?";
        Account account = new Account();
        try {
            PreparedStatement st = connection.prepareStatement(query);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                account = new Account(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getInt(5),
                        rs.getString(6),
                        rs.getString(7),
                        rs.getString(8)
                );
            }
            return account;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public static void main(String[] args) {
        AccountDAO acc = new AccountDAO();
        String user = "hoangduong";
        String pass = "123456";
        
//        System.out.println(acc.checkLogin2(user, pass));
        Account a = acc.checkAccountExist(user);
        if(a!= null){
            System.out.println(a.getName());

        }

//        Account a = acc.checkLogin(user, pass);
//        if (a == null) {
//            System.out.println("ïsEmpty");
//        } else {
//            System.out.println(a.getName());
//
//        }

    }
}
