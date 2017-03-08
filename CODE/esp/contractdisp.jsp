<%@ page import="java.sql.*" %>
<%
try
{
Connection con;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
Statement st;
ResultSet rs;
String SQL,s2;
s2=request.getParameter("cuid");
SQL="select * from cust_contract where cust_id='"+s2+"'";
st=con.createStatement();
rs=st.executeQuery(SQL);
%>
<html><head>
<script language="javascript"> function back(){ window.history.back();}</script></head>
<body background="http://localhost:8081/esp/images/mos.gif" text='white' alink="red" vlink="white" link="cornsilk" text="white">
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
<center><h3><font color='yellow'>CONTRACT DETAILS </font></h3></center>
<%
rs.next();
%>
<pre><b>Customer id :</b><%= rs.getString(1) %><br>
<pre><b>Contract product id :</b><%= rs.getString(2) %><br>
<pre><b>Contract type  :</b><%= rs.getString(3) %><br>
<pre><b>Contract start date :</b><%= rs.getDate(4) %><br>
<pre><b>Contract end date :</b><%= rs.getDate(5) %><br>
<pre><b>Contract created by:</b><%= rs.getString(6) %><br>
<pre><b>Contract updated by   :</b><%= rs.getString(7) %><br>
<pre><b>Contract created date:</b><%= rs.getDate(8) %><br>
<pre><b>Contract updated date:</b><%= rs.getDate(9) %><br>
<center><h4><font color='yellow'> Succesfully Displayed</h4><br><a href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a><br>
<font color='yellow'> <a href="http://localhost:8081/esp/salesprivi.html"><b>YOURPRIVILEGES</b></a></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
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