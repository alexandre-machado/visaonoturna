<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<!--#include file="inc_head.asp"-->

<% Set RSfotografo = Conn.execute("SELECT tb_fotografo.*, tb_fotografo.FOT_id FROM tb_fotografo WHERE (((tb_fotografo.FOT_id)="&request("id_fotografo")&"));") %>
<% Set RSLISTACOB = Conn.execute("SELECT tb_fotografo.FOT_id, tb_cobertura.COB_ativo, tb_cobertura.COB_nome_festa, tb_cobertura.COB_data, tb_cobertura.COB_id, tb_local.LOC_nome FROM tb_local INNER JOIN (tb_fotografo INNER JOIN (tb_cobertura INNER JOIN tb_relacao_fot_cob ON tb_cobertura.COB_id = tb_relacao_fot_cob.REL_id_cob) ON tb_fotografo.FOT_id = tb_relacao_fot_cob.REL_id_fotografo) ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE (((tb_fotografo.FOT_id)="&request("id_fotografo")&") AND ((tb_cobertura.COB_ativo)=True)) ORDER BY tb_cobertura.COB_data DESC;") %>
<% dim n %>
<% n = 0 %>
<% Do While Not RSLISTACOB.EOF %>
<% n = n+1 %>
<% RSLISTACOB.MoveNext %>
<% Loop %>
<% RSLISTACOB.MoveFirst %>
<title>Untitled Document</title>
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
</style>
</head>

<body style="background-color:#000000">
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="0" style="border-left:solid 1pt #000000; border-right:solid 1pt #000000">
  <tr bgcolor="#9BB7DC">
    <td height="11" colspan="2" background="imagens/canto02-.gif" bgcolor="#9BB7DC"></td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FF9C00"><img src="../imagems/okt/<%= RSfotografo("FOT_end_foto") %>" width="128" height="160" border="0" align="left" /></td>
    <td align="center" bgcolor="#FF9C00"><div align="left">
      <p>Nome: <%= RSfotografo("FOT_nome") %><br />
          <%= RSfotografo("FOT_info") %><br />
       <%= n %> coberturas </p>
      </div></td>
  </tr>
  
  <tr>
    <td colspan="2" bgcolor="#FF9900"><p>Coberturas deste fot&oacute;grafo </p>
      <p>
        <% Do While not RSLISTACOB.EOF %>
        <a style="text-decoration:none" href="<%=link_pop_(RSLISTACOB("COB_id"))%>"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=data_1(RSLISTACOB("COB_data"))%>|<u><%=RSLISTACOB("LOC_nome")%></u> - <%=RSLISTACOB("COB_nome_festa")%></font></a><br />
        <% RSLISTACOB.MoveNext %>
        <% Loop %>
      </p></td>
  </tr>
  
  <tr bgcolor="#9BB7DC">
    <td height="11" colspan="2" background="imagens/canto02-.gif" bgcolor="#9BB7DC"></td>
  </tr>
</table>
</body>
</html>
