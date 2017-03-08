<%@ page import="java.sql.*" %>
<%
 try
  {
  Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
  Connection con=DriverManager.getConnection("Jdbc:Odbc:esp","esp","esp");
  ResultSet rs,rs1,rs2; 
  Statement st=con.createStatement();
  String cit="select id from register";
  String cit1="select count(id) from register";
  //int cit11=Integer.parseInt(cit1);
  String cit2="select count(CUST_ID) from CUST_CONTRACT";
  //int cit22=Integer.parseInt(cit2);

  rs=st.executeQuery(cit);
  	int cit11=0,cit22=0;

  %>
  <html>
  <head><SCRIPT	LANGUAGE="JavaScript">
function set()
  { var a=document.f1.id.value;
document.f1.h1.value=a;} function back(){ window.history.back();}</script></head>
  <body background="http://localhost:8081/esp/images/mos.gif"  text="white"link="Yellow" vlink="white" alink="cornsilk">
 <IMG SRC="images\LOGO.GIF" width=200 height=30 style="position:relative;left:15.5%;top:6%"><br>
 <hr ALIGN=left SIZE=1 NOSHADE COLOR="red" width=550 style="position:relative;left:16%;top:5%">
<form name=f1 action="http://localhost:8081/esp/CustContract.jsp" method="post">
 <br><br><br><b><center><font face='bookman old style' color='yellow' size=2>CREATING CONTRACT</b></font></CENTER>
<center><table>
<%
//	Calendar calendar=Calendar.getInstance();
String months[]={"jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"};
//String d=calendar.get(Calendar.DATE)+"-"+(months[calendar.get(Calendar.MONTH)])+"-"+calendar.get(Calendar.YEAR);

//String d1=calendar.get(Calendar.DATE)+"-"+(months[calendar.get(Calendar.MONTH)+6])+"-"+calendar.get(Calendar.YEAR);

	HttpSession session1=request.getSession(true);
  String le1=(String)session1.getValue("s1");
	int i=0;
String s[]=new String[100];
	//int s[]=new int[100];
%>
<tr><td><b>Customer ID</b></td><td><select name="id" onBlur="set()">
<%
  while(rs.next())
	{
    s[i]=rs.getString(1);
  %>
  <option name="c1" value=<%= s[i] %>><%= s[i] %></option>
	<%
    i++;
	}

rs1=st.executeQuery(cit1);

//rs1.open;
  while(rs1.next())
  {
	  cit11=rs1.getInt(1);
  }
  rs1.close();
  rs2=st.executeQuery(cit2);
  //rs2.open;
  while(rs2.next())
  {
	  cit22=rs2.getInt(1);
  }
rs2.close();
  if(cit11>cit22)
	{
		int cn=cit11-cit22;
		%>
		<marquee behavior=alternate><%= cn %> The number of customers are waiting  for contract</marquee>
		<%
	}
	%>
  </td></tr></select>
<TR><TD><input type="hidden" name="h1"></td></TR>
<TR><TD><b>contract type:</b></TD><td><INPUT TYPE="text" NAME="ctype"></td></TR>
<TR><TD><b>contract start date:</b></TD><td><INPUT TYPE="text" NAME="consdt"  value="">(e.g:12-jan-2009)</td></TR>
<TR><TD><b>contract end date:</b></TD><td><INPUT TYPE="text" NAME="conedt"   value="">(e.g:12-jan-2009)</td></TR>
<TR><TD><b>contract created by:</b></TD><td><INPUT TYPE="text" NAME="concrby" value=<%= le1 %>></td></TR>
<TR><TD><b>contract updated by:</b></TD><td><INPUT TYPE="text" NAME="conupby" value=<%= le1 %>></td></TR>
<TR><TD><b>contract created date:</b></td><td> <INPUT TYPE="text" NAME="concrdt" value="">(e.g:12-jan-2009)</td></TR>
<TR><TD><b>contract updated date:</b></TD><td><INPUT TYPE="text" NAME="conupdt">(e.g:12-jan-2009)</td></TR>
<TR><TD><INPUT TYPE="submit" value="sign&nbsp;contract"></td><TD><INPUT TYPE="reset" value="clear"></td></TR></table></center>
 </form>

<font color='yellow'><a href="http://localhost:8081/esp/index.html"><b>HOMEPAGE</b></a>
<br><a href="http://localhost:8081/esp/salesprivi.html"><b>YOUR PRIVILEGES</b></a></font>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type=submit value=BACK onClick="back()"></body></html>
<%
	rs.close();
  st.close();
  con.close();
  }catch(Exception e)
  {
  System.out.println(e);
  }
%>