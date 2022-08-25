import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Scanner;

public class Teste1 {

	public static void main(String[] args) {
		try {
			Connection connection = DriverManager.getConnection(
					"jdbc:hsqldb:hsql://localhost/", "SA", "");
			Statement stmt = connection.createStatement();
			Scanner scan = new Scanner(System.in);
			int re = scan.nextInt();
			String nome = "aaa','2000-01-01',4000);DROP TABLE TESTE;INSERT INTO FUNCIONARIOS VALUES(12,'bbb";
			
			String dataAdmStr = scan.next();

			double salario = scan.nextDouble();
			String sql = "INSERT INTO FUNCIONARIOS VALUES("+re+
					",'"+nome+"','"+dataAdmStr+"',"+salario+")";
			
			System.out.println(sql);		
			stmt.executeUpdate(sql);
			
			
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
