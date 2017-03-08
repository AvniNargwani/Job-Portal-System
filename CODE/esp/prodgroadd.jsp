<%@ page import="java.sql.*" %>
<%
  try
  {
  ResultSet rs,r;
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("Jdbc:Odbc:esp","esp","esp");
  Statement st=con.createStatement();
  Statement st1=con.createStatement();
  Statement st2=con.createStatement();
  String Sql="select min(prod_group_id) from prod_group"; 
  String s="select max(prod_group_id) from prod_group";
	rs=st1.executeQuery(Sql);
	r=st2.executeQuery(s);
	int a=0,b=0;
while(rs.next())
 {  a=rs.getInt(1);
	r.next();
    b=r.getInt(1);
  }
if((a==0) &&(b==0))
	a=5001;
else
	a=++b;
  String s2=request.getParameter("pgrname");
  String sql="insert into prod_group values("+a+",'"+s2+"')";
  int c=st.executeUpdate(sql);
%>
 <html><head><script language="javascript"> function back(){ window.history.back();}</script></head>
 <body  background="http://localhost:8081/esp/images/mos.gif" alink="red" vlink="white" link="cornsilk" text="white">
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
 <hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
 <BR><br><br><br><b><center><font face='bookman old style' color='yellow'> PRODUCT GROUP DISPLAY</font></center>
<h3>product group no : <%= a %> </h3>
<h3>product group name: <%= s2 %> </h3>
<font color='yellow'> Succesfully Displayed<br><a href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a></font><BR>
<font color='yellow'><br><a href="http://localhost:8081/esp/supermanprivi.html"><b>YOUR PRIVILEGES</b></a></font><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
<%
 st.close();
 con.close();
  }catch(Exception e)
  {
  System.out.println(e);
  }
%>