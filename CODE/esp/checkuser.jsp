<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
</HEAD>
<BODY background="images/mos.gif"  link='cornsilk' text='white' target="_self">>
<pre>
<h4>
<%@ page import="java.io.*" %>
<%@ page import="java.sql.*" %>
<% int dd1=0; %>
<%
try
{
	Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
	Connection con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
	Statement st=con.createStatement();
	String s1,s2,s3,s4,s5,s6,s7,cit,conteddate,mm2="";
	s1=request.getParameter("login");
	s2=request.getParameter("password");
	s3=request.getParameter("l1");
cit="select * from user_login  where user_id='"+s1+"'";
st=con.createStatement();
ResultSet rs=st.executeQuery(cit);
	
if(rs.next())
{
%>
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
<%
  s4=rs.getString(2);
  s5=rs.getString(1);
  s7=rs.getString(3);
  if((s2.equals(s4)) && (s1.equals(s5)))
	  {
         if ((s3.equals("customer"))&&(s3.equals(s7))) 
	      {
			
			     
response.sendRedirect("http://localhost:8081/esp/custcontactprivi.html");
	      }
		  else
		  {
response.sendRedirect("http://localhost:8081/esp/emplogin.html");

		  }
          
	   }
 else
	  {

response.sendRedirect("http://localhost:8081/esp/index.html");
	}
	 %>
</body></html>
<%
}
else
{

response.sendRedirect("http://localhost:8081/esp/index.html");

}
//  pw.flush();
 // pw.close();
  //st.close();
  //con.close();
}
  catch(Exception e)
  {
  System.out.println(e);
  }
 
%>
</h4>
</pre>
</body>
</html>