package USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class userDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    public userDAO() {
        try {
            String dburl="jdbc:/mysql://localhost:3307/BBS";
            String dbID="root";
            String dbpassward="kkjjss103@";
            Class.forName("com.mysql.jdbc.Driver");
            conn= DriverManager.getConnection(dburl,dbID,dbpassward);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public int login(String userID,String userPassward) {
        String SQL = "SELECT userpasswood FROM USER WHERE userID=?";
        try {
            pstmt=conn.prepareStatement(SQL);
            pstmt.setString(1,userID);
            rs=pstmt.executeQuery();
            if (rs.next()){
                if(rs.getString(1).equals(userPassward)){
                    return 1;//로그인 성공
                }
                else
                    return 0;//비밀번호 불일치
            }
            return -1;//아이디가 없을 경우 반환
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2; //데이터 베이스 오류
    }
}
