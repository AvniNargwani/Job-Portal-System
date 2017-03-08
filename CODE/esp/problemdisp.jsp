<%@ page import="java.sql.*" %>
<%
try
{
Connection con;
Statement st,st1;
ResultSet rs,rs1,rs2,rs3,rs4;
String SQL,sql1,sql2,sql3,sql4;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
st=con.createStatement();
String grp=request.getParameter("probgrp");
HttpSession session1=request.getSession(true);
String ls=(String)session1.getValue("s1");
sql2="select * from employee where EMP_name='"+ls+"'";
rs2=st.executeQuery(sql2);
	if(rs2.next())

	{
		String eid=rs2.getString(1);
		int eid1=Integer.parseInt(eid);
		sql3="select * from EMP_PROD_SUPP where emp_id='"+eid1+"'";
		rs3=st.executeQuery(sql3);
			if(rs3.next())
			{
				String group=rs3.getString(2);
				int group1=Integer.parseInt(group);
				sql4="select * from product where ltrim(rtrim(PROD_GRP_ID))="+group1+"";
				rs4=st.executeQuery(sql4);
					if(rs4.next())
					{
							String pname=rs4.getString(2);
							if(pname.equals(grp))
							{
								SQL="select * from prob_history where prob_about like '"+grp+"' order by prob_id";
								rs=st.executeQuery(SQL);
								%>
								<html><head><script language="javascript"> function back(){ window.history.back();}</script></head>
								<body background="http://localhost:8081/esp/images/mos.gif"  text="Black"link="Yellow" vlink="Red" alink="cornsilk">
								<IMG SRC="images/LOGO.GIF" width="200" height="30" style="position:relative;left:15.5%;top:6%"><br>
								<hr ALIGN="left" SIZE="1" NOSHADE COLOR="red" width="550" style="position:relative;left:16%;top:5%">
								<br><br><font color="yellow"><h3>PROBLEMS OF <%= grp%></h3></font><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="2">
								<table  border="4" cellpadding="5">
								<tr align="center" width="1300" >
								<th>Problem Id</th>
								<th>User</th>
								<th>Description </th>
								<th>Problem Posted on </th>
								<th>Problem Priority</th>
								</tr>
								<%
									if(rs!=null)
									{
										while(rs.next())
											{
													
												%>
												<tr align="center" width="1300">
												<td  width="300"><%= rs.getInt(1) %></td>
												<td  width="300"><%= rs.getString(2) %></td>
												<td width="300"><%= rs.getString(3) %></td>
												
												<td width="300"><%= rs.getString(7) %></td>
												</tr>
												<%
											}
												%>
											</table><br><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="2">
											<form name="f1"method="post" action="http://localhost:8081/esp/probsol.jsp"><b>Problem Id</b><INPUT TYPE="text" NAME="pid">
											<INPUT TYPE="hidden" NAME="group" value="<%= grp %>"><INPUT TYPE="submit"value="Send">
											<%
									}
									%>
									</FORM>
									<%
									sql1="select * from prob_history where prob_about like '"+grp+"' and status like 'unsolved'";
									st1=con.createStatement();
									rs1=st1.executeQuery(sql1);
									%>
									<font color="yellow"><h3>Unsolved Problems</h3></font><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="2">
									<table  border="4" cellpadding="5">
									<tr align="center" width="1300" >
									<th>Problem Id</th>
									<th>User Name</th>
									<th>Description </th>
									<th>Status</th>
									<th>Problem Group</th>
									</tr>
									<%
										if(rs1!=null)
											{
												while(rs1.next())
													{
													%>
														<tr align="center" width="1300">
														<td  width="300"><%=rs1.getInt(1) %></td>
														<td  width="300"><%= rs1.getString(2) %></td>
														<td width="300"><%= rs1.getString(3) %></td>
														<td width="300"><%= rs1.getString(8) %></td>
														<td width="300"><%= rs1.getString(9) %></td>
														</tr>
													<%
													}
													%>
													</table><br><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="2"><form name="f2" method="post" action="http://localhost:8081/esp/solnmodi.jsp"><br><b>Unsolved Problem Id  </b><INPUT TYPE="text" NAME="pid">
													<INPUT TYPE="submit"value="Send">
													</FORM><font color="yellow"><a href="http://localhost:8081/esp/index.html"><b>Homepage</b></font></a>
													<a href="http://localhost:8081/esp/supportprivi.html"><font  color="YELLOW"><b>YOUR PRIVILEGES</b></FONT></a><br>
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit" value="BACK" onClick="back()"></body></html>
													<%
											}
							}
							else
							{
							out.println("<center><h2>CHOOSE RIGHT GROUP</h2></center>");
	    						}
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