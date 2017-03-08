<%@ page import="java.sql.*" %>
<%
 try
  {
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("Jdbc:Odbc:esp","esp","esp");
  Statement st=con.createStatement();
  Statement st1=con.createStatement();
  int s0=Integer.parseInt(request.getParameter("pid"));
  String s1=request.getParameter("uname");
  String s2=request.getParameter("pdesc");
  String s3=request.getParameter("soln");
  String s4=request.getParameter("resdate");
  String s5=request.getParameter("update");
  String s6=request.getParameter("resname");
  String s7=request.getParameter("prob");
  String s8=request.getParameter("group");
  String cit="insert into prob_soln values("+s0+",'"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"')" ;
  int c=st.executeUpdate(cit);
%>
  <html><head><script language="javascript"> function back(){ window.history.back();}</script></head>
  <body background="http://localhost:8081/esp/images/mos.gif"  text="white" link="Yellow" vlink="white" alink="cornsilk">
  <IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
<br><br><h3><font color="yellow">Solution Added For User:<%= s1 %></font></h3><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="4">
<h2>Problem id:<%= s0 %></h2>
<h3><table><tr><td><b>Description</b></td><td>:<b><%= s2 %></b></td></tr></h3>
<h3><tr><td><b>Solution</b></td><td>:<b><%= s3 %></b></td></tr></h3>
<%
   if(s7.equals("solved"))
	  {
	   int a=s0;
String cir="update prob_history set status='solved' where prob_id='"+s0+"'";
c=st.executeUpdate(cir);

	  }
	  %>
  </table><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="4"><br>
  <font color="yellow"><a href="http://localhost:8081/esp/index.html"><b>Homepage</a></b></font><br>
<a href="http://localhost:8081/esp/supportprivi.html"><font  color="YELLOW"><b>YOUR PRIVILEGES</b></a></FONT>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
  <%
  st.close();
  con.close();
  }catch(Exception e)
  {
  System.out.println("Exception"+e);
  }
%>