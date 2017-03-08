<%@ page import="java.sql.*" %>
<%
try
{
Connection con;
Statement st;
ResultSet rs;
String SQL;
String grp;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
grp=request.getParameter("probgrp");
SQL="select * from prob_history where prob_about like '"+grp+"' order by prob_about";
st=con.createStatement();
rs=st.executeQuery(SQL);
rs.next();
%>
<HTML><head>
<SCRIPT LANGUAGE="JavaScript">
function setdate(){
var d= new Date().toGMTString(),j,a;
j=d.substr(5,12);a='"+rs.getString(2)+"';document.pro.resdate.value=j;
document.pro.update.value=j;
document.pro.pdesc.value=a;}
</SCRIPT></head>
<BODY background="http://localhost:8081/esp/images/paperbg.jpg" text="#333399">
<FORM METHOD=POST action="http://localhost:8081/esp/solnadd.jsp" name="pro">
<TABLE><TR><TD><b>User Name</b></TD>
<TD><INPUT TYPE="text" NAME="uname" value=<%= rs.getString(1) %>></TD>
</TR><TR><TD><b>Problem Description</b></TD>
<TD><TEXTAREA NAME="pdesc" ROWS="5" COLS="20"></TEXTAREA></TD>
</TR><TR><TD><b>Solution</b></TD>
<TD><TEXTAREA NAME="soln" ROWS="5" COLS="20"></TEXTAREA></TD>
</TR><TR><TD><b>Resolved Date</b></TD>
<TD><INPUT TYPE="text" NAME="resdate"disabled></TD>
</TR><TR><TD><b>Updated Date</b></TD>
<TD><INPUT TYPE="text" NAME="update" disabled></TD>
</TR><TR><TD><b>Resolved By</b></TD>
<TD><INPUT TYPE="text" NAME="resname"></TD></TR>
<script>setdate();</script>
<tr><td><INPUT TYPE="submit"value="Send"></td>
<td><INPUT TYPE="reset"value="Clear"></td>
</tr></TABLE></FORM></BODY></HTML>
<%
rs.close();
st.close();
con.close();
}
catch(Exception e)
{
System.out.println("Exception"+e);
}
%>