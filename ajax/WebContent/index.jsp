<%@ page import="java.sql.*"%>
<%
	String name = request.getParameter("val");
	if (name == null || name.trim().equals("")) {
		out.print("<p>Please enter name!</p>");
	} else {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			System.out.println("connection");
			Connection con = DriverManager
					.getConnection("jdbc:mysql://localhost:3306?user=root&password=dinga");
			System.out.println("get conetion");
			PreparedStatement ps = con
					.prepareStatement("select * from amplus.user where EmployeeName like '" + name + "%'");
			System.out.println("prepare");
			ResultSet rs = ps.executeQuery();
			System.out.println("excute query");

			if (!rs.isBeforeFirst()) {
				out.println("<p>No Record Found!</p>");
				System.out.println("condition");
			} else {
				out.print("<table border='1' cellpadding='2' width='100%'>");
				out.print(
						"<tr><th>Id</th><th>Name</th><th>Email</th><th>Address</th><th>City</th><th>State</th><th>Country</th></tr>");
				while (rs.next()) {
					out.print("<tr><td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td></tr>");
				}
				out.print("</table>");
			} //end of else for rs.isBeforeFirst
			con.close();
		} catch (Exception e) {
			out.print(e);
		}
	} //end of else
%>