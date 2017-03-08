<%@ page import="java.sql.*" %>
<%
try
{
Connection con;
Statement st,st1;
ResultSet rs;
String SQL,sql1;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
st=con.createStatement();
st1=con.createStatement();
String s0=request.getParameter("pid");
String s1=request.getParameter("solution");
String s2=request.getParameter("resdate");
String s3=request.getParameter("update");
String s4=request.getParameter("resolby");
String s5=request.getParameter("status");
SQL="update prob_soln set solution='"+s1+"',res_date='"+s2+"',up_date='"+s3+"',resolby='"+s4+"',status='"+s5+"' where prob_id="+s0;
int n=st.executeUpdate(SQL);
sql1="select username,problem from prob_soln where prob_id="+s0;
rs=st1.executeQuery(sql1);
%>
<html><head><script language="javascript"> function back(){ window.history.back();}</script></head>
<body background="http://localhost:8081/esp/images/mos.gif" link="Yellow" vlink="white" alink="cornsilk" text="white"> <IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="2">d
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
<%
if(n>0)
{
rs.next();
%>
<br><br><h3><font color="yellow">Solution Modified For User:<%= rs.getString(1) %></font></h3><IMG   SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="4">
  <h2>Problem id:<%= s0 %></h2>
<h3><table><tr><td><b>Description</b></td><td>:<b><%= rs.getString(2) %></b></td></tr></h3>
 <h3><tr><td><b>Solution</b></td><td>:<b><%= s1 %></b></td></tr></table></h3>
 <%
 }
else{
%>
<h3>Try again</h4>
<%
}
%>
<font color="yellow"><a href="http://localhost:8081/esp/index.html"><b>Homepage</b></a><br>
<a href="http://localhost:8081/esp/supportprivi.html"><font  color="YELLOW"><b>YOUR PRIVILEGES</b></a></FONT><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
<%
st.close();
con.close();
}
catch(Exception e)
{
System.out.println(e);
}
%>