<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
</HEAD>
<BODY>
<pre>
<h4>
<%@ page import="java.sql.*" %>
<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
	Statement st=con.createStatement();
  String s1=request.getParameter("firstname");
  String s2=request.getParameter("middlename");
  String s3=request.getParameter("lastname");
  String s4=request.getParameter("address");
  String s5=request.getParameter("phoneno");
  String s6=request.getParameter("emailid");
  String s7=request.getParameter("faxno");
  String s8=request.getParameter("state");
  String s9=request.getParameter("country");
  String s10=request.getParameter("ccard");
  String s11=request.getParameter("creditname");
  String s12=request.getParameter("ccardno");
  String s13=request.getParameter("ccstartdate");
  String s14=request.getParameter("ccenddate");
  String a=request.getParameter("username");  
  String cit="insert into register values('"+s1+"','"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"','"+s9+"','"+s10+"','"+s11+"','"+s12+"','"+s13+"','"+s14+"','"+a+"')" ;
  int c=st.executeUpdate(cit);
  String user=request.getParameter("username");
  String password=request.getParameter("pwd");
  String utype=request.getParameter("usertype");
  String cit1="insert into user_login values('"+user+"','"+password+"','"+utype+"')";
  int c1=st.executeUpdate(cit1);

%>

<html><head><script language=\"javascript\"> function back(){ window.history.back();}</script></head>
<body background="http://localhost:8081/esp/images/mos.gif"  text=\"white\"link=\"Yellow\" vlink=\"white\" alink=\"cornsilk\">
  <IMG SRC="images\LOGO.GIF" width=200 height=30 style=\"position:relative;left:15.5%;top:6%\"><br>
  <hr ALIGN=left SIZE=1 NOSHADE COLOR=\"red\" width=550 style=\"position:relative;left:16%;top:5%\">
  <br><br><font color=\"yellow\"><h2> THANKS FOR THE REGISTRATION </h2></font><hr>
  <h3>  ID				   : <%= a %> </h3>
  <h3>  Name        : <%= s1 %> </h3>
  <br><font color=\"yellow\"><h3></b>Your profile has been added</b> </h3></font>
  <br><a href="http://localhost:8081/esp/index.html"><b>Homepage</b></a>
  <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick=\"back()\"></body></html>
  <%
  st.close();
  con.close();
  }catch(Exception e)
  {
  System.out.println("The Following exception occured"+e);
  }
%>
</h4>
</pre>
</BODY>
</HTML>
