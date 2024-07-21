import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class dd {

    public static void main(String[] args) {
        String jdbcURL = "jdbc:mariadb://127.0.0.1:3306/foody_buddy";
        String jdbcUsername = "root";
        String jdbcPassword = "tiger";

        try {
            Class.forName("org.mariadb.jdbc.Driver");
            Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
            System.out.println("Database connected!");
            connection.close();
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }
}
	