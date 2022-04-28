import java.sql.*;
import java.sql.Connection;
import java.util.Scanner;

public class App {
    public static void main(String arg[]) {
        Connection connection = null;
        try {
            // below two lines are used for connectivity.
            
            Class.forName("com.mysql.cj.jdbc.Driver");
                        connection = (Connection) DriverManager.getConnection(
                            "jdbc:mysql://localhost:3306/quiz_system",
                            "root", "");

            
            while(true) {
                System.out.print("\033[H\033[2J");
                System.out.flush();

                System.out.println("Are you a teacher or a student?");
                System.out.println("Enter T for Teacher and S for Student - ");
                Scanner scan = new Scanner(System.in);
                String type = scan.nextLine();

                if (type.equals("T")) {
                    System.out.print("\033[H\033[2J");  
                    System.out.flush();
                    System.out.println("\nEnter your TeacherID - ");
                    String teacherid = scan.nextLine();

                    System.out.print("\033[H\033[2J");
                    System.out.flush();
                    System.out.println("Please select from the following options - \n1. View Quiz\n2. Create Quiz\n3. Update Question ");

                    int opt = scan.nextInt();

                    if (opt == 1) {
                        System.out.print("\033[H\033[2J");
                        System.out.flush();
                        System.out.println("Please enter the ID of quiz that you want to view - ");

                        String quizID = null;
                        quizID = scan.next();

            
                        // quiz_system is database
                        // root is name of database
                        // aman is password of database
                        Statement statement;
                        statement = connection.createStatement();

                        ResultSet resultSet;
                        resultSet = statement.executeQuery(
                            "select * from question where QuesID in (select QuesID from contains where QuizID = '" + quizID + "');"
                        );

                        System.out.print("\033[H\033[2J");
                        System.out.flush();

                        String quesid;
                        int maxScore;
                        String correct;
                        String createdate;
                        int diff;
                        String ques_statement;

                        int i = 0;
                        while (resultSet.next()) {
                            quesid = resultSet.getString("QuesID");
                            maxScore = resultSet.getInt("MaxScore");
                            correct = resultSet.getString("Correct");
                            createdate = resultSet.getString("CreateDate");
                            diff = resultSet.getInt("Difficulty");
                            ques_statement = resultSet.getString("question_statement");

                            System.out.println("Question ID : " + quesid 
                                                + "\nQuestion " + i + " : " + ques_statement
                                                + "\nCorrect Option : " + correct
                                                + "\nCreate Date : " + createdate
                                                + "\nMax Score : " + maxScore 
                                                + "\nDifficulty : " + diff + "\n\n"
                                            );

                            i++;
                        }
                        resultSet.close();
                        statement.close();
                    }

                    else if (opt == 2) {
                        System.out.print("\033[H\033[2J");
                        System.out.flush();
                        

                        Statement statement;
                        statement = connection.createStatement();

                        ResultSet resultSet1;
                        resultSet1 = statement.executeQuery(
                            "select max(QuizID) as QuizID from quiz;"
                        );
                        
                        resultSet1.next();
                        String quizid = resultSet1.getString("QuizID");
                        System.out.println("Last QuizID was -  ");
                        System.out.print(quizid + "\n");
                        

                        System.out.println("Please increment the quizID by 1 while creating a quiz!!\n");
                        System.out.println("Please enter new QuizID - ");

                        quizid = scan.next();

                        System.out.print("\033[H\033[2J");
                        System.out.flush();

                        System.out.println("Please select the questions to add - ");
                        
                        ResultSet resultSet2;
                        resultSet2 = statement.executeQuery("select * from question");

                        String quesid;
                        int maxScore;
                        int diff;
                        String ques_statement;

                        int i = 0;
                        String[] ques = new String[1000];
                        while(resultSet2.next()) {
                            quesid = resultSet2.getString("QuesID");
                            maxScore = resultSet2.getInt("MaxScore");
                            diff = resultSet2.getInt("Difficulty");
                            ques_statement = resultSet2.getString("question_statement");
                            ques[i] = quesid;

                            System.out.println("Question ID : " + quesid 
                                                + "\nQuestion " + i + " : " + ques_statement
                                                + "\nMax Score : " + maxScore 
                                                + "\nDifficulty : " + diff + "\n\n"
                                            );

                            i++;
                        }

                        System.out.println("Enter the number of questions you want to add in the quiz - ");
                        int nques = scan.nextInt();
                        System.out.println("Enter the Question numbers - ");
                        int[] qs = new int[nques];
                        for (int j = 0; j < nques; j++) {
                            qs[j] = scan.nextInt();
                        }

                        String query = "insert into contains (QuizID, QuesID) values ";

                        for (int j = 0; j < nques; j++) {
                            if (j == nques - 1) {
                                query += "('" + quizid + "', '" + ques[qs[j]] + "');";
                                break;
                            }
                            query += "('" + quizid + "', '" + ques[qs[j]] + "'), ";
                        }

                        System.out.println("Enter the start date and time of quiz - ");
                        System.out.println("Year - ");
                        String startyear = scan.next();
                        System.out.println("Month - ");
                        String startmonth = scan.next();
                        System.out.println("Date - ");
                        String startdate = scan.next();
                        System.out.println("Hours - ");
                        String starthour = scan.next();
                        System.out.println("Minutes - ");
                        String startminute = scan.next();
                        System.out.println("Seconds - ");
                        String startsecond = scan.next();

                        System.out.println("\nEnter the end date and time of quiz - ");
                        System.out.println("Year - ");
                        String endyear = scan.next();
                        System.out.println("Month - ");
                        String endmonth = scan.next();
                        System.out.println("Date - ");
                        String enddate = scan.next();
                        System.out.println("Hours - ");
                        String endhour = scan.next();
                        System.out.println("Minutes - ");
                        String endminute = scan.next();
                        System.out.println("Seconds - ");
                        String endsecond = scan.next();

                        System.out.println("Enter Max Score of Quiz - ");
                        int max = scan.nextInt();
                        
                        String query1 = "insert into quiz values (" + "'" + quizid + "','" + 
                                        startyear + "-" + startmonth + "-" + startdate +
                                        " " + starthour + ":" + startminute + ":" + startsecond +
                                        "'," + "'" + endyear + "-" + endmonth + "-" + enddate +
                                        " " + endhour + ":" + endminute + ":" + endsecond + "','" +
                                        max + "','Academic');";

                        statement.execute(query1);
                        System.out.println(query);
                        statement.execute(query);

                    }
                
                    else if (opt == 3) {
                        System.out.print("\033[H\033[2J");  
                        System.out.flush();

                        System.out.println("Enter QuesID - ");
                        String quesid = scan.next();

                        Statement statement;
                        statement = connection.createStatement();
                        
                        System.out.println("Select one of the following options - \n" + 
                                           "1. Update Question Statement\n2. Update Correct Answer\n3. Delete Question");
                        
                        int qopt = scan.nextInt();

                        if (qopt == 1) {
                            System.out.print("\033[H\033[2J");  
                            System.out.flush();

                            System.out.println("Enter new Question Statement - ");
                            Scanner scan1 = new Scanner(System.in);
                            String qs = scan1.nextLine();
                            scan1.close();

                            statement.execute("update question set question_statement = '" + qs + "' where QuesID = '" + quesid + "';");
                            System.out.println("Question updated successfully!!");
                        }

                        else if (qopt == 2) {
                            System.out.print("\033[H\033[2J");  
                            System.out.flush();

                            System.out.println("Enter new Correct Answer - ");
                            String correct = scan.next();

                            statement.execute("update question set Correct = '" + correct + "' where QuesID = '" + quesid + "';");
                            System.out.println("Answer updated successfully!!");
                        }

                        else if (qopt == 3) {
                            System.out.print("\033[H\033[2J");  
                            System.out.flush();

                            statement.execute("delete from question where QuesID = '" + quesid + "';");
                            System.out.println("Question deleted successfully!!");
                        }
                    }
                }
                

                else if(type.equals("S")) {
                    System.out.print("\033[H\033[2J");  
                    System.out.flush();
                    System.out.println("\nEnter your StudentID - ");
                    String studentid = scan.nextLine();

                    System.out.print("\033[H\033[2J");
                    System.out.flush();
                    System.out.println("Please select from the following options - \n1. View Quiz");

                    int opt = scan.nextInt();

                    if (opt == 1) {
                        System.out.print("\033[H\033[2J");
                        System.out.flush();

                        Statement statement;
                        ResultSet resultSet;
                        statement = connection.createStatement();
                        resultSet = statement.executeQuery("select * from attempts where studentid = '" + studentid + "'");

                        String quizid;
                        String grade;
                        while (resultSet.next()) {
                            quizid = resultSet.getString("QuizID");
                            grade = resultSet.getString("Grade");

                            System.out.println("QuizID : " + quizid + " Grade : " + grade);
                        }
                    }
                }
                break;
            }
            connection.close();
        }
        catch (Exception exception) {
            System.out.println(exception);
        }
    } // function ends
} // class ends