<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<%
'IF IsNumeric(Request("id"))=false THEN
'	Response.Write("entrada de dado errada")
'END IF
dim mysql, n_foto, RF
IF Request("foto")<>"" THEN
	n_foto=Request("foto")
ELSE
	n_foto=1
END IF
testefoto_()
'#################### votar
IF Request("ac")=1 AND session("ft"&cstr(RF("IDF_id")))<>"1" AND session("ok")="1" THEN
	Set RX=Conn.Execute("INSERT INTO tb_cont_nota_foto (CNF_nota, CNF_id_foto) VALUES("&Request("vt")&","&RF("IDF_id")&")")
	session("ft"&cstr(RF("IDF_id")))="1"
	testefoto_()
END IF
'session("ft"&cstr(RF("IDF_id")))=""
 '#################### votar
mysql="SELECT tb_cobertura.COB_id, tb_cobertura.COB_qt_foto, tb_cobertura.COB_ordem, tb_local.LOC_link_foto, tb_local.LOC_fone, tb_local.LOC_site, tb_cidade.CID_nome, tb_local.LOC_nome, tb_local.LOC_end_pasta, tb_cobertura.COB_por, tb_cobertura.COB_data, tb_cobertura.COB_nome_festa FROM (tb_cidade RIGHT JOIN tb_local ON tb_cidade.CID_id = tb_local.LOC_id_cidade) RIGHT JOIN (tb_cobertura LEFT JOIN tb_id_foto ON tb_cobertura.COB_id = tb_id_foto.IDF_id_cob) ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE (((tb_cobertura.COB_id)="&Request("id")&")) ORDER BY tb_cobertura.COB_ordem DESC;"
'Response.Write(mysql) 'teste
Set RS=Conn.Execute(mysql)
%>
<html>
<head>
<title>foto</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<meta http-equiv="Page-Enter" content="blendTrans(Duration=1)">
<meta http-equiv="Page-Exit" content="blendTrans(Duration=1)">
<link href="estilo1.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript" SRC="geral.js"></SCRIPT></head>
<body bgcolor="#000000" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('../fotos/<%=RS("LOC_end_pasta")%>/<%=data_3(RS("COB_data"))%>/<%= n_foto+1 %>.JPG','imagens/star3.gif')">
<table  width="100%" height="100%" border="0"   align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="131" align="center" background="imagens/pop_up1.gif"><!--#include file="inc_pop_banner.asp"--></td>
    <td rowspan="2">
	  <table height="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#000000">
        <tr>
          <td colspan="2"><!--#include file="inc_pop_mail.asp"--><%IF request("email")="ok" THEN%><!--#include file="inc_pop_mail_ok.asp"--><% End If %>
<font color="#FF9900" size="2" face="Courier New, Courier, mono"><%= nome_(data_4(RS("COB_data")) &" - "& RS("COB_nome_festa"),50) %></font></td>
        </tr>
        <tr>
          <td height="300" colspan="2" valign="top"><%'<!--#include file="inc_pop_banner_foto.asp"-->%><div align="center">
		  <% If int(n_foto)<>RS("COB_qt_foto") Then %><a target="foto" href="pop_up_foto.asp?foto=<%= n_foto+1 %>&id=<%= Request("id") %>"><% End If %><img src="../fotos/<%=RS("LOC_end_pasta")%>/<%=data_3(RS("COB_data"))%>/<%= n_foto %>.JPG" alt="Clique para próxima" border="0" ><% If int(n_foto)<>RS("COB_qt_foto") Then %></a><% End If %></div>
		  </td>
        </tr>
        <tr>
          <td width="257"  align="left" valign="top"><!--#include file="inc_pop_nota.asp"--></td>
          <td width="143" align="right"><font color="#FF9900" size="1"><%= n_foto&"/"&RS("COB_qt_foto") %>
					<img src="imagens/pop_email.gif" alt="Envie esta foto por email" width="25" align="absmiddle" style="cursor: hand;" onClick=onoffdisplay()>
				    <%if n_foto<>1 then%>
						<a target="foto" href="pop_up_foto.asp?foto=<%= n_foto-1 %>&id=<%= Request("id") %>">
						<img src="imagens/pop_volta.gif" width="24" height="18" border="0" align="absmiddle"></a>
					<%else%><img src="imagens/pop_volta.gif" width="24" height="18" border="0" align="absmiddle">
					<%end if%>
					<%if int(n_foto)<>RS("COB_qt_foto") then%>
						<a target="foto" href="pop_up_foto.asp?foto=<%= n_foto+1 %>&id=<%= Request("id") %>">
						<img src="imagens/pop_avanca.gif" width="24" height="18" border="0" align="absmiddle"></a>
					<%else%><img src="imagens/pop_avanca.gif" width="24" height="18" border="0" align="absmiddle">
					<%end if%>
          </font></td>
        </tr>
      </table>
    </td>
  </tr>
  <tr>
    <td width="131" height="85" align="center" background="imagens/pop_up1.gif"><font color="#FFFFFF">
      <!--#include file="inc_pop_casa.asp"-->
    </font></td>
  </tr>
</table>
</body>
</html>
