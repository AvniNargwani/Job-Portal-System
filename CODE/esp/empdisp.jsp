<html>
<head><script language="javascript"> function back(){ window.history.back();}</script></head>
<body  background="http://localhost:8081/esp/images/mos.gif" text="white" alink="red" vlink="white" link="cornsilk" text="white">
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
<%@ page import="java.sql.*" %>
<%
try
{
Connection con;
//PrintWriter pw;
Statement st;
ResultSet rs;
String SQL,s1;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
s1=request.getParameter("eeid");
SQL="select * from employee where emp_id='"+s1+"'";
st=con.createStatement();
rs=st.executeQuery(SQL);
%>
<br><br><br><b><center><font face='bookman old style' color='yellow'> EMPLOYEE DETAILS</b></font></center>
<%
while(rs.next())
	{
	%>
<pre>Employee id :<%=rs.getString(1)%><br>
<pre>Employee name   :<%=rs.getString(2)%><br>
<pre>Employee phone no   :<%=rs.getString(3)%><br>
<pre>Employee pager   :<%=rs.getString(4)%><br>
<pre>Employee cell no   :<%=rs.getString(5)%><br>
<pre>Employee fax   :<%=rs.getString(6)%><br>
<pre>Employee email   :<%=rs.getString(7)%><br>
<pre>Employee manager   :<%=rs.getString(8)%><br>
<%
	}
%>
<center><h4><font color='yellow'> Succesfully Displayed</h4> </a><br>
<font color='yellow'><br><a href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a></font>
<font color='yellow'><br><input type=submit value=BACK onClick="back()"></font><br></center></body></html>
<%
rs.close();
st.close();
con.close();
}
catch(Exception e)
{
  System.out.println(e);
}
%>