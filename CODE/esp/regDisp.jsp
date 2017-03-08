<%@ page import="java.sql.*" %>
<%
try
{
	Connection con;
Statement st;
ResultSet rs;
String SQL;
boolean f;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
String str=request.getParameter("id");
//int a=Integer.parseInt(str);
SQL="select * from register where id='"+str+"'";
st=con.createStatement();
rs=st.executeQuery(SQL);
rs.next();
//}
//catch(Exception e)
//{
//System.out.println("Hello!!!!  Exception occurred"+e);
//}
%>
<html><head>
<script language="javascript"> function back(){ window.history.back();}</script></head>
<body background="http://localhost:8081/esp/images/mos.gif"   alink="red" vlink="white" link="cornsilk" text="white">
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">

<br><br><br><b><center><font face='bookman old style' color='yellow' size=2>CUSTOMER DETAILS</b></font>
<h4><pre><table><tr><td><b>First Name: </b></td><td><%= rs.getString(1) %></td></tr>
<pre><tr><td><b>Middle Name :</b> </td> <td><%= rs.getString(2) %></td></tr> <tr><td>Last Name :</td><td><%= rs.getString(3) %></td></tr>
<pre><tr><td><b>Address :</b> </td><td><%= rs.getString(4) %></td></tr><tr><td>Phone No :</td><td><%= rs.getInt(5) %></td></tr>
<pre><tr><td><b>Email id :</b></td><td><%= rs.getString(6) %></td></tr><td>Fax No : </td><td><%= rs.getInt(7) %></td></tr>
<pre><tr><td><b>State :</b></td><td><%= rs.getString(8) %></td></tr><tr><td> Country :</td><td><%= rs.getString(9) %></td></tr></table></h4>
<br><font color='yellow'><br><a href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a><br>
<a href="http://localhost:8081/esp/salesprivi.html"><b>YOUR PRIVILEGES</b></a></font></form></center>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
<%
rs.close();
st.close();
con.close();
}
catch(Exception e)
{
System.out.println(" The following Exception occurred "+e);
}
%>