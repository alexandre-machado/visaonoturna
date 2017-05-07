<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<%dim usuario,senha,msg
usuario=replace(request.form("usuario"),"'","''")
senha=replace(request.form("senha"),"'","''")
Select case request("ac")
	case 1
		application.lock 
		application("painel-usuarios") = replace(application("painel-usuarios"),chr(32) + session("painel_nick") + chr(44),"")
		application.unlock 
		Session.Abandon()
		response.Redirect(request("pag"))
End select

If Request.ServerVariables("REQUEST_METHOD")="POST" Then
	Set RF=Conn.Execute("SELECT tb_fotografo.* FROM tb_fotografo WHERE (((tb_fotografo.FOT_nick)='"&usuario&"') AND ((tb_fotografo.FOT_senha)='"&senha&"'));")
	IF NOT RF.EOF THEN
		session("painel_logado")="1"
		session("painel_nick")=RF("FOT_nick")
		session("painel_id_usu")=RF("FOT_id")
		session("painel_nivel")=cint(RF("FOT_nivel"))
		SET RSETH=Conn.execute("UPDATE tb_fotografo SET FOT_ultimaconex=now() WHERE FOT_id="&session("painel_id_usu")&";")
		application.lock 
		application("painel-usuarios") = application("painel-usuarios") + chr(32) + session("painel_nick") + ","
		application.unlock 
		response.Redirect("index.asp")
	ELSE
		response.Redirect("login.asp?ac-msg=1&msg=senha ou usuario errado")
	END IF
Else %>
	<html>
	<head>
	<title>Painel - login</title>
	<link href="estilo.css" rel="stylesheet" type="text/css">
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	</head>
	
	<body onLoad="javascript:form1.usuario.focus();">
	<!--#include file="msg.asp"-->
	<form name="form1" method="post" action="login.asp"><table class="table" align="center" cellpadding="0" cellspacing="0">
	  <tr>
		<td width="50%"><div align="right">usu&aacute;rio: </div></td>
		<td>
		  <input name="usuario" type="text" id="usuario">
		</td>
	  </tr>
	  <tr>
		<td width="50%"><div align="right">senha: </div></td>
		<td><input name="senha" type="password" id="senha"></td>
	  </tr>
	  <tr>
		<td colspan="2"><div align="center">
			<input type="submit" name="Submit" value="Enviar"> 
			<input type="reset" name="re" value="Redefinir">
		</div></td>
	  </tr>
	</table>
	</form>
	</body>
	</html>
<% End If %>