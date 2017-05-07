<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->

<html>
<head>
<link href="estilo.css" rel="stylesheet" type="text/css">
<title>Painel - perfil</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language=javascript>
	<!--
	function validar(form) {
		xf=document.formulario
		if (xf.nick.value==""){
			alert("o nick eh obrigatório");
			formulario.nick.focus();
			return false;
		}
		else{
			if (xf.nome.value==""){
				alert("o nome eh obrigatório!");
				formulario.coment.focus();
				return false;
			}
			else{
				if ((xf.senha.value!="")||(xf.senha2.value!="")){
					if (xf.senha.value!=xf.senha2.value){
						alert("as senhas não coincidem!");
						formulario.senha.focus();
						return false;
					}
				}
				else return true;
			}
		}
	}
	
	// -->
</script>
</head>

<body><!--#include file="menu.asp"-->
<% If Request.ServerVariables("REQUEST_METHOD")="POST" Then
	dim senha
		IF Request("senha")="" THEN
			senha=""
		ELSE
			senha=", FOT_senha='"&Request("senha")&"'"
		END IF
	Set RS=Conn.Execute("UPDATE tb_fotografo SET FOT_nick='"&Request("nick")&"', FOT_info='"&Request("info")&"', FOT_email='"&Request("email")&"', FOT_nome='"&Request("nome")&"'"&senha&" WHERE FOT_id="&session("painel_id_usu")&";")
		session("painel_nick")=Request("nick")
		response.Redirect("perfil.asp")
Else 
Set RP=Conn.Execute("SELECT tb_fotografo.* FROM tb_fotografo WHERE (((tb_fotografo.FOT_id)="&session("painel_id_usu")&"));")%>
<form name="formulario" method="post" action="perfil.asp">
<table width="100%" align="center" class="table">
  <tr>
    <td width="128" rowspan="4" align="center" valign="top"><img src="../imagems/okt/<%= RP("FOT_end_foto") %>" width="128" height="160"></td>
    <td width="141"><div align="right">nome: </div></td>
    <td>
      <input name="nome" type="text" class="form100" id="nome" value="<%= RP("FOT_nome") %>" size="30">    </td>
  </tr>
  <tr>
    <td><div align="right">nick: </div></td>
    <td><input name="nick" type="text" class="form100" id="nick3" value="<%= RP("FOT_nick") %>" size="30"></td>
  </tr>
  <tr>
    <td><div align="right">email: </div></td>
    <td><input name="email" type="text" class="form100" id="nick" value="<%= RP("FOT_email") %>" size="30"></td>
  </tr>
  <tr>
    <td><div align="right">informa&ccedil;&otilde;es: </div></td>
    <td><textarea class="form100" name="info" cols="30" rows="5"><%= RP("FOT_info") %></textarea></td>
  </tr>
  <tr>
    <td colspan="2"><div align="right">senha: </div></td>
    <td><input class="form" name="senha" type="password" id="senha"></td>
  </tr>
  <tr>
    <td colspan="2"><div align="right">confirma senha: </div></td>
    <td><input class="form" name="senha2" type="password" id="senha2"></td>
  </tr>
  <tr>
    <td colspan="2"><div align="right"></div></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="3"><div align="center">
      <input class="form" type="submit" name="Submit" value="Enviar" onClick="return validar(this)">
      <input class="form" type="reset" name="Submit2" value="Redefinir">
    </div></td>
    </tr>
</table>
</form>
</body>
</html>
<% 
END IF
Conn.Close
Set Conn = Nothing
 %>