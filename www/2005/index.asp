<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%dim local
local="index"%>
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
<!--#include file="inc_pop-up.asp"-->
   <tr>
    <td><!--#include file="inc_topo.asp"--></td>
  </tr>
</table>
<table width="770" height="339" border="0" cellpadding="0" cellspacing="0" background="imagens/fundo_full.gif" bgcolor="#E8E8E8" class="viu">
  <tr>
    <td width="120" height="265" valign="top">
	<!--#include file="inc_menu.asp" --></td>
    <td width="650"  align="center" valign="top">
      <br>
<% ' #############conteudo do corpo inicio#############%>
      <!--#include file="tb_ultimas.asp" -->
      <br>
      <table width="630" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td align="left" valign="top">
            <div align="center"><%' <!--#include file="tb_ultimas_lista.asp" --> %><!--#include file="tb_lista_voto.asp" -->
           </div></td>
          <td width="50%" align="right" valign="top">
            <div align="center">
				<!--#include file="tb_ultimas_lista.asp" -->
<br>
               <!--#include file="tb_recados.asp" -->
             </div></td>
        </tr>
      </table><br>
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td><div align="center">
			</div></td>
		  </tr>
		</table>
<% ' #############conteudo do corpo fim#############%>
	</td>
  </tr>
 </table>
<!--#include file="inc_rodape.asp" -->
<% Conn.Close
Set Conn = Nothing
 %>
</div>
</body>
</html>
