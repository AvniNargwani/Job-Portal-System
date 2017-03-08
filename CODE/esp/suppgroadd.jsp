<%@ page import="java.sql.*" %>
<%
  try
  {
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("Jdbc:Odbc:esp","esp","esp");
  Statement st=con.createStatement();
  //String s1=request.getParameter("h1");
  String s1=request.getParameter("empid");
  int s11=Integer.parseInt(s1);
  //String s2=request.getParameter("h2");
  String s2=request.getParameter("pgrsname");
  int s22=Integer.parseInt(s2);
  ResultSet rs1=st.executeQuery("select * from employee where ltrim(rtrim(emp_id))="+s11+"");
  if(rs1.next())
	  {
	  String cellno=rs1.getString(5);
	  String mailid=rs1.getString(7);
	  
//  String sql="insert into emp_prod_supp values('"+s1+"','"+s2+"')";
  String sql="insert into emp_prod_supp values("+s11+","+s22+")";
  int c=st.executeUpdate(sql);
  %>
  <html><head><script language="javascript"> function back(){ window.history.back();}</script></head>
  <body  background="http://localhost:8081/esp/images/mos.gif" text="white">
  <IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
	<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
  <BR><br><br><br><b><center><font face='bookman old style' color='yellow'><b> PRODUCT GROUP DISPLAY</b></font>
  <h3>Employee Id : <%= s11 %> </h3>
  <h3>product group No: <%= s22 %> </h3>
  <font color='yellow'> Succesfully Displayed<br><a href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a></font><br>
  <font color='yellow'> <br><a href="http://localhost:8081/esp/submanprivi.html"><b>YOUR PRIVILEGES</b></a></font><br>
  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
  <%
  st.close();
  con.close();
	  }
  }catch(Exception e)
  {
  System.out.println(e);
  }
 %>