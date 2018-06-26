<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<%
if not isempty(request("edit")) then
 id=request.Form("id")
  str1=trim(request.Form("学号"))
  str2=trim(request.Form("姓名"))
    str3=trim(request.Form("毕业题目"))
	  str4=trim(request.Form("成绩"))
if str1<>"" and str2<>"" and str3<>"" and str4<>"" then
 set rs=server.CreateObject("adodb.recordset")
 sqlstr="select * from student where id="&id&""
 rs.open sqlstr,conn,1,3
 rs("sxuehao")=str1
 rs("sxingming")=str2
 rs("stitle")=str3
 rs("schengji")=str4
 rs.update
 rs.close
response.Write("<script>alert('修改成功');window.close();window.opener.location.reload();</script>")
else
 response.Write("<script>alert('您填写的信息不完整');history.back();</script>")
 end if
 end if 
 %>

  
  
  
<style type="text/css">
#biankuang {
	border-bottom-width: 2px;
	border-bottom-style: dashed;
	border-bottom-color: #f90;
}
#ziti {
	color: #c33;
}
</style>
</head>

<body><table width="1330" border="0" background="">
  <tr>
    <td><img src="../img/2.jpg" width="1330" height="128" /></td>
  </tr>
  <tr>
    <td><img src="../img/3.jpg" width="1330" height="31" /></td>
  </tr>
</table>

<table width="1330" border="0" height="100" background="../img/4.jpg">
  <tr>
    <td id="biankuang"><div align="center">
      <h2 id="ziti">请修改您需要修改的信息</h2>
    </div></td>
  </tr>
</table>

<table width="600" align="center" height="290">
<tr>
<td align="center">

<%
id=request.QueryString("id")
sqlstr="select * from student where id="&id&""
set rs=conn.execute(sqlstr)
%>
<form action="" method="post" name="form2" id="form2">
<h4>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;学号:
  <input name="学号" type="text" class="textbox" id="学号" value="<%=rs("sxuehao")%>" />
</h4>
<h4>
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;姓名: 
    <input name="姓名" type="text" class="textbox" id="姓名" value="<%=rs("sxingming")%>" />
</h4>
<h4>
  
  毕业题目: 
  <input name="毕业题目" type="text" class="textbox" id="毕业题目" value="<%=rs("stitle")%>" />
</h4>
<h4>
  &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;成绩: 
  <input name="成绩" type="text" class="textbox" id="成绩" value="<%=rs("schengji")%>" />
</h4>
<p>
<input name="id" type="hidden" id="id" value="<%=rs("id")%>">
                      <input name="edit" type="submit" id="edit" value="修 改" class="button" onclick="return Mycheck(this.form)">
  <input type="button" name="submit22" value="返回" class="button" onclick="javascript:window.location.href='guanli.asp'" />
  </form>
  <%
  rs.close
  set rs=nothing
  %>
</td>
</tr>
</table>
<p>
<p>


<table width="1330" border="0" height="54" background="../img/4.jpg" align="center">
  <tr>
    <td height="50" id="biankuang"><div align="center">
      <h5>&版权属于1601班</h5>
    </div></td>
  </tr>
</table>
</body>
</html>
