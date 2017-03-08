<html><head>
<script language="javascript"> function back(){ window.history.back();}</script></head>
<body bgcolor=blue background="http://localhost:8081/esp/images/mos.gif" alink="red" vlink="white" link="cornsilk" text="white">
<%@ page import="java.sql.*" %>
<%
try
{
Connection con;
Statement st;
ResultSet rs;
String SQL;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
SQL="select * from product";
st=con.createStatement();
rs=st.executeQuery(SQL);
%>
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
<br><br><br><b><center><font face='bookman old style' color='yellow'>PRODUCT GROUP DETAILS</b></font></center>
<%
while(rs.next())
	{
		%>
<pre><b>Product ID            :</b><%= rs.getString(1) %>
<pre><b>Product Name       :</b><%= rs.getString(2) %>
<pre><b>Product Group ID  :</b><%= rs.getString(3) %><br>
<%
	}
		%>
<center><h4><font color='yellow'> Succesfully Displayed</h4><br><a href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
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