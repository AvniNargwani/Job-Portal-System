<%@ page import="java.sql.*" %>
<%
try
{
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("Jdbc:Odbc:esp","esp","esp");
  Statement st=con.createStatement();
  Statement st1=con.createStatement();
  Statement st2=con.createStatement();
  String Sql="select min(emp_id) from employee"; 
  String s="select max(emp_id) from employee";
	ResultSet rs=st1.executeQuery(Sql);
	ResultSet r=st2.executeQuery(s);
	int a=0,b=0;
	while(rs.next())
	{  
	a=rs.getInt(1);
	r.next();
    b=r.getInt(1);
	}
	if((a==0) &&(b==0))
	a=101;
	else
	a=++b;

  String s2=request.getParameter("empname");
  String s3=request.getParameter("emppno");
  String s4=request.getParameter("emppager");
  String s5=request.getParameter("empcellno");
  String s6=request.getParameter("empfax");
  String s7=request.getParameter("empemail");
  String s8=request.getParameter("empmngr");
  String s9=request.getParameter("empuid");
  String s10=request.getParameter("emppwd");
  String s11=request.getParameter("emputype");
  String sql1="insert into employee values("+a+",'"+s2+"','"+s3+"','"+s4+"','"+s5+"','"+s6+"','"+s7+"','"+s8+"')" ;
  int c=st.executeUpdate(sql1);
  String sql2="insert into user_login values('"+s9+"','"+s10+"','"+s11+"')";
  int d=st.executeUpdate(sql2);
  %>
  <html><head><script language="javascript"> function back(){ window.history.back();}</script></head>
<body background="esp/images/mos.gif" text=\"white\" alink=\"red\" vlink=\"white\" link=\"cornsilk\" text=\"white\" >
<IMG SRC="images\LOGO.GIF" width=200 height=30 style=\"position:relative;left:15.5%;top:6%\"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR=\"yellow\" width=550 style=\"position:relative;left:16%;top:5%\">
<br><br><br><br><center><h4> EMPLOYEE REGISTRATION </h4>
<h3>employee id : <%=a%> </h3>
<h3>employee name: <%= s2 %> </h3>
 <h3>employee phone no: <%= s3 %> </h3>
 <h3>employee pager: <%= s4 %> </h3>
 <h3>employee cell no: <%= s5 %> </h3>
 <h3>employee fax : <%= s6 %> </h3>
 <h3>employee email: <%= s7 %> </h3>
 <h3>employee manager: <%= s8 %> </h3>
 <font color='yellow'><br><a href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a></font><br>
<font color='yellow'><br><a href="http://localhost:8081/esp/submanprivi.html"><b>YOUR PRIVILEGES</b></a></font><br></center>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
<%
  }catch(Exception e)
  {
  System.out.println(e);
  }
%>