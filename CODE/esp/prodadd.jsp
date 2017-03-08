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
  String Sql="select min(prod_id) from product"; 
  String s="select max(prod_id) from product";
	rs=st1.executeQuery(Sql);
	r=st2.executeQuery(s);
	int a=0,b=0;
while(rs.next())
 {  a=rs.getInt(1);
	r.next();
    b=r.getInt(1);
  }
if((a==0) &&(b==0))
	a=10001;
else
	a=++b;
  String s2=request.getParameter("pname");
  String s3=request.getParameter("pgno");
  String sql1="insert into product  values("+a+",'"+s2+"','"+s3+"')";
  int c=st.executeUpdate(sql1);
  %>
  <html><head><script language=\"javascript\"> function back(){ window.history.back();}</script></head>
  <body background="http://localhost:8081/esp/images/mos.gif"  alink="red" vlink="white" link="cornsilk" text="white">
  <IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
  <hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
  <br><br><br><h3>product no : <%= a %> </h3>
  <h3>product name: <%= s2 %> </h3>
  <h3>product group no: <%= s3 %> </h3>
  <center><h4><font color='yellow'> Succesfully Displayed</h4> </a></center>
	<br><a
href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a><br>
  <a href="http://localhost:8081/esp/supermanprivi.html"><b>YOUR PRIVILEGES</b></a></FONT><br>&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
  <%
  st.close();
  con.close();
  }catch(Exception e)
  {
  System.out.println(e);
  }
 %>