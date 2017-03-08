<%@ page import="java.sql.*" %>
<%
 try
  {
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("Jdbc:Odbc:esp","esp","esp");
  Statement st=con.createStatement();
   ResultSet rs,r;
  Statement st1=con.createStatement();
  Statement st2=con.createStatement();
  String Sql="select min(contract_prod_id) from cust_contract"; 
  String s="select max(contract_prod_id) from cust_contract";
	rs=st1.executeQuery(Sql);
	r=st2.executeQuery(s);
	int a=0,b=0;
while(rs.next())
 {  a=rs.getInt(1);
	r.next();
    b=r.getInt(1);
  }
if((a==0) &&(b==0))
	a=1;
else
	a=++b;
  String s1=request.getParameter("h1");
  String s3=request.getParameter("ctype");
  String s4=request.getParameter("consdt");
  String s5=request.getParameter("conedt");
  String s6=request.getParameter("concrby");
  String s7=request.getParameter("conupby");
  String s8=request.getParameter("concrdt");
  String s9=request.getParameter("conupdt");
  String cit="insert into cust_contract values('"+s1+"','"+a+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"')" ;
  int c=st.executeUpdate(cit);
  %>
  <html>
  <head><title>CUSTOMER CONTRACT</title>
  <script language="javascript"> function back(){ window.history.back();}</script>
  </head><body background="esp/images/mos.gif" text="Black" link="Yellow" vlink="white" alink="cornsilk">
  <IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
  <hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
  <br><br><h4><b><center>CUSTOMER CONTRACT</b></h4><hr>
  <h3><b> Customer ID       : <%= s1 %> </b></h3>
  <h3><b> Customer product Id : <%= a %> </b></h3><hr>
  <h4> Your profile has been added </h4>
  </center><br><br>
  <br><font color='yellow'><a href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a>
  <br><a href="http://localhost:8081/esp/salesprivi.html"><b>YOUR PRIVILEGES</b></a></font>
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