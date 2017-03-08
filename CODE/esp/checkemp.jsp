<html>
<body background="images/mos.gif"  text=\"white\"link=\"Yellow\" vlink=\"white\" alink=\"cornsilk\">
<IMG SRC="images\LOGO.GIF" width=200 height=30 style=\"position:relative;left:15.5%;top:6%\"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR=\"red\" width=550 style="position:relative;left:16%;top:5%">
<%@ page import="java.sql.*" %>
<%
  try
  {
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("Jdbc:Odbc:esp","esp","esp");
  Statement st=con.createStatement();
  String s1,s2,s3,s4,s5,s6,s7,cit;
  ResultSet rs;
  s1=request.getParameter("login");

  HttpSession session1=request.getSession(true);
  session1.putValue("s1",s1);
  
  s2=request.getParameter("password");
  s3=request.getParameter("l1");
  cit="select * from user_login  where user_id='"+s1+"'";
   st=con.createStatement();
  rs=st.executeQuery(cit);
  rs.next();
  s4=rs.getString(2);
  s7=rs.getString(3);
  if((s2.equals(s4)) && (s3.equals(s7)))
	  {
        if (s3.equals("super manager")) 
	     {
         response.sendRedirect("http://localhost:8081/esp/supermanprivi.html");
	     }
		         if (s3.equals("sales person")) 
	      {
         response.sendRedirect("http://localhost:8081/esp/salesprivi.html");
	      } 
          	 if (s3.equals("support person")) 
	      {
         response.sendRedirect("http://localhost:8081/esp/supportprivi.html");
	      }   
		  if (s3.equals("sub manager")) 
	      {
         response.sendRedirect("http://localhost:8081/esp/submanprivi.html");
	      }   
	  }
 else
	  {
        response.sendRedirect("http://localhost:8081/esp/index.html");
      }
  %>
  <a href="http://localhost:8081/esp/index.html"><b>Homepage</b></a>
  </body></html>
<%
  st.close();
  con.close();
  }catch(Exception e)
  {
  System.out.println(e);
  }
 %>