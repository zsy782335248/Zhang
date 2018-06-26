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
    <td align="center"  background="../img/3.jpg" ><a href="../主界面.asp" id="xinxi">返回</a></td>
  </tr>
</table>
<table width="1330" border="0" align="center" cellspacing="2" id="biankuang">
  <tr>
    <td width="665"  background="../img/4.jpg"><div align="center">
      <h2><a href="学生信息.asp" id="xinxi">学生信息</a></h2>
    </div></td>
    <td width="665" background="../img/4.jpg"><div align="center">
      <h2><a href="教师信息.asp" id="xinxi">教师信息</a></h2>
    </div></td>
  </tr>
</table>
<p>

<table width="1330" border="0">
  <tr>
    <td><div align="center" id="ziti">您现在所属界面为教师信息！</div></td>
  </tr>
</table>
<p>

<%
If Not Isempty(Request("delete")) Then
  id=Request.Form("id")
  sqlstr="delete from teacher where id="&id&""
  conn.Execute(sqlstr)
  sqlstr="delete from teacher where id="&id&""
  conn.Execute(sqlstr)
  Response.Redirect("jiaoshi.asp")
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
<td width="594" height="22">
</td>
</tr>
    <tr>

      <td height="22" align="right"><div align="right">编号： </div></td>
      <td width="731" height="22" colspan="2"><div align="left">
        <input name="txt_bianhao" type="text" class="textbox" id="txt_bianhao" size="15">
      </div></td>
    </tr>
    <tr>
      <td height="22" align="right"><div align="right">教师姓名：</div></td>
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
    <th width="86" bgcolor="#FFFFFF">编号</th>
    <th width="77" height="22" bgcolor="#FFFFFF">姓名</th>
    <th width="191" height="22" bgcolor="#FFFFFF">教师所出毕业题目</th>
    <th width="146" height="22" bgcolor="#FFFFFF">操 作</th>
  </tr>
  <%
txt_bianhao=Request("txt_bianhao")
txt_title=Request("txt_title")
txt_author=Request("txt_author")
Set rs=Server.CreateObject("ADODB.Recordset")
sqlstr="select * from teacher where 1=1"
If txt_bianhao<>"" Then sqlstr=sqlstr&" and tbianhao like '%"&txt_bianhao&"%'"
If txt_title<>"" Then sqlstr=sqlstr&" and ttitle like '%"&txt_title&"%'"
If txt_author<>"" Then sqlstr=sqlstr&" and txingming like '%"&txt_author&"%'"
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
      <td align="center" bgcolor="#FFFFFF"><%Set rsc=conn.Execute("select tbianhao from teacher where id="&rs("tbianhao")&"")
	  Response.Write(rsc("tbianhao"))
	  Set rsc=Nothing
	%></td>
      <td height="22" align="center" bgcolor="#FFFFFF"><%=rs("txingming")%></td>
      <td height="22" align="left" bgcolor="#FFFFFF"><%=Left(rs("ttitle"),15)%></td>
      <td height="22" bgcolor="#FFFFFF"><input name="id" type="hidden" id="id" value="<%=rs("id")%>">
          <a href="xiugai.asp?id=<%=rs("id")%>&action=view">修改</a> 
        <input name="delete" type="submit" id="delete" value="删除" onclick="return confirm('确定要删除吗?')" class="button"></td>
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
      <td height="22" colspan="4" bgcolor="#FFFFFF"><%	
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