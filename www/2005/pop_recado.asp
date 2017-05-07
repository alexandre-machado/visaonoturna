<%@Language="VBScript"%>
<%Option Explicit%>
<!--#include file="_dataconn.asp"-->
<%Response.Expires = 0%>

<%
	'Ricardo das Neves Carlos
	'ricardo@promedia.com.br
	'Mural de recados
	'31/10/2003
%>

<%
	Dim Conn
	Dim varConn
	Dim varSql
	Dim rsMuralRecados
	Dim i
	
	'Cria a conexão com a base de dados
	'Set Conn = Server.CreateObject("ADODB.Connection")
	'varConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("Dados\BDMuralRecados.mdb") & ";Persist Security Info=False;Jet OLEDB:Database Password="
	%>
	<%''Conn.Open Conn
	
	'Seleciona todos os registros ordenando pelo ID
	varSql = "SELECT tb_recados.* "
	varSql = varSql & "FROM tb_recados "
	varSql = varSql & "WHERE (show=yes) "
	varSql = varSql & "ORDER BY IdRecado DESC "
	
	'Seta a variável e define as propriedas
	Set rsMuralRecados = Server.CreateObject("ADODB.Recordset")
	rsMuralRecados.CursorType = 0
	rsMuralRecados.CursorLocation = 3
	rsMuralRecados.LockType = 3
	rsMuralRecados.PageSize = 7
	rsMuralRecados.CacheSize = 7
	rsMuralRecados.Open varSql, Conn
	
	'Verifica qual página deve ser exibida
	If Request.QueryString("Pagina") <> "" Then
		rsMuralRecados.AbsolutePage = Request.QueryString("Pagina")
	Else
		If Not rsMuralRecados.EOF Then
			rsMuralRecados.AbsolutePage = 1
		End If
	End If
%>

<html>
	<head>
	<title>Pro Media - Módulo Mural Recados</title>
	<style type="text/css">
		<!--
			body {
				background-repeat: no-repeat;
				font-family: Courier New, Courier, mono;
				font-size: 10pt;
				scrollbar-arrow-color: #ffffff;
				scrollbar-base-color: #ffffff;
				scrollbar-dark-shadow-color: #EF9B49;
				scrollbar-face-color: #EF9B49;
				scrollbar-highlight-color: #EF9B49;
				scrollbar-shadow-color: #EF9B49;
				scrollbar-track-color: #EF9B49;
				scrollbar-3dlight-color: #ffffff;
			
			}
			a:active{
				text-decoration: none;
				color: #333333;
			}
			a:hover{
				text-decoration: none;
				color: #000000;
			}
			a:link{
				text-decoration: none;
				color: #333333;
			}
			a:visited{
				text-decoration: none;
				color: #333333;
			}
			.Texto1{
				font-family: Verdana;
				font-size: 10px;
				font-weight: none;
				color: #666666;
				text-decoration: none;
			}
			.Texto2{
				font-family: Verdana;
				font-size: 10px;
				font-weight: bold;
				color: #666666;
				text-decoration: none;
			}
			.Borda1{
				border: 1px solid #999999;
			}
			.Form1{
				border: 1px solid #FFFFFF;
				font-family: Verdana;
				font-size: 10px;
				color: #FFFFFF;
				text-decoration: none;
				background-color: #FF9900;
			}
.style1 {color: #FFFFFF}
		-->
		</style>
	<script language="JavaScript">
		<!--
			function Paginacao(varPagina){
				window.location = ("pop_recado.asp?Pagina=" + varPagina);
			}
			
			function NovoRecado(){
				window.open ("pop_recado_novo.asp", "NovoRecado", "width = 430, height = 225, top = 25, left = 25");
			}
		-->
		</script>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
	<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);
//-->
    </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div id="Layer1" style="position:absolute; width:100%; height:100%; z-index:1">
		  <table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%" align="center">
			<tr>
				<td width="299" align="center" valign="middle" bgcolor="#FF9900">
			      <span class="style1"><font size="2" face="Courier New, Courier, mono"> Mural de recados</font><br>
				  </span>
			      <table width="97%" border="0" align="center" cellpadding="0" cellspacing="0">
						<%For i = 1 to rsMuralRecados.PagesiZe%>
							<%If rsMuralRecados.EOF = False Then%>
								<tr>
								  <td>
								    <table width="100%" border="1" align="center" style="border-collapse: collapse" cellspacing="0" bordercolor="#999999">
											<tr>
												<td width="100%" height="100%" bgcolor="#EAEAEA">
												  <font class="Texto2">
													  Data/Hora Envio:												  </font>
												  <font class="Texto1">
													  <%=rsMuralRecados.Fields("DataInclusao") & " - " & rsMuralRecados.Fields("HoraInclusao")%>												  </font>											  </td>
											</tr>
											<tr>
												<td width="100%" height="100%" bgcolor="#EAEAEA">
												  <font class="Texto2">
													  De:												  </font>
												  <font class="Texto1">
													  <%=rsMuralRecados.Fields("De")%>												  </font>											  </td>
											</tr>
											<tr>
												<td width="100%" height="100%" bgcolor="#EAEAEA">
												  <font class="Texto2">
													  Para:												  </font>
												  <font class="Texto1">
													  <%=rsMuralRecados.Fields("Para")%>												  </font>											  </td>
											</tr>
											<tr>
												<td width="100%" height="100%" bgcolor="#CCCCCC"><font size="1" face="Verdana, Arial, Helvetica, sans-serif"><strong>Mensagem :</strong></font><font size="1" face="Arial, Helvetica, sans-serif"> <%=rsMuralRecados.Fields("Mensagem")%></font></td>
											</tr>
											<%rsMuralRecados.MoveNext%>
											<%If i <> rsMuralRecados.PageSize and NOT rsMuralRecados.EOF Then%>
												<tr>
													<td width="100%" height="5"></td>
												</tr>
											<%End If%>
								    </table>								  </td>
								</tr>
							<%End If%>
						<%Next%>
							<tr>
								<td height="20" bgcolor="#EAEAEA">								</td>
							</tr>
							<tr>
								<td height="20">
									<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%" align="center">
										<tr>
											<td align="center" bgcolor="#EAEAEA">
												<input name="btnNovoRecado" type="button" class="Form1" onClick="JavaScript:NovoRecado();" value="Novo Recado">										  </td>
											<td align="right" bgcolor="#EAEAEA">
												<%If Request.QueryString("Pagina") = 1 or Request.QueryString("Pagina") = "" Then%>
													<input type="button" name="btnAnterior" value="Anterior" class="Form1" onClick="JavaScript:Paginacao(<%=Request.QueryString("Pagina") - 1%>);" disabled>
												<%Else%>
													<input type="button" name="btnAnterior" value="Anterior" class="Form1" onClick="JavaScript:Paginacao(<%=Request.QueryString("Pagina") - 1%>);">
												    <%End If%>
												<%If rsMuralRecados.EOF Then%>
													<input type="button" name="btnProximo" value="Próximo" class="Form1" onClick="JavaScript:Paginacao(<%=Request.QueryString("Pagina") + 1%>);" disabled>
												<%Else%>
													<%If Request.QueryString("Pagina") = "" Then%>
														<input type="button" name="btnProximo" value="Próximo" class="Form1" onClick="JavaScript:Paginacao(<%=Request.QueryString("Pagina") + 2%>);">
													<%Else%>
														<input type="button" name="btnProximo" value="Próximo" class="Form1" onClick="JavaScript:Paginacao(<%=Request.QueryString("Pagina") + 1%>);">
													<%End If%>
												<%End If%>										  </td>
										</tr>
									</table>								</td>
							</tr>
				  </table>		      </td>
			</tr>
	</table></div>
		
</body>
</html>

<%
	rsMuralRecados.Close
	Set rsMuralRecados = Nothing
	Conn.Close
	Set Conn = Nothing
%>