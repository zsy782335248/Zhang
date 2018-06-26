<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>毕业设计管理系统</title>
<style type="text/css">
a {
	font-size: 16px;
	color: #C69;
}
a:link {
	text-decoration: none;
	color: #C33;
}
a:visited {
	text-decoration: none;
	color: #06F;
}
a:hover {
	text-decoration: none;
	color: #C69;
}
a:active {
	text-decoration: none;
}
body,td,th {
	font-size: 18px;
}
#biankuang {
	border-bottom-style: dashed;
	border-bottom-color: #Fc6;
}
</style>
</head>

<body>
<table width="1330" border="0"  align="left">
  <tr>
    <td><img src="2.jpg" width="1330" height="128" /></td>
  </tr>
  <tr>
    <td background="img/3.jpg" width="1330" height="32" align="right">
		<div id="MyTime"></div>
	  <script language="javascript">
			var arr_week=new Array("星期日","星期一","星期二","星期三","星期四","星期五","星期六");		
			var today=new Date();
			var year=today.getFullYear();
			var month=today.getMonth()+1;
			var day=today.getDate();
			var week=today.getDay();
			var str;
			str=year+"年"+month+"月"+day+"日    "+arr_week[week];
			document.write(str);		
		</script>
	</td>
  </tr>
</table>
</table>


<table width="399" height="179" border="1" align="left">
  <tr>
    <td width="374" background="img/4.jpg"><div align="center">
      <h2><strong>请选择登陆身份</strong></h2>
    </div></td>
  </tr>
  <tr>
    <td bgcolor="#FFFFFF"><h3 align="center"><li type="disc"><a href="登录/login.asp">学生</a></li>
    </h3></td>
  </tr>
  <tr>
    <td><h3 align="center"><li type="disc"><a href="登录/login1.asp">教师</a></li>
    </h3></td>
  </tr>
  <tr>
    <td><h3 align="center"><li type="disc"><a href="登录/login3.asp">管理员</a></li>
    </h3></td>
  </tr>
  </table>
  <table width="931" border="0" height="320"  background="img/4.jpg" align="left">
  <tr>
    <td><marquee behavior="scroll"><a href="图片链接1.asp"><img src="img/5_副本.jpg" /></a></marquee></td>
    <td><marquee behavior="scroll"><a href="图片链接2.asp"><img src="img/6.jpg" /></a></marquee></td>
    <td><marquee behavior="scroll"><a href="图片链接3.asp"><img src="img/7.jpg" /></a></marquee></td>
  </tr>
</table>
<table width="1330" border="0" height="269" >
  <tr>
    <td><table width="444" border="0" height="269">
      <tr>
        <td background="img/4.jpg"><div align="center">
          <h3>新闻公告</h3>
        </div></td>
      </tr>
      <tr>
        <td><a href="新闻1.asp"><li type="disc">关于做好2018届本科毕业设计（论文）后期工作的通知</li></a></td>
      </tr>
      <tr>
        <td><a href="新闻2.asp">
        <li type="disc">关于做好2018届本科毕业设计（论文）中期检查工作的通知</li></a></td>
      </tr>
      <tr>
        <td><a href="新闻3.asp">
        <li type="disc">关于做好2018届本科生毕业设计(论文)工作的通知</li></a></td>
      </tr>
      <tr>
        <td></td>
      </tr>
    </table></td>
    <td><table width="444" border="0" height="269">
      <tr>
        <td background="img/4.jpg"><div align="center">
          <h3>优秀教师</h3>
        </div></td>
      </tr>
      <tr>
        <td align="center"><a href="林晓红.asp"><li type="disc">林晓虹</li></a></td>
      </tr>
      <tr>
        <td align="center"><a href="唐莉莉.asp"><li type="disc">唐莉莉</li></a></td>
      </tr>
      <tr>
        <td align="center"><a href="杨香霞.asp"><li type="disc">杨香霞</li></a></td>
      </tr>
      <tr>
        <td align="center"><a href="米粟栗.asp"><li type="disc">米粟栗</li></a></td>
      </tr>
    </table></td>
    <td><table width="444" border="0" height="269">
      <tr>
        <td background="img/4.jpg"><h3 align="center">论文模板和要求</h3></td>
      </tr>
      <tr>
        <td><a href="文档/实验报告电子模板.doc"><li type="disc">网络服务器配置论文模板</li></a></td>
      </tr>
      <tr>
        <td><a href="文档/《ASP.net程序设计》改革方案.docx"><li type="disc">ASP.NET结课要求</li></a></td>
      </tr>
      <tr>
        <td><a href="文档/《JAVA程序设计》课程考查方案.doc"><li type="disc">JAVA结课要求</li></a></td>
      </tr>
      <tr>
        <td><a href="文档/图书管理系统论文付庄园.doc"><li type="disc">C#语言论文模板</li></a></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="1330" border="0" height="54" background="img/4.jpg" align="center">
  <tr>
    <td height="50" id="biankuang"><div align="center">
      <h5>&版权属于1601班</h5>
    </div></td>
  </tr>
</table>


</body>
</html>
