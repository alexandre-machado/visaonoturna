<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<html>
<head>
<!--#include file="inc_head.asp"-->
</head>
<%' <!--#include file="menu_contexto.asp"--> %>
<body bgcolor="#000000" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
<div id="Layer1" style="position:absolute;  width: 100%; height: 100%;" align="center">
<table width="770" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><!--#include file="inc_topo.asp"--></td>
  </tr>
</table>
<table width="770" border="0" cellpadding="0" cellspacing="0" background="imagens/fundo_full.gif" bgcolor="#E8E8E8" class="viu">
  <tr>
    <td width="120" height="265" valign="top">
	<!--#include file="inc_menu.asp" --></td>
    <td width="650"  align="center" valign="top"><br>
<% ' #############conteudo do corpo inicio#############%>
      <table  width="466" align="center" cellpadding="0" cellspacing="0">
<%' dim
Set RC=Conn.Execute("SELECT tb_cobertura.COB_ativo, tb_fotografo.FOT_id, tb_fotografo.FOT_nome, tb_fotografo.FOT_end_foto, tb_fotografo.FOT_info, tb_fotografo.FOT_nick, tb_fotografo.FOT_ativo, Count(tb_fotografo.FOT_id) AS n_cob, tb_fotografo.FOT_data FROM tb_cobertura RIGHT JOIN (tb_fotografo LEFT JOIN tb_relacao_fot_cob ON tb_fotografo.FOT_id = tb_relacao_fot_cob.REL_id_fotografo) ON tb_cobertura.COB_id = tb_relacao_fot_cob.REL_id_cob GROUP BY tb_cobertura.COB_ativo, tb_fotografo.FOT_id, tb_fotografo.FOT_nome, tb_fotografo.FOT_end_foto, tb_fotografo.FOT_info, tb_fotografo.FOT_nick, tb_fotografo.FOT_ativo, tb_fotografo.FOT_data HAVING (((tb_cobertura.COB_ativo)=True) AND ((tb_fotografo.FOT_ativo)=Yes)) ORDER BY tb_fotografo.FOT_data DESC;") 
Do While Not RC.EOF %>
 <tr>
    <td><div align="right">
      <table class="contato" width="100%" align="center" cellpadding="4" cellspacing="0">
        <tr><td width="128"><img src="../imagems/okt/<%= RC("FOT_end_foto") %>" width="128" height="160"></td>
          <td><p>nome: <%= RC("FOT_nome") %><br>
            <%= RC("FOT_info") %><br>
            <%= RC("n_cob") %> coberturas</p>
            <a href="javascript:MM_openBrWindow('pop_up_fotografo.asp?id_fotografo=<%= RC("FOT_id") %>','Fotografos','scrollbars=yes,resizable=yes,width=400,height=400')" style="color:#FF9900; text-decoration:none"><strong>ver coberturas deste fot&oacute;grafo</strong></a> </td>
        </tr>
      </table>
      </div> </td>
  </tr><tr><td height="10"></td>
  </tr><% RC.MoveNext
 Loop%>
 </table>
      <br></td>
<% ' #############conteudo do corpo fim#############%>
  </tr>
 </table>
<!--#include file="inc_rodape.asp" -->
</div>
</body>
</html>
