<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<% 
	IF IsNumeric(Request("id"))=false THEN
		'Response.Redirect("index.asp")
		Response.Write("entrada de dado errada")
	END IF
dim id
id=request("id")
 %>
<% session("player_in")="0"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<title>:...: visaonoturna.com :...:</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_displayStatusMsg(msgStr) { //v1.0
  status=msgStr;
  document.MM_returnValue = true;
}
//-->
</script>
</head>

<frameset rows="*" cols="*,165" framespacing="0" frameborder="NO" border="0" onLoad="MM_displayStatusMsg('visaonoturna');return document.MM_returnValue">
  <frame src="pop_up_foto.asp?id=<%=id %>" name="foto" scrolling="no" noresize>
  <frame src="pop_up_lista.asp?id=<%=id %>" name="lista" scrolling="auto" noresize>
</frameset>
<noframes><body >

</body></noframes>
</html>
