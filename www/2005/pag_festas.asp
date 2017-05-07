<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<html>
<head>
<!--#include file="inc_head.asp"-->
<link rel="stylesheet" type="text/css" media="all" href="../zpcal/themes/winxp.css" title="winxp" >
<script type="text/javascript" src="../zpcal/src/utils.js"></script>
<script type="text/javascript" src="../zpcal/src/calendar.js"></script>
<script type="text/javascript" src="../zpcal/lang/calendar-br.js"></script>
<script type="text/javascript" src="../zpcal/src/calendar-setup.js"></script>

<style type="text/css">
<!--
.style1 {
	color: #314D6B;
	font-weight: bold;
}
.style2 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10px;
	color: #666666;
}
.style3 {
	color: #FF9900;
	font-weight: bold;
	font-size: 14px;
}
a:link {
	color: #ffffff;
	text-decoration: none;
}
a:visited {
	color: #FFFFFF;
	text-decoration: none;
}
a:hover {
	color: #336666;
}
-->
</style>
</head>
<%' <!--#include file="menu_contexto.asp"--> %>
<body bgcolor="#000000" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
<div id="Layer1" style="position:absolute;  width: 100%; height: 100%;" align="center">
<table width="770" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><!--#include file="inc_topo.asp"--></td>
  </tr>
</table>
<table width="770" height="339" border="0" cellpadding="0" cellspacing="0" background="imagens/fundo_full.gif" bgcolor="#E8E8E8" class="viu">
  <tr>
	<td width="120" height="265" valign="top">
	<!--#include file="inc_menu.asp" --></td>
	<td width="650"  align="center" valign="top"><div align="left" class="style2"><br>
	</div>
	  <% ' #############conteudo do corpo inicio#############%>
	  <% dim data_var %>
	<% If request("date")="" Then %>
	  	<% data_var=data_1(now()) %>
	<% Else %>
		<% data_var=data_1(request("date")) %>
	<% End If %>
    <table width="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="74%" align="left" valign="top">
	<% If session("painel_logado")="1" Then %>
	<!--#include file="../painel/msg.asp"-->
	<% dim pag, c1
	c1 = data_var
	pag="http://www.visaonoturna.com/2005/pag_festas.asp?ac-msg=1&msg=registro%20incluido%20com%20sucesso!&date="& data_var %>
	<!--#include file="../painel/inc_agenda.asp"--><% End If %>
<div class="div-festa">
      <div align="center"><span class="style1">FESTAS DO DIA <%= data_var %></span></div>
      <br>
      <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
        <% Set RSFESTA = Conn.execute("SELECT tb_fotografo_1.FOT_nome AS nome, tb_fotografo.FOT_nome, tb_agenda.agn_id, tb_agenda.agn_id_fotografo, tb_agenda.agn_id_local, tb_local.LOC_nome, tb_agenda.agn_nome, tb_agenda.agn_data, tb_agenda.agn_info, tb_agenda.agn_hora, tb_agenda.agn_ingresso, tb_agenda.agn_consumacao, tb_cobertura.COB_id FROM tb_local RIGHT JOIN (tb_fotografo AS tb_fotografo_1 INNER JOIN ((tb_cobertura RIGHT JOIN tb_agenda ON (tb_cobertura.COB_data = tb_agenda.agn_data) AND (tb_cobertura.COB_id_local = tb_agenda.agn_id_local)) LEFT JOIN tb_fotografo ON tb_cobertura.COB_fotografo_id = tb_fotografo.FOT_id) ON tb_fotografo_1.FOT_id = tb_agenda.agn_id_fotografo) ON tb_local.LOC_id = tb_agenda.agn_id_local WHERE (((tb_agenda.agn_data)=#" & data_inv(data_var) & "#));") %>
		<% If RSFESTA.eof Then %>
		<tr>
          <td colspan="2" align="center" valign="top" class="style1"><strong>nenhuma festa marcada</strong></td>
        </tr>
		<% Else %>
<% Do while not RSFESTA.eof%>
		<tr>
          <td colspan="2"><br>
            <span class="style3">&radic;
            <% If session("painel_logado")="1" AND ((session("painel_nivel")>1) or (cint(session("painel_id_usu"))=cint(RSFESTA("agn_id_fotografo")))) Then %>
            <a style="color:#000000" href="../painel/editdb.asp?ac=6&id=<%= RSFESTA("agn_id") %>&date=<%= data_var %>"><img src="imagens/deleta.gif" width="17" height="17" border="0" align="absbottom"></a><% End If %><% If session("painel_logado")="1" Then %>(<%= RSFESTA("nome") %>)<% End If %>
            <%= ucase(RSFESTA("agn_nome")) %></span><br>
            <span class="style2"><%= replace(RSFESTA("agn_info"),chr(13),"<br>") %></span></td>
        </tr>
		<tr >
			<td width="11%">&nbsp;</td>
		    <td width="89%" class="style2"><strong>&bull;Local:</strong> <%= RSFESTA("LOC_nome") %></td>
		</tr>
		<% If RSFESTA("agn_hora")<>"" Then %>
		<tr >
			<td width="11%">&nbsp;</td>
		    <td width="89%" class="style2"><strong>&bull;Hora:</strong> <%= RSFESTA("agn_hora") %></td>
		</tr>
		<% End If %>
		<% If RSFESTA("agn_consumacao")<>"" Then %>
		<tr >
			<td width="11%">&nbsp;</td>
		    <td width="89%" class="style2"><strong>&bull;Consuma&ccedil;&atilde;o:</strong> <%= RSFESTA("agn_consumacao") %></td>
		</tr>
		<% End If %>
		<% If RSFESTA("agn_ingresso")<>"" Then %>
		<tr >
			<td width="11%">&nbsp;</td>
		    <td width="89%" class="style2"><strong>&bull;Ingresso:</strong> <%= RSFESTA("agn_ingresso") %></td>
		</tr>
		<% End If %>
			<% If RSFESTA("FOT_nome")<>"" Then %>
				<% Set RSNOMESFESTA = Conn.execute("SELECT tb_relacao_fot_cob.REL_id_cob, tb_fotografo.FOT_id, tb_fotografo.FOT_nome, tb_fotografo.FOT_nick FROM tb_fotografo RIGHT JOIN tb_relacao_fot_cob ON tb_fotografo.FOT_id = tb_relacao_fot_cob.REL_id_fotografo WHERE (((tb_relacao_fot_cob.REL_id_cob)=" & RSFESTA("COB_id") & "));") %>
		<tr >
			<td width="11%" align="center"><img src="imagens/maquina20x20.jpg" width="21" height="20"></td>
		    <td width="89%" valign="middle" class="style2"><strong>&bull;Fotografia de :</strong> <% Do While Not RSNOMESFESTA.EOF %><%= RSNOMESFESTA("FOT_nome") %><% RSNOMESFESTA.MoveNext %><% If RSNOMESFESTA.EOF Then %>.<% Else %>, <% End If %><% Loop %></td>
		</tr>
			<% End If %>
		<% RSFESTA.MoveNext %>
		<% Loop %>
<% End If %>
        <% Set RSFESTAPRO = Conn.execute("SELECT TOP 20 tb_fotografo_1.FOT_nome AS nome, tb_fotografo_1.FOT_id, tb_fotografo.FOT_nome, tb_agenda.agn_id, tb_local.LOC_nome, tb_agenda.agn_nome, tb_agenda.agn_data, tb_cobertura.COB_id FROM tb_local RIGHT JOIN (tb_fotografo AS tb_fotografo_1 INNER JOIN ((tb_cobertura RIGHT JOIN tb_agenda ON (tb_cobertura.COB_id_local = tb_agenda.agn_id_local) AND (tb_cobertura.COB_data = tb_agenda.agn_data)) LEFT JOIN tb_fotografo ON tb_cobertura.COB_fotografo_id = tb_fotografo.FOT_id) ON tb_fotografo_1.FOT_id = tb_agenda.agn_id_fotografo) ON tb_local.LOC_id = tb_agenda.agn_id_local WHERE (((tb_agenda.agn_data)>#" & data_inv(data_var) & "#)) ORDER BY tb_agenda.agn_data;") %>
		<tr>
		  <td height="50" colspan="2" align="center" valign="middle" class="style1">PR&Oacute;XIMAS FESTAS</td>
		</tr>
		<% Do while not RSFESTAPRO.eof%>
		<tr>
		  <td height="20" colspan="2" class="style1">&radic;
                <% If session("painel_logado")="1" AND ((session("painel_nivel")>1) or (cint(session("painel_id_usu"))=cint(RSFESTAPRO("FOT_id")))) Then %>
                <img src="imagens/deleta.gif" width="17" height="17" border="0" align="absbottom">
                <% End If %>
                <a style="color:#FF9900" href="pag_festas.asp?date=<%= data_1(RSFESTAPRO("agn_data")) %>">
				<% If session("painel_logado")="1" Then %>
              (<%= RSFESTAPRO("nome") %>)
              <% End If %>
              <%= ucase(data_2(RSFESTAPRO("agn_data"))&"|<u>"&RSFESTAPRO("LOC_nome")&"</u> - "&RSFESTAPRO("agn_nome")) %></a><% If RSFESTAPRO("FOT_nome")<>"" Then %>
              <img src="imagens/maquina20x20.jpg" width="21" height="20" align="absmiddle">
              <% End If %></td>
		</tr>
		<% RSFESTAPRO.MoveNext %>
		<% Loop %>
	</table>
      <br>
</div></td>
    <td width="26%" valign="top"><div align="center"><!--#include file="calendar.asp"--></div></td>
  </tr>
</table>
<% ' #############conteudo do corpo fim  #############%>  </td>
  </tr>
 </table>
<!--#include file="inc_rodape.asp" -->
</div>
</body>
</html>
