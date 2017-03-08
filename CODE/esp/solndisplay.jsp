<html><head>
<title>Solution</title><script language="javascript"> function back(){ window.history.back();}</script></head>
<body background="http://localhost:8081/esp/images/mos.gif"  text="white" link="Yellow" vlink="white" alink="cornsilk">
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR=\"red\" width=550 style="position:relative;left:16%;top:5%">
<%@ page import="java.sql.*" %>
<%
Connection con;
//PrintWriter pw;
Statement st;
ResultSet rs;
String SQL;
int no;
try
{
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
no=Integer.parseInt(request.getParameter("pid").trim());
SQL="select * from prob_soln where prob_id='"+no+"' order by prob_about";
st=con.createStatement();
rs=st.executeQuery(SQL);
rs.next();
//}
//catch(Exception e)
//{
//System.out.println("Hello Subba Rao"+e);
//}

//try
//{
%>
<h3><b><center>Solution For Problem Posted By <i><%= rs.getString(2) %></i></b></font></center></h3><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="760" HEIGHT="4">
<table><tr><td><b>Problem # <%= rs.getInt(1) %>
&nbsp;&nbsp;&nbsp;<%= rs.getString(3) %></b></td></tr><tr><td><b>Solution  :<%= rs.getString(4) %></b></td></tr></table>
<IMG SRC="/esp/images/hr.gif" WIDTH="760" HEIGHT="4"><br>
<font color="yellow"><a href="http://localhost:8081/esp/index.html"><b>Homepage</b></a><br>
<a href="http://localhost:8081/esp/custcontactprivi.html"><font  color="YELLOW"><b>YOUR PRIVILEGES</b></a></FONT><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
<%
rs.close();
st.close();
con.close();
}
catch(Exception e)
{
System.out.println("Hello Subba Rao"+e);
}
%>