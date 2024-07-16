import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertUser {
    public static void main(String[] args) {
        String jdbcURL = "jdbc:mariadb://127.0.0.1:3306/foody_buddy";
        String jdbcUsername = "scott";
        String jdbcPassword = "tiger";

        String insertUserSQL = "INSERT INTO user (grade_no, user_id, user_pw, user_name, user_phone, user_email, user_postcode, user_addr, user_detailAddr, user_extraAddr, user_question, user_answer, user_warn, reg_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 0, CURRENT_TIMESTAMP)";

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            PreparedStatement pstmt = connection.prepareStatement(insertUserSQL);
            pstmt.setInt(1, 1);  // grade_no 값이 user_grade 테이블에 존재해야 합니다
            pstmt.setString(2, "testuser2");  // 고유한 user_id 값
            pstmt.setString(3, "password");
            pstmt.setString(4, "UniUser");  // user_name 값을 10자 이하로 수정
            pstmt.setString(5, "010-1235-5678");
            pstmt.setString(6, "uniqueuser@example.com");  // 고유한 user_email 값
            pstmt.setString(7, "12345");
            pstmt.setString(8, "Test Address");
            pstmt.setString(9, "Detail Address");
            pstmt.setString(10, "Extra Address");
            pstmt.setString(11, "Test Question");
            pstmt.setString(12, "Test Answer");

            int rowAffected = pstmt.executeUpdate();
            if (rowAffected > 0) {
                System.out.println("User inserted successfully!");
            } else {
                System.out.println("Failed to insert user.");
            }

            pstmt.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
