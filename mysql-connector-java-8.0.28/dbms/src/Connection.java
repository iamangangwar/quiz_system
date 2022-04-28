

import java.sql.*;
//import java.sql.DriverManager;

public class Connection {
	static Connection con;
	    public static Connection create_con(){
	        try{
	        	Class.forName("com.mysql.cj.jdbc.Driver");
	            con = (Connection) DriverManager.getConnection(
	                "jdbc:mysql://localhost:3306/quiz_system",
	                "root", "aman");
	        }
	        catch (Exception e){
	            e.printStackTrace();
	        }
	        return con;
	    }
}
