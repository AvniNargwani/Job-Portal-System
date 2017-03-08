<html>
  <head><SCRIPT	LANGUAGE=\"JavaScript\">
  function set()
  { var a=document.f1.empid.value;
  document.f1.h1.value=a;} function back(){ window.history.back();}
  function set1()
  { var b=document.f1.pgrsname.value;
  document.f1.h2.value=b;}</script></head>
<%@ page import="java.sql.*" %>
<%
  try
  {
  ResultSet rs,rs1; 
  Statement st,st1;
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("Jdbc:Odbc:esp","esp","esp");
  st=con.createStatement();
  st1=con.createStatement();
  String cit="select emp_id from employee";
  rs=st.executeQuery(cit);
  String cit1="select prod_group_id from prod_group";
  rs1=st1.executeQuery(cit1);
  %>
  
<body background="http://localhost:8081/esp/images/mos.gif"  text="white" link="Yellow" vlink="white" alink="cornsilk">
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
  <hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
  <form name=f1 action="http://localhost:8081/esp/suppgroadd.jsp" method="post">
  <br><br><br><b><center><font face='bookman old style' color='yellow' size=2>PRODUCT SUPPORT GROUP ASSIGNMENT</b></font></CENTER>
  <center><table>
  <%  
	int i=0;
	int s[]=new int[100];
  %>
  <tr><td><b>Employee ID</b></td><td><select name="empid" onBlur="set()">
<%
  while(rs.next())
	{
    s[i]=rs.getInt(1);
%>
<option name="c1" value=<%= s[i] %>> <%= s[i] %> </option>
<%
    i++;
	}
	%>

  </td></tr></select>
  <TR><TD><input type="hidden" name="h1" ></td></TR>

<%
	int j=0;
	int s1[]=new int[100];
  
  %>
  <tr><td><b>Product group supported ID</b></td><td><select name="pgrsname" onBlur="set1()">
  <%
  while(rs1.next())
	{
    s1[i]=rs1.getInt(1);
    %>
	<option name="c2" value=<%= s1[i] %>> <%= s1[i] %> </option>
<%
    j++;
	}
	%>
  </td></tr></select>
  <TR><TD><input type="hidden" name="h2"></td></TR>
<TR><TD><INPUT TYPE="submit" value="send"></td><TD><INPUT TYPE="reset" value="clear form"></td></TR></table></center>
  </form>
<font color='yellow'><a href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a>
<br><a href="http://localhost:8081/esp/submanprivi.html"><b>YOUR </b></a></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
<%
  st.close();
  con.close();
  }catch(Exception e)
  {
  System.out.println(e);
  }
 %>