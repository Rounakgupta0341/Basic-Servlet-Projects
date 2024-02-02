<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import ="java.sql.*" %> 
<%
	String username=request.getParameter("username");
	String pwd=request.getParameter("pwd");

	Class.forName("com.mysql.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/projectdb","root","0341");
	String sql="SELECT * FROM login WHERE Username=?,Password=?";
	PreparedStatement ps= con.prepareStatement(sql);
	ps.setString(1,username);
	ps.setString(2,pwd);
	ResultSet rs=ps.executeQuery();
	if(rs.next()){
		
	
%>
<script>
	alert('Login Successful!!!')
</script>
<%
}
	else
{
%>

    <script>
    	alert('Login Failed!!');
    	window.location.href="http://localhost:8080/Project3/index.jsp";
    </script>
    <%
    }
    ps.close();
    con.close();
    %>