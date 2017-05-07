<%
Set Conn = Server.CreateObject("ADODB.Connection")
'dim dsn
'dsn="profider=msdasql;"
'dsn=dsn & "Driver={Microsoft Access Driver (*.mdb)};"
'dsn=dsn & "DBQ=D:\visaonoturna\www\dados\banco_2005.mdb;"
'Conn.Open dsn
'Conn.Open "DBQ=" & Server.MapPath("..\..\dados\banco_2005.mdb") & ";Driver={Microsoft Access Driver (*.mdb)};" 
Conn.Open "DBQ=d:\visaonoturna\www\dados\banco_2005.mdb" & ";Driver={Microsoft Access Driver (*.mdb)}" 
%>