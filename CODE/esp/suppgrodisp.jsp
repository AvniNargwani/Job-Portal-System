<html><head>
<script language=\"javascript\"> function back(){ window.history.back();}</script></head>
<body background="http://localhost:8081/esp/images/mos.gif" text='white' alink="red" vlink="white" link="cornsilk" text="white">
<%@ page import="java.sql.*" %>
<%
try
{
Connection con;
Statement st,st1;
ResultSet rs,rs1;
String SQL,sql1,str,str1,gr;
int a,b;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
st=con.createStatement();
st1=con.createStatement();
SQL="select * from emp_prod_supp";
rs=st.executeQuery(SQL);
%>
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
<br><br><b><center><font face='bookman old style' color='yellow'>PRODUCT  SUPPORT GROUP DETAILS</b></font></center>
<%
while(rs.next())
{
	str=rs.getString(1);
	b=rs.getInt(2);
	//out.println(b);
	sql1="select prod_group_name from prod_group where prod_group_id="+b+"";
	rs1=st1.executeQuery(sql1);
	while(rs1.next())
	{
		str1=rs1.getString(1);
		%>
		<pre><b>employee id             :</b><%= str %>
		<pre><b>product group no     :</b><%= b %>
		<pre><b>product group name :</b><%= str1 %><br>
		<%
	}
}
%>
<center><h4><font color='yellow'> Succesfully Displayed</h4><br>
<a href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a>
<font color='yellow'> <br>&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></font></body></html>
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