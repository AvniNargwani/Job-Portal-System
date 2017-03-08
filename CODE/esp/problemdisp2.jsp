<%@ page import="java.sql.*" %>
<%
try{
Connection con;
Statement st,st1;
ResultSet rs,rs1,rs2,rs3,rs4,rs5,rs6;
String SQL,sql1,sql2,sql3,sql4,sql5,sql6;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
st=con.createStatement();
String grp=request.getParameter("probgrp");
HttpSession session1=request.getSession(true);
String ls=(String)session1.getValue("s1");
sql2="select * from employee where EMP_name='"+ls+"'";
rs2=st.executeQuery(sql2);
	while(rs2.next())
	{
             	sql3="select * from EMP_PROD_SUPP where emp_id='"+ rs2.getInt(1)+"'";
	rs3=st.executeQuery(sql3);
           while(rs3.next())
	{
             	sql4="select * from Prod_group where Prod_Group_id='"+ rs3.getInt(2)+"'";
	rs4=st.executeQuery(sql4);
              while(rs4.next())
	{
             	sql5="select * from Prob_history where Prob_about='"+ rs4.getString(2)+"' and status like 'solved'";
	rs5=st.executeQuery(sql5);


%>
								<html><head><script language="javascript"> function back(){ window.history.back();}</script></head>
								<body background="http://localhost:8081/esp/images/mos.gif"  text="Black"link="Yellow" vlink="Red" alink="cornsilk">
								<IMG SRC="images/LOGO.GIF" width="200" height="30" style="position:relative;left:15.5%;top:6%"><br>
								<hr ALIGN="left" SIZE="1" NOSHADE COLOR="red" width="550" style="position:relative;left:16%;top:5%">
								<br><br><font color="yellow"><h3>SOLVED PROBLEMS </h3></font><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="2">
								


								<table  border="4" cellpadding="5">
								<tr align="center" width="1300" >
                                                                                                               <th>Problem Id</th>
								<th>User</th>
								<th>Description </th>
								
								<th>Problem Priority</th>
								</tr>
									<%	while(rs5.next())
											{
 												%>
								                                                             
													
												%>
												<tr align="center" width="1300">
												<td  width="300"><%= rs5.getInt(1) %></td>
												<td  width="300"><%= rs5.getString(2) %></td>
												<td width="300"><%= rs5.getString(3) %></td>
												
												<td width="300"><%= rs5.getString(7) %></td>
												</tr>
												<%}  %>
												
								 </table><br> <IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="2">
											<form name="f1"method="post" action="http://localhost:8081/esp/solnmodi.jsp"><b>Problem Id</b><INPUT TYPE="text" NAME="pid">
											<INPUT TYPE="hidden" NAME="group" value="<%= grp %>"><INPUT TYPE="submit"value="Send">
											<br>
<br>
<br><br><br><br>
<br><a 
 href="http://localhost:8081/esp/index.html"><font size="" color="YELLOW"><b>HOMEPAGE</b></FONT></a>
<br>
<br>
<a 
 href="http://localhost:8081/esp/supportprivi.html"><font size="" color="YELLOW"><b>YOUR PRIVILEGES</b></FONT></a>
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<INPUT TYPE="submit" value="BACK" onClick="back()">
</body>
</html>

<%
                                                                                                                                                         }
									
									
	

}
}

con.close();
}
catch(Exception e)
{
System.out.println("Exception  "+e);
e.printStackTrace();
}
%>