package bbs;

import javax.print.DocFlavor;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BBSDAO {

    private Connection conn;
    private ResultSet rs;

    public BBSDAO() {
        try {
            String dburl="jdbc:mysql://localhost:3307/bbs";
            String dbID="root";
            String dbpassward="kkjjss103@";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(dburl,dbID,dbpassward);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public String getDate(){
        String SQL="SELECT NOW()";
        try {
            PreparedStatement pstmt =conn.prepareStatement(SQL);
            rs=pstmt.executeQuery();
            if(rs.next()){
                return rs.getString(1);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return "";//데이터 베이스 오류
    }
    public int getNext(){
        String SQL="SELECT bbsID FROM BBS ORDER BY bbsID DESC ";
        try {
            PreparedStatement pstmt =conn.prepareStatement(SQL);
            rs=pstmt.executeQuery();
            if(rs.next()){
                return rs.getInt(1)+1;
            }
            return 1;
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;//데이터 베이스 오류
    }
    public int write(String bbsTitle,String userID,String bbsContent){
        String SQL="INSERT INTO BBS VALUES (?,?,?,?,?,?)";
        try {
            PreparedStatement pstmt =conn.prepareStatement(SQL);
            pstmt.setInt(1,getNext());
            pstmt.setString(2,bbsTitle);
            pstmt.setString(3,userID);
            pstmt.setString(4,getDate());
            pstmt.setString(5,bbsContent);
            pstmt.setInt(6,1);
            return pstmt.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;//데이터 베이스 오류
    }
}
