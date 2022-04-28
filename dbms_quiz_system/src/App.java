import java.sql.*;
import java.sql.Connection;

public class App {
    public static void main(String arg[])
    {
        Connection connection = null;
        try {
            // below two lines are used for connectivity.
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = (Connection) DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/quiz_system",
                "root", "aman");
 
            // quiz_system is database
            // root is name of database
            // aman is password of database
 
            Statement statement;
            statement = connection.createStatement();
            ResultSet resultSet;
            resultSet = statement.executeQuery(
                "select * from student_name");
            
            String first;
            String middle;
            String last;

            while (resultSet.next()) {
                first = resultSet.getString("FirstName");
                middle = resultSet.getString("MiddleName");
                last = resultSet.getString("LastName");
                System.out.println("First : " + first
                                    + " Middle : " + middle
                                    + " Last : " + last + "\n");
            }
            resultSet.close();
            statement.close();
            connection.close();
        }
        catch (Exception exception) {
            System.out.println(exception);
        }
    } // function ends
} // class ends