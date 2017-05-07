<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<html>
<head>
<title>Painel - incluir</title>
<link href="estilo.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
		<link rel="stylesheet" type="text/css" media="all" href="../zpcal/themes/winxp.css" title="winxp" >
		<script type="text/javascript" src="../zpcal/src/utils.js"></script>
		<script type="text/javascript" src="../zpcal/src/calendar.js"></script>
		<script type="text/javascript" src="../zpcal/lang/calendar-br.js"></script>
		<script type="text/javascript" src="../zpcal/src/calendar-setup.js"></script>
</head>
<body>
<!--#include file="menu.asp"-->
	<%Set RL=Conn.Execute("SELECT tb_local.LOC_id, tb_local.LOC_nome FROM tb_local;")%>
	<%Set RC=Conn.Execute("SELECT tb_cat_cob.* FROM tb_cat_cob ORDER BY tb_cat_cob.CAC_nome;")%>
	<%Set RF=Conn.Execute("SELECT tb_fotografo.FOT_id, tb_fotografo.FOT_nome, tb_fotografo.FOT_nick FROM tb_fotografo WHERE (((tb_fotografo.FOT_ativo)=Yes));")%>
<form name="form1" method="post" action="editdb.asp?ac=0">
<table class="table" width="100%" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%"><div align="right">dia:</div></td>
    <td>
      <input class="form" name="datacal" type="text" id="datacal"> 
      <input class="form" name="bt" type="button" id="cal" value=" ... " onclick="alert('click');"> 
    </td>
  </tr>
  <tr>
    <td width="50%"><div align="right">nome da festa:</div></td>
    <td><input class="form" name="COB_nome_festa" type="text" size="50"></td>
  </tr>
  <tr>
    <td width="50%"><div align="right">local da festa:</div></td>
    <td>	<select name="COB_id_local" class="form">
	  <option selected >selecione</option><% Do while not RL.EOF %>
	  <option value="<%= RL("LOC_id") %>"><%= RL("LOC_nome") %></option><% RL.MoveNext %><% Loop %>
    </select></td>
  </tr>
    <tr>
      <td><div align="right">categoria: </div></td>
      <td><select class="form" name="cat_cob">
        <option selected >selecione</option>
        <% Do while not RC.EOF %>
        <option value="<%= RC("CAC_id") %>"><%= RC("CAC_nome") %></option>
        <% RC.MoveNext %>
        <% Loop %>
      </select></td>
    </tr>
    <tr>
    <td width="50%"><div align="right">fotografos:</div></td>
    <td><% Do while Not RF.EOF %>
	<input type="checkbox" name="CAD_FOT" value="<%= RF("FOT_id") %>" id="<%= RF("FOT_id") %>"><label for="<%= RF("FOT_id") %>"><%= RF("FOT_nick") %>(<%= RF("FOT_nome") %>)</label><Br>
	<% RF.MOVENEXT %><% LOOP %>
	</td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <input type="submit" name="Submit" value="Enviar">
      <input type="reset" name="Submit2" value="Redefinir">
    </div></td>
    </tr>
</table>
</form>
</body>
<script type="text/javascript">
	<!--  to hide script contents from old browsers
	Zapatec.Calendar.setup({
		inputField     :    "datacal",     // id of the input field
		ifFormat       :    "%d/%m/%Y",     // format of the input field
		showsTime      :     false,
		button         :    "cal",  // trigger button (well, IMG in our case)
		align          :    "BC"           // alignment (defaults to "Bl")
	});
	// end hiding contents from old browsers  -->
</script>
</html>
<% Conn.Close
Set Conn = Nothing
 %>
