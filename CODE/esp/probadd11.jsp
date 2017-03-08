<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
</HEAD>
<BODY background="images/mos.gif"  link='cornsilk' text='white' target="_self">
<pre>
<h4>
<%@ page import="java.sql.*" %>
<%
try
{
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("Jdbc:Odbc:esp","esp","esp");
  Statement st=con.createStatement();
  Statement st1=con.createStatement();
  Statement st2=con.createStatement();
  String Sql="select min(prob_id) from prob_history"; 
  String s="select max(prob_id) from prob_history";
	ResultSet rs=st1.executeQuery(Sql);
	ResultSet r=st2.executeQuery(s);
	int a=0,b=0;
	while(rs.next())
	{  
	a=rs.getInt(1);
	r.next();
    b=r.getInt(1);
	}
	if((a==0) &&(b==0))
	a=1001;
	else
	a=++b;

 String s2=request.getParameter("probpost");
 String s3=request.getParameter("probdesc");
 String s4=request.getParameter("probdate");
 String s5=request.getParameter("probnotidate");
 String s6=request.getParameter("probabout");
 String s7=request.getParameter("probattach");
 String cit="insert into prob_history values('"+a+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','unsolved')" ;
  int c=st.executeUpdate(cit);
%>
<html><head><script language="javascript"> function back(){ window.history.back();}</script></head>
<body background="images/mos.gif"  text="white" link="Yellow" vlink="white" alink="cornsilk">
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
<br><br><br><font color="yellow"><h2>PROBLEM ACCEPTED </h2><hr>
<h3>Problem Id:<i><%= a%></i></h3><h3>Problem posted by:<i><%= s2 %></i> </h3><hr>
<br><br><a href="http://localhost:8081/esp/Problem.html"><b>Post Another Problem</b></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://localhost:8081/esp/custcontactprivi.html"><font  color="YELLOW"><b>YOUR PRIVILEGES</b></a></font>
<br><font color="yellow"><a href="http://localhost:8081/esp/index.html"><b>Homepage</b></font></a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
<%
}
catch(Exception e)
{
  System.out.println("Exception"+e);
}
%>