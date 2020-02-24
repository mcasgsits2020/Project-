import java.io.IOException;
import java.io.PrintWriter;
import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Archal Gupta
 */
public class register extends HttpServlet {
   

    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
                
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String gender = request.getParameter("gender");
                String age = request.getParameter("age");
                String email = request.getParameter("email");
                String address = request.getParameter("address");
                String mobile = request.getParameter("mobile");
                String password = request.getParameter("password");
                String cpass = request.getParameter("cpass");
               
                out.print("Registerd successfully" +fname+ " " +lname+ " " +gender+ " " +age+ " " +email+ " " +address+ " " +mobile+ " " +password+ " " +cpass);
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection ("jdbc:mysql://localhost:3306/gym","root","root");
                Statement st = con.createStatement();
                int x = st.executeUpdate("INSERT INTO register (`fname` ,`lname` ,`gender` ,`age` ,`email` ,`address` ,`mobile` ,`password` ,`cpass`) VALUES('"+fname+"','"+lname+"','"+gender+"','"+age+"','"+email+"','"+address+"','"+mobile+"','"+password+"','"+cpass+"')");
               
                out.print(x);
        }
        catch(Exception ex)
        {
          out.print(ex.getMessage().toString());  
        }
    }
}
    