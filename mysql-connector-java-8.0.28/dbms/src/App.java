import java.sql.*;
import java.sql.Connection;
import java.lang.String;
import java.net.http.HttpResponse.ResponseInfo;

public class App {
	public static void main(String arg[])
	{
		Connection connection = null;
		try {
			// below two lines are used for connectivity.
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/quiz_system",
				"root", "aman");

			// quiz_system is database
			// mydbuser is name of database
			// mydbuser is password of database

			Statement statement;
			statement = connection.createStatement();
			ResultSet resultSet;
			resultSet = statement.executeQuery(
				"select * from student_name");

            String first = null;
            String middle = null;
            String last = null;
            String id;

			while (resultSet.next()) {
				first = resultSet.getString("FirstName");
                middle = resultSet.getString("MiddleName");
                last = resultSet.getString("LastName");
                id = resultSet.getString("StudentID");

				System.out.println("First : " + first
								+ " Middle : " + middle
                                + " Last : " + last 
                                + " ID : " + id + "\n");
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
