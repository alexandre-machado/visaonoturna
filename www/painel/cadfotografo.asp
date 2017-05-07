<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<html>
<head>
<title>Painel - inicio</title>
<meta http-equiv="Content-Language" content="pt-br">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252"><script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<link href="estilo.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style2 {
	font-size: 10px;
	color: #666666;
}
-->
</style>
</head>
<body>
<!--#include file="menu.asp"-->
<%dim d,e
	d=cdate(FormatDateTime (now(),2))-1
	e=d+14
%>
	<%Set RF=Conn.Execute("SELECT tb_fotografo.FOT_id, tb_fotografo.FOT_nome, tb_fotografo.FOT_nick, tb_fotografo.FOT_ultimaconex FROM tb_fotografo;")%>
	<% dim val(10), action %>
<% select case request("ac") %>
	<% case "1" %>
		<%Set RFE=Conn.Execute("SELECT tb_fotografo.FOT_id, tb_fotografo.FOT_nome, tb_fotografo.FOT_nick, tb_fotografo.FOT_email, tb_fotografo.FOT_info, tb_fotografo.FOT_info2, tb_fotografo.FOT_ativo, tb_fotografo.FOT_senha, tb_fotografo.FOT_nivel FROM tb_fotografo WHERE (((tb_fotografo.FOT_id)="&request("FOT_id")&"));")%>
		<% val(1)=RFE("FOT_nome") %>
		<% val(2)=RFE("FOT_nick") %>
		<% val(3)=RFE("FOT_email") %>
		<% val(4)=RFE("FOT_info") %>
		<% val(5)=RFE("FOT_ativo") %>
		<% val(6)=RFE("FOT_senha") %>
		<% val(7)=RFE("FOT_nivel") %>
		<% val(8)=RFE("FOT_info2") %>
		<% action="editdb.asp?ac=4&FOT_id="&request("FOT_id") %>
	<% case else %>
		<% action="editdb.asp?ac=3" %>
<% End select %>	
<form name="form1" method="post" action="<%= action %>">
<table width="100%" align="center" class="table">
  <tr>
    <td width="99" rowspan="4" align="center" valign="top"><img src="" alt=""></td>
    <td width="99"><div align="right">nome:</div></td>
    <td><input name="FOT_nome" type="text" class="form100" id="FOT_nome" value="<%= val(1) %>"></td>
  </tr>
  <tr>
    <td width="99"><div align="right">nick:</div></td>
    <td><input name="FOT_nick" type="text" class="form100" id="FOT_nick" value="<%= val(2) %>"></td>
  </tr>
  <tr>
    <td width="99"><div align="right">email:</div></td>
    <td><input name="FOT_email" type="text" class="form100" id="FOT_email" value="<%= val(3) %>"></td>
  </tr>
  <tr>
    <td width="99"><div align="right">informa&ccedil;&otilde;es:</div></td>
    <td><textarea name="FOT_info" rows="6" class="form100" id="FOT_info"><%= val(4) %></textarea></td>
  </tr>
  <tr>
    <td colspan="2"><div align="right">Obs.:</div></td>
    <td><textarea name="FOT_info2" rows="6" class="form100" id="FOT_info2"><%= val(8) %></textarea></td>
  </tr>
  <tr>
    <td colspan="2"><div align="right">nivel:</div></td>
    <td><select name="FOT_nivel" class="form" id="FOT_nivel">
      <option value="1"<% If val(7)=1 Then %> selected<% End If %>>nivel 1</option>
      <option value="2"<% If val(7)=2 Then %> selected<% End If %>>nivel 2</option>
    </select>    </td>
  </tr>
  <tr>
    <td width="200" colspan="2"><div align="right">ativo:</div></td>
    <td><input name="FOT_ativo" type="checkbox" id="FOT_ativo" value="checkbox"<%if val(5)=true Then%> checked<% End If %> ></td>
    </tr>
  <tr>
    <td width="200" colspan="2"><div align="right">senha:</div></td>
    <td><input name="FOT_senha" type="password" class="form100" id="FOT_senha" value="<%= val(6) %>"></td>
  </tr>
  <tr>
    <td colspan="3"><div align="center">
      <input name="Submit" type="submit" class="form" value="envia">
      <input name="cancela" type="button" class="form" id="cancela" value="cancela">
    </div></td>
    </tr>
</table>
</form>
<table width="100%" align="center" class="table">
  <tr>
    <td>fotografos:</td>
  </tr>
  <% do while not RF.eof %>
  <tr>
    <td><a href="cadfotografo.asp?ac=1&FOT_id=<%=RF("FOT_id")%>"><img src="../2005/imagens/edita.gif" width="17" height="17" border="0" align="middle"></a> <%= RF("FOT_nick") %>(<%= RF("FOT_nome") %>)<span class="style2">-<%= RF("FOT_ultimaconex") %></span></td>
  </tr>
  <% RF.MoveNext %>
  <% LOOP %>
</table>
</body>
</html>
