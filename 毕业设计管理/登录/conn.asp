<%
dim SQL_Injdata 
SQL_Injdata = "'|;|and|exec|insert|select|delete|update|count|*|%|chr|mid|master|truncate|char|declare" 
SQL_inj = split(SQL_Injdata,"|") 
If Request.QueryString<>"" Then 
  For Each SQL_Get In Request.QueryString 
    For SQL_Data=0 To Ubound(SQL_inj) 
      if instr(Request.QueryString(SQL_Get),Sql_Inj(Sql_Data))>0 Then 
        Response.Redirect("index.asp")
      end if 
    next 
  Next 
End If



Dim conn,connstr
Set conn=Server.CreateObject("ADODB.Connection")
connstr="biye"
conn.open connstr

function str_filter(instring)
newstr=replace(instring,"'","''")
newstr=replace(newstr,"<","&lt")
newstr=replace(newstr,">","&gt")
newstr=replace(newstr,"chr(60)","&lt;")
newstr=replace(newstr,"chr(37)","&gt;")
newstr=replace(newstr,"""","&quot")
newstr=replace(newstr,";",";;")
newstr=replace(newstr,"--","-")
newstr=replace(newstr,"/*"," ")
newstr=replace(newstr,"%"," ")
str_filter=newstr
end function

Function randStr(num)
  strings="0,1,2,3,4,5,6,7,8,9,A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"
  str=split(strings,",")
  for i=1 to num
  Randomize
  str1=str(int((ubound(str))*rnd))
  returnstr=returnstr&str1
  next
  randStr=returnstr
End Function





%>
