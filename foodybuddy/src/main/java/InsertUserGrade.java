import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertUserGrade {
    public static void main(String[] args) {
        String jdbcURL = "jdbc:mariadb://127.0.0.1:3306/foody_buddy";
        String jdbcUsername = "scott";
        String jdbcPassword = "tiger";

        String insertGradeSQL = "INSERT INTO user_grade (grade_no, grade_name) VALUES (?, ?)";

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            PreparedStatement pstmt = connection.prepareStatement(insertGradeSQL);
            pstmt.setInt(1, 1);
            pstmt.setString(1, "Basic");

            int rowAffected = pstmt.executeUpdate();
            if (rowAffected > 0) {
                System.out.println("Grade inserted successfully!");
            } else {
                System.out.println("Failed to insert grade.");
            }

            pstmt.close();
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    } 
}
