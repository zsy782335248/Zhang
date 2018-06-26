<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css">
a:link {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
a {
	font-weight: bold;
}
h2 {
	color: #c33;
}
#xinxi {
	color: #c33;
}
#biankuang {
	border-bottom-width: 2px;
	border-bottom-style: dashed;
	border-bottom-color: #F90;
}
#ziti {
	font-size: 18px;
	color: #C33;
}
#biankuang1 {
	border-top-width: 2px;
	border-top-style: dashed;
	border-top-color: #F90;
}
</style>
</head>

<body>
<table width="960" border="0" align="center">
  <tr>
    <td><img src="../img/2.jpg" width="1330" height="128" /></td>
  <tr>
    <td align="right"  background="../img/3.jpg" ><a href="../主界面.asp" id="xinxi">返回</a></td>
  </tr>
</table>
<table width="1330" border="0" align="center" cellspacing="0">
  <tr>
    <td height="73"  background="../img/4.jpg"><h2 align="center" id="xinxi">学生信息</a></h2>      </td>
  </tr>
</table>


<%
If Not Isempty(Request("delete")) Then
  id=Request.Form("id")
  sqlstr="delete from student where Cid="&id&""
  conn.Execute(sqlstr)
  sqlstr="delete from student where id="&id&""
  conn.Execute(sqlstr)
  Response.Redirect("xuesheng.asp")
End If
%>

<link rel="stylesheet" href="css/css.css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
-->
</style>
<bodys>
<table width="900"  border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td height="1"><img src="images/xian.gif" width="366" height="1"></td>
  </tr>
</table>
<table width="1330" border="0" align="center" cellpadding="0" cellspacing="2"  background="../img/4.jpg" id="biankuang1">
  <form name="form1" method="get" action="">
<tr>
<td height="22">
</td>
</tr>
    <tr>

      <td height="22" align="right"><div align="right">学号： </div></td>
      <td height="22" colspan="2"><div align="left">
        <input name="txt_xuehao" type="text" class="textbox" id="txt_xuehao" size="15">
      </div></td>
    </tr>
    <tr>
      <td height="22" align="right"><div align="right">学生姓名：</div></td>
      <td height="22" colspan="2"><div align="left">
        <input name="txt_author" type="text" class="textbox" id="txt_author" size="12">      
      </div></td>
    </tr>
      <tr>
      <td><div align="center"></div></td>
      <td height="22"><input name="query" type="submit" class="button" id="query" value="查 询"></td>
    </tr>
    <tr>
<td height="22">
</td>
</tr>
    <tr>

  </form>
</table>
<table width="1330" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#FF6600" >
  <tr align="center">
    <th width="86" bgcolor="#FFFFFF">学号</th>
    <th width="77" height="22" bgcolor="#FFFFFF">姓名</th>
    <th width="100" height="22" bgcolor="#FFFFFF">毕业题目</th>
     <th width="91" height="22" bgcolor="#FFFFFF">成绩</th>
    <th width="146" height="22" bgcolor="#FFFFFF">电话</th>
    
  </tr>
  <%
txt_xuehao=Request("txt_xuehao")
txt_title=Request("txt_title")
txt_author=Request("txt_author")
txt_chengji=Request("txt_chengji")
txt_dianhua=Request("txt_dianhua")
Set rs=Server.CreateObject("ADODB.Recordset")
sqlstr="select * from student where 1=1"
If txt_xuehao<>"" Then sqlstr=sqlstr&" and sxuehao like '%"&txt_xuehao&"%'"
If txt_title<>"" Then sqlstr=sqlstr&" and stitle like '%"&txt_title&"%'"
If txt_author<>"" Then sqlstr=sqlstr&" and sxingming like '%"&txt_author&"%'"
If txt_chengji<>"" Then sqlstr=sqlstr&" and schengji like '%"&txt_chengji&"%'"
If txt_dianhua<>"" Then sqlstr=sqlstr&" and sdianhua like '%"&txt_dianhua&"%'"
sqlstr=sqlstr&" order by id"
rs.open sqlstr,conn,1,1
If Not (rs.eof and rs.bof) Then
	rs.pagesize=7  '定义每页显示的记录数
	pages=clng(Request("pages"))  '获得当前页数
	If pages<1 Then pages=1
	If pages>rs.recordcount Then pages=rs.recordcount
	showpage rs,pages  '执行分页子程序showpage		
	Sub showpage(rs,pages)  '分页子程序showpage(rs,pages)
	rs.absolutepage=pages   '指定指针所在的当前位置
	For i=1 to rs.pagesize  '循环显示记录集中的记录
%>
  <form name="form1" method="post" action="">
    <tr align="center">
      <td align="center" bgcolor="#FFFFFF"><%Set rsc=conn.Execute("select sxuehao from student where id="&rs("sxuehao")&"")
	  Response.Write(rsc("sxuehao"))
	  Set rsc=Nothing
	%></td>
      <td height="22" align="center" bgcolor="#FFFFFF"><%=rs("sxingming")%></td>
      <td height="22" align="left" bgcolor="#FFFFFF"><%=Left(rs("stitle"),15)%></td>
       <td height="22" align="left" bgcolor="#FFFFFF"><%=Left(rs("schengji"),15)%></td>
      <td height="22" bgcolor="#FFFFFF"><%=Left(rs("sdianhua"),15)%></td>
    </tr>
  </form>
  <%
  rs.movenext  '指针向下移动
  If rs.eof Then exit for
  Next
  End Sub
End If
%>
  <tr align="center">
    <form name="form" action="?" method="get">
      <td height="22" colspan="5" bgcolor="#FFFFFF"><%	
	if pages<>1 then
		response.Write("&nbsp;&nbsp;<a href="&path&"?pages=1&txt_class="&txt_class&"&txt_title="&txt_title&"&txt_author="&txt_author&">首页</a>")
		response.Write("&nbsp;&nbsp;<a href="&path&"?pages="&(pages-1)&"&txt_class="&txt_class&"&txt_title="&txt_title&"&txt_author="&txt_author&">上一页</a>")
	end if 
	response.Write("&nbsp;&nbsp;当前 <font color='#FF0000'>"&pages&"/"&rs.pagecount&"</font> 页")
	if pages<>rs.pagecount then
		response.Write("&nbsp;&nbsp;<a href="&path&"?pages="&(pages+1)&"&txt_class="&txt_class&"&txt_title="&txt_title&"&txt_author="&txt_author&">下一页</a>")
		response.Write("&nbsp;&nbsp;<a href="&path&"?pages="&rs.pagecount&"&txt_class="&txt_class&"&txt_title="&txt_title&"&txt_author="&txt_author&">末页</a>")
	end if
    rs.close
    Set rs=Nothing
   %>
      </td>
    </form>
  </tr>
</table>
</body>
</html>



</body>
</html>
