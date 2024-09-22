import java.sql.*;
import java.util.Scanner;

public class JDBCApplication {

	 private final static String JDBC_CONNECTOR = "jdbc:postgresql"; 
	    private final static String HOST = "localhost:5432";
	    private final static String DB_NAME = "RefereeClub";
	    private final static String USER = "postgres";
	    private final static String PASSWORD = "postgres";

	    public static void main(String[] args) {

	        String url = String.format("%s://%s/%s?user=%s&password=%s", JDBC_CONNECTOR, HOST, DB_NAME, USER, PASSWORD);
	        System.out.println("The connection URL is:" + url);
	        
        try (Connection connection = DriverManager.getConnection(url);) {

            System.out.println("Connected to the database.");
            
            Scanner scanner = new Scanner(System.in);

            while (true) {
                System.out.print("Enter SQL command (INSERT, UPDATE, DELETE or SELECT): ");
                String sql = scanner.nextLine().trim();

                if (sql.equalsIgnoreCase("exit")) {
                    System.out.println("Exiting application.");
                    break;
                }

                if (sql.toUpperCase().startsWith("SELECT")) {
                    executeSelectQuery(connection, sql);
                } else if (sql.toUpperCase().startsWith("INSERT") || sql.toUpperCase().startsWith("UPDATE")
                		|| sql.toUpperCase().startsWith("DELETE")) {
                    executeInsertQuery(connection, sql);
                } else {
                    System.out.println("Invalid command. Please enter either an INSERT or SELECT statement.");
                }
            }
            
            scanner.close();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private static void executeSelectQuery(Connection connection, String sql) {
        try (Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

        	// get column count from meta data
            ResultSetMetaData metaData = resultSet.getMetaData();
            int columnCount = metaData.getColumnCount();

            // print column names
            for (int i = 1; i <= columnCount; i++) {
                System.out.print(metaData.getColumnName(i) + "\t");
            }
            System.out.println();

            // print each row from the result set
            while (resultSet.next()) {
                for (int i = 1; i <= columnCount; i++) {
                    System.out.print(resultSet.getString(i) + "\t");
                }
                System.out.println();
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private static void executeInsertQuery(Connection connection, String sql) {
        try (Statement statement = connection.createStatement()) {
            statement.executeUpdate(sql);
            System.out.println("Command executed.)");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
