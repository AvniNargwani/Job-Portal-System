<html>
<script language="javascript"> function back(){ window.history.back();}
</script>
</head>
<body background="http://localhost:8081/esp/images/mos.gif"  text="white">
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
<%@ page import="java.sql.*" %>
<%
try
{
Connection con;
Statement st;
ResultSet rs,rs1;
//PrintWriter pw;
String SQL;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
st=con.createStatement();
String s1=request.getParameter("username").trim();
SQL="select * from prob_soln where username like '"+s1+"'";
rs=st.executeQuery(SQL);
%>
<br><br><br><h3>PROBLEMS OF <%= s1 %></h3><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="2">
<table border=4 cellpadding=5>
<tr align='center' width=1300 >
<th>Problem Id</th>
<th>User Name</th>
<th>Description </th>
<th>Status</th>
</tr>
<%
if(rs!=null)
{
		while(rs.next())
			{
			%>
				<tr align='center' width=1300>
				<td  width=300><%= rs.getInt(1) %></td>
				<td  width=300><%= rs.getString(2) %></td>
				<td width=300><%= rs.getString(3) %></td>
				<td width=300><%= rs.getString(8) %></td>
				</tr>
				<%
			}//End of While
				%>
</table><br><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="2"><form name=Send User method=post action="http://localhost:8081/esp/solndisplay.jsp"><b>Problem Id</b><INPUT TYPE="text" NAME="pid">
<INPUT TYPE="submit"value="Send"><br>
<%
}
else if (rs==null)
{
%>
<center><h3>No Problems Posted by Customers!!</h3></center><br><br>
<%
}
%>
<br><font color="yellow"><a href="http://localhost:8081/esp/index.html"><b>Homepage</b></a><br>
<a href="http://localhost:8081/esp/custcontactprivi.html"><font  color="YELLOW"><b>YOUR PRIVILEGES</b></a></FONT><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
<%
rs.close();
st.close();
con.close();

}
catch(Exception e)
{
System.out.println("Exceprion  "+e);
}

%>