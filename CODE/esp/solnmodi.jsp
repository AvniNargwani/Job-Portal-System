<%@ page import="java.sql.*" %>
<%
try
{
Connection con;
//PrintWriter pw;
Statement st;
ResultSet rs;
String SQL;
int no;
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("jdbc:odbc:esp","esp","esp");
no=Integer.parseInt(request.getParameter("pid").trim());
SQL="select * from prob_soln where prob_id="+no+"";
st=con.createStatement();
rs=st.executeQuery(SQL);
rs.next();
//Calendar calendar=Calendar.getInstance();
//String months[]={"jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"};
//String d=calendar.get(Calendar.DATE)+"-"+(months[calendar.get(Calendar.MONTH)])+"-"+calendar.get(Calendar.YEAR);
%>
<html>
<head><script language="javascript"> function sta() { var a=document.pro.prob.value; document.pro.status.value=a }
function back(){ window.history.back();}</script></head>
<body background="http://localhost:8081/esp/images/mos.gif"  text="white" link="Yellow" vlink="white" alink="cornsilk">
<IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
<hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
<font color="yellow"><h3>Solution For  <%= rs.getString(2) %></h3></font><iMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="2">
<FORM METHOD=POST ACTION="http://localhost:8081/esp/solnmodifying.jsp" name=pro>
<h3><table><tr><td> Problem Id :</td><td><input type="text" name='pid' value=<%= rs.getInt(1) %>></td></tr>
<tr><td>Description :</td><td><input type="text" name='pdesc' value=<%=  rs.getString(3) %>></td></tr><tr><td>Solution  : </td><td><input type='text' name='solution'  size=30></td></tr>
<tr><td>Resolved  Date   :</td><td><input type='text' name='resdate'></td></tr><tr><td>Update Date  :</td><td><input type='text' name='update' size=17 ></td></tr>
<tr><td>Resolved By  :</td><td><input type='text' name='resolby'></td></tr><tr><td>Status  :</td><TD><SELECT NAME=prob onChange="sta()"><option selected>--select any one--</option><option value="solved">Solved</option><option value="unsolved">Unsolved</option></SELECT><INPUT TYPE="hidden" name="status"></TD></tr>
<tr><td>Problem Group</td><td><input type='text' name='probabout' value=<%= rs.getString(9) %>>
<tr><td><INPUT TYPE="submit" value="Send"></td>
<td><INPUT TYPE="reset"value="Clear"></td>
<br>
</h3>
</table></form><IMG SRC="http://localhost:8081/esp/images/hr.gif" WIDTH="765" HEIGHT="2">
<font color="yellow"><a href="http://localhost:8081/esp/index.html"><b>Homepage</b></a>
<a href="http://localhost:8081/esp/supportprivi.html"><font  color="YELLOW"><b>YOUR PRIVILEGES</b></a></FONT><br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
<%
rs.close();
st.close();
con.close();
}
catch(Exception e)
{
System.out.println("Hello "+e);
}
%>