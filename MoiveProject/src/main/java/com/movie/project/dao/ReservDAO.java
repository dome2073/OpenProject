package com.movie.project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReservDAO {
   private Connection conn;// �����ͺ��̽��� ���ٰ����ϰ� ���ִ� ��ü
   private PreparedStatement pstmt;//
   private ResultSet rs;

   public ReservDAO() {
      try {
         String dbURL = "jdbc:mysql://localhost:3306/cinema?useUnicode=true&characterEncoding=utf8";
         // 3306��Ʈ��/cinema�����ͺ��̽��� ����
         String dbID = "root"; // DB���� ID
         String dbPassword = "1234"; // DB���� PASSWORD
         Class.forName("com.mysql.jdbc.Driver"); // Driver = mysql�� �����Ҽ� �ֵ���
                                       // �Ű�ä��Ȱ���ִ� ���̺귯��
         conn = DriverManager.getConnection(dbURL, dbID, dbPassword); // dbURL��
                                                         // ID��
                                                         // PASSWORD��
                                                         // �̿��ؼ�
                                                         // �����ϰ�
         // ���ӿϷ��ϸ� conn ��ü�ȿ� ���������� ���Ե�
      } catch (Exception e) {
         e.printStackTrace();
      }

   }

   public void Receive(String seats_id, String user_id,String movieCode) {
      
      String rec = new String("insert into reservation values(?,?,?)");
      try {
         pstmt = conn.prepareStatement(rec);
         pstmt.setString(1, seats_id);
         pstmt.setString(2, user_id);
         pstmt.setString(3, movieCode);
         pstmt.executeUpdate();
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
   }

   public String Send(String user_id) {
      String sql = new String("SELECT seats_id FROM reservation WHERE user_id = ?");
      String query = new String();

      try {
         pstmt = conn.prepareStatement(sql);
         pstmt.setString(1, user_id);
         rs = pstmt.executeQuery();
         if (rs.next()) {
            query = rs.getString(1);
         }
      } catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      return query;
   }
   
//     public String getSeat(String movieCode) {
//          String get=new String("Select seats_id from reservation where code=?");
//          String seat_num="";
//          try {
//             pstmt=conn.prepareStatement(get);
//             pstmt.setString(1, movieCode);
//             rs=pstmt.executeQuery();
//             if(rs.next()) {
//                seat_num=rs.getString(3);
//             }
//          }catch (SQLException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//             }
//       return seat_num;   
//       }
   
   public String[] getSeat(String code) {
	      String get = new String("Select seats_id from cinema reservation where code=?");
	      String[] seatNum = new String[56];
	      int i = 0;
	      try {
	         pstmt = conn.prepareStatement(get);
	         pstmt.setString(1, code);
	         rs = pstmt.executeQuery();
	         
	         while (rs.next()) {
	            seatNum[i++] = rs.getString(1);
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	      return seatNum;
	   }

}