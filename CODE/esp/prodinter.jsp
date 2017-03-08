<%@ page import="java.sql.*" %>
<%
  try
  {
  ResultSet rs; 
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("Jdbc:Odbc:esp","esp","esp");
  Statement st=con.createStatement();
  String cit="select prod_group_id from prod_group";
  rs=st.executeQuery(cit);
  %>
  <html>
  <head><SCRIPT	LANGUAGE="JavaScript">
function set()
{ var a=document.f1.id.value;
document.f1.pgno.value=a;} function back(){ window.history.back();}</script></head>
  <body background="http://localhost:8081/esp/images/mos.gif"  text="white"link="Yellow" vlink="white" alink="cornsilk">
  <IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
  <hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
  <form name=f1 action="http://localhost:8081/esp/prodadd.jsp" method="post">
  <br><br><br><b><center><font face='bookman old style' color='yellow' size=2>CREATING CONTRACT</b></font></CENTER>
  <center><table>
  <TR><TD><b>product name </b></TD><td><INPUT TYPE="text" NAME="pname"></td></TR>
  <%
    int i=0;
	int s[]=new int[100];
	%>
<tr><td><b>Product Group No </b></td><td><select name="id" onBlur="set()">
<%
  while(rs.next())
	{
    s[i]=rs.getInt(1);
%>
    <option name="c1" value=<%= s[i] %>><%= s[i] %></option>
<%
	i++;
	}
%>
</td></tr></select>
<TR><TD><input type="hidden" name="pgno"></td></TR>
<tr><td><input type=submit value=send ></td><td><input type=reset value=clearform ></td>
<td><INPUT TYPE=submit value=back onClick=back()></td></tr></table></center>
 </form>
<font color='yellow'><a href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a>
<br><a href="http://localhost:8081/esp/salesprivi.html"><b>YOUR PRIVILEGES</b></a></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
<%
  st.close();
  con.close();
  }catch(Exception e)
  {
  System.out.println(e);
  }
%>