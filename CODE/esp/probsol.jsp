<%@ page import="java.sql.*" %>
<%
try
{
Connection con;
Statement st;
ResultSet rs;
String SQL;
String probid,grp;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
probid=request.getParameter("pid");
grp=request.getParameter("group");
SQL="select * from PROB_HISTORY where PROB_ID="+probid+" and PROB_ABOUT like '"+grp+"'";
st=con.createStatement();
rs=st.executeQuery(SQL);
rs.next();
//Calendar calendar=Calendar.getInstance();
//String months[]={"jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"};
//String d=calendar.get(Calendar.DATE)+"-"+(months[calendar.get(Calendar.MONTH)])+"-"+calendar.get(Calendar.YEAR);
%>
<HTML>
<head><script language="javascript"> function sta() { var a=document.pro.prob.value; document.pro.status.value=a }</script></head>
<body background="http://localhost:8081/esp/images/mos.gif"  text="white"link="Yellow" vlink="white" alink="cornsilk">
<IMG SRC="images/LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
<FORM METHOD=POST  action="http://localhost:8081/esp/solnadd.jsp" name="pro"><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="4">
<br><br><TABLE><TR><TD><b>Problem Id</b></TD>
<TD><INPUT TYPE="text" NAME="pid" value=<%= rs.getInt(1) %>></TD>
<TR><TD><b>User Name</b></TD>
<TD><INPUT TYPE="text" NAME="uname" value=<%= rs.getString(2) %>></TD>
</TR><TR><TD><b>Problem Description</b></TD>
<TD><INPUT TYPE="text" NAME="pdesc" value=<%= rs.getString(3) %>></TD>
</TR><TR><TD><b>Solution</b></TD>
<TD><TEXTAREA NAME="soln" ROWS="5" COLS="20"></TEXTAREA></TD>
</TR><TR><TD><b>Resolved Date</b></TD>
<TD><INPUT TYPE="text" NAME="resdate" ></TD>
</TR><TR><TD><b>Updated Date</b></TD>
<TD><INPUT TYPE="text" NAME="update" ></TD>
</TR><TR><TD><b>Resolved By</b></TD>
<TD><INPUT TYPE="text" NAME="resname"></TD></TR>
<tr><td><b>Status</b></td>
<TD><SELECT NAME=prob onChange="sta()"><option selected>--select any one--</option><option value="solved">Solved</option><option value="unsolved">Unsolved</option></SELECT><INPUT TYPE="hidden" name="status"></TD></tr>
<tr><td><b>Problem Group</b></td><td><INPUT TYPE="text" NAME="group" value=<%= grp %>></td><td></tr><tr><td><INPUT TYPE="submit"value="Send"></td>
<td><INPUT TYPE="reset"value="Clear"></td>
</tr></TABLE></FORM><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="4">
<font color="yellow"><a href="http://localhost:8081/esp/index.html"><b>Homepage</b></a>
<a href="http://localhost:8081/esp/supportprivi.html"><b>YOUR PRIVILEGES</b></a></FONT></BODY></HTML>
<%
rs.close();
st.close();
con.close();
}
catch(Exception e)
{
System.out.println("Exception  "+e);
}
%>