/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import context.DBContextSQL;

/**
 *
 * @author KhongDuyTuan
 */
public class HistoryDAOSQL extends DBContextSQL{
//    public boolean executeUpdate(Connection conn, String command) throws SQLException, ClassNotFoundException {
//        Statement stmt = null;
//        try {
//            stmt = conn.createStatement();
//            stmt.executeUpdate(command); // This will throw a SQLException if it fails
//            return true;
//        } finally {
//
//            // This will run whether we throw an exception or not
//            if (stmt != null) {
//                stmt.close();
//            }
//        }
//    }
//
//    public void insert(String date, String user, String product, int quantity, double totalprice) throws ClassNotFoundException, Exception{
//        try {
//            Connection conn = new DBContext().getConnection();
//            String query = "INSERT INTO history (date, user, product, quantity, totalprice) "
//                    + "VALUES ("
//                    + "'" + date + "', "
//                    + "'" + user + "', "
//                    + "'" + product + "', "
//                    + "'" + quantity + "', "
//                    + "'" + totalprice + "')";
//            Statement statement = conn.createStatement();
//            statement.executeUpdate(query);
//        } catch (SQLException e) {
//            System.out.println("ERROR: Could not insert the record");
//            e.printStackTrace();
//            return;
//        }
//    }
//
//    public List<History> getAllAccount() throws ClassNotFoundException {
//        List<History> list = new ArrayList<>();
//        try {
//            Connection conn = new DBContext().getConnection();
//            String query = "select * from history";
//            Statement statement = conn.createStatement();
//            ResultSet rs = statement.executeQuery(query);
//            while (rs.next()) {
//                list.add(new History(
//                        rs.getString(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getInt(4),
//                        rs.getDouble(5))
//                );
//            }
//        } catch (Exception e) {
//        }
//        return list;
//    }
}
