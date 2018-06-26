<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<%
if request.from("xuehao1")<>"" then
 sql="update student set sxuehao='"&request.from("xuehao1")&_"' where xingming='"&session("sxingming")&"'"
 rs.open sql,conn 
 set rs=nothing
 response.Write("<script language='javascript'>alert('修改成功'); opener.location.reload();window.close();</script>")
 end if
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link rel="stylesheet" href="css/css.css">
<script language="javascript">
function Mycheck(form){
  for(i=0;i<form.length;i++){
    if(form.elements[i].value==""){
	  alert(form.elements[i].name + "不能为空!");return false;}	
  }
}
</script>
</head>
<body>
<table width="960"  border="0" align="center" cellpadding="0" cellspacing="0">
             
              <tr>
                <td height="1"><img src="images/xian.gif" width="366" height="1"></td>
              </tr>
</table>
            <table width="960" border="0" align="center" cellpadding="0" cellspacing="2">
              <tr align="center">
                <td height="22">学号</td>
                 <td height="22">姓名</td>
                  <td height="22">毕业题目</td>
                  <td height="22">成绩</td>
                <td height="22">操 作</td>
              </tr>
              <%
Set rs=Server.CreateObject("ADODB.Recordset")
sqlstr="select * from student "
rs.open sqlstr,conn,1,3
while not rs.eof
%>
              <form name="form2<%=rs("id")%>" method="post" action="">
                <tr align="center">
                <td height="22"><input name="类别名称" type="text" id="类别名称" value="<%=rs("sxuehao")%>" class="textbox"></td>
                  <td height="22"><input name="类别名称" type="text" id="类别名称" value="<%=rs("sxingming")%>" class="textbox"></td>
                  <td height="22"><input name="类别名称" type="text" id="类别名称" value="<%=rs("stitle")%>" class="textbox"></td>
                  <td height="22"><input name="类别名称" type="text" id="类别名称" value="<%=rs("schengji")%>" class="textbox"></td>
                  <td height="22"><input name="id" type="hidden" id="id" value="<%=rs("id")%>">
                      <input name="edit" type="submit" id="edit" value="修 改" class="button" onclick="return Mycheck(this.form)">
&nbsp;
             
                </tr>
              </form>
              <%
rs.movenext
wend
rs.close
set rs=nothing
%>
</table>
            <table width="90%" border="0" align="center" cellpadding="2" cellspacing="0">
              <form name="form1" method="post" action="">               
                <tr>
                  <td width="106" height="22" align="right">类别名称：</td>
                  <td width="261" height="22"><input name="类别名称" type="text" id="类别名称3" class="textbox"></td>
                  <td width="133" height="22"><input name="add" type="submit" id="add" value="添 加" class="button" onclick="return Mycheck(this.form)"></td>
                </tr>
              </form>
</table>
</body>
