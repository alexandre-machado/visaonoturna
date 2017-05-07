<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<!--#include file="inc_head.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
</head>
<style>
<!--
#tb_voto {
	border-right-width: 1px;
	border-left-width: 1px;
	border-top-style: solid;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-top-color: #000000;
	border-right-color: #000000;
	border-bottom-color: #000000;
	border-left-color: #000000;
	border-top-width: 0px;
	border-bottom-width: 0px;
	position: static;
}
#tb_voto .barra {
	font-size: 1ex;
	background-image: url(imagens/canto02-.gif);
	height: 11px;
}
-->
</style>
<body>
<form id="form1" name="form1" method="post" action="teste.asp"><textarea name="textarea" cols="100" rows="6" ></textarea>
  <input type="submit" name="Submit" value="Submit" />
</form>
<!-- inserir uma imagem com transição  -->
<div id="tb_voto">
  <div class="barra"> Content for New Div Tag Goes Here</div>
  <div class="conteudo"> Content for New Div Tag Goes Here</div>
  <div class="barra">Content for New Div Tag Goes Here</div>
</DIV>
<div style="position:absolute; left: 19px; top: 120px; width: 647px;">
	<ul>
	  <li style="display:inline"><img src="imagens/anuncio.gif" width="120" height="60" /></li>
	  <li style="display:inline"><img src="imagens/anuncio.gif" width="120" height="60" /></li>
	  <li style="display:inline"><img src="imagens/anuncio.gif" width="120" height="60" /></li>
</ul>
</div>
<p></p>
<p><!--#include file="tb_lista_dinamica.asp"--></p>
<%= Server.MapPath("..\dados\banco_2005.mdb") %>
</body>
</html>
