<%@Language="VBScript"%>
<%Option Explicit%>
<%Response.Expires = 0%>

<%
	Dim i
	Dim ii
	Dim varCont
	
	If Request.Form("txtDe") <> "" Then
		Dim Conn
		Dim varConn
		Dim varSql
		Dim rsIncluir
		Dim varMensagem
		Dim arrayCarinhas(14)
		
		'Cria a conexão com a base de dados%>
<!--#include file="_dataconn.asp"-->
		<%'Set objConn = Server.CreateObject("ADODB.Connection")
		'varConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & Server.MapPath("Dados\BDMuralRecados.mdb") & ";Persist Security Info=False;Jet OLEDB:Database Password="
		'objConn.Open varConn
	
		arrayCarinhas(0) = "(1)"
		arrayCarinhas(1) = "(2)"
		arrayCarinhas(2) = "(3)"
		arrayCarinhas(3) = "(4)"
		arrayCarinhas(4) = "(5)"
		arrayCarinhas(5) = "(6)"
		arrayCarinhas(6) = "(7)"
		arrayCarinhas(7) = "(8)"
		arrayCarinhas(8) = "(9)"
		arrayCarinhas(9) = "(10)"
		arrayCarinhas(10) = "(11)"
		arrayCarinhas(11) = "(12)"
		arrayCarinhas(12) = "(13)"
		arrayCarinhas(13) = "(14)"
		arrayCarinhas(14) = "(15)"
		
		varSql = "SELECT * "
		varSql = varSql & "FROM tb_recados "
		
		Set rsIncluir = Server.CreateObject("ADODB.Recordset")
		rsIncluir.CursorType = 0
		rsIncluir.CursorLocation = 2
		rsIncluir.LockType = 3
		rsIncluir.Open varSql, Conn
		
		
		rsIncluir.AddNew
		rsIncluir.Fields("DataInclusao") = Date()
		rsIncluir.Fields("HoraInclusao") = Time()
		rsIncluir.Fields("De") = Request.Form("txtDe")
		rsIncluir.Fields("Email") = Request.Form("txtEmail")
		rsIncluir.Fields("Para") = Request.Form("txtPara")
		
		varMensagem = Request.Form("areaMensagem")
		For i = 0 to 14
			varMensagem = Replace(varMensagem, arrayCarinhas(i), "<img src=../images/Carinhas/" & i+1 & ".gif>")
		Next
		
		rsIncluir.Fields("Mensagem") = varMensagem
		rsIncluir.Fields("IPConexao") = Request.ServerVariables("REMOTE_ADDR")
		rsIncluir.Update
		
		rsIncluir.Close
		Set rsIncluir = Nothing
		
		Conn.Close
		Set Conn = Nothing
	End If
%>

<html>
	<head>
		<title>
			Visaonoturna - Mural Recados
		</title>
		<style type="text/css">
		<!--
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
				color: #000000;
				text-decoration: none;
			}
			.Texto2{
				font-family: Verdana;
				font-size: 10px;
				font-weight: bold;
				color: #000000;
				text-decoration: none;
			}
			.Borda1{
				border: 1px solid #999999;
			}
			.Form1{
				border: 1px solid #FFFFFF;
				font-family: Verdana;
				font-size: 10px;
				color: #000000;
				text-decoration: none;
				background-color: #FF9900;
			}
		-->
		</style>
		<script language="JavaScript">
		<!--
			location.href.MuralRecados = ("Default.asp");
			<%If Request.Form("txtDe") <> "" Then%>
				opener.location.reload();
				window.close();
			<%End If%>
			
			function Incluir(varForm){
				if (varForm.txtDe.value == ""){
					window.alert ("O campo De é de preenchimento obrigatório");
					varForm.txtDe.focus();
					return false;
				}
				if (varForm.txtEmail.value == ""){
					window.alert ("O campo E-mail é de preenchimento obrigatório");
					varForm.txtEmail.focus();
					return false;
				}
				else{
					if (varForm.txtEmail.value.search("@") == -1 || varForm.txtEmail.value.search("[.*]") == -1){
						window.alert ("O e-mail não é válido");
						varForm.txtEmail.focus();
						return false;
					}
				}
				if (varForm.txtPara.value == ""){
					window.alert ("O campo Para é de preenchimento obrigatório");
					varForm.txtPara.focus();
					return false;
				}
				if (varForm.areaMensagem.value == ""){
					window.alert ("O campo Mensagem é de preenchimento obrigatório");
					varForm.areaMensagem.focus();
					return false;
				}
				varForm.submit();
			}
			
			function Carinhas(varForm, varCarinha){
				var arrayCarinhas = new Array("(1)", "(2)", "(3)", "(4)", "(5)", "(6)", "(7)", "(8)", "(9)", "(10)", "(11)", "(12)", "(13)", "(14)", "(15)")
				
				varCarinha = varCarinha - 1;
				
				varForm.areaMensagem.value = varForm.areaMensagem.value + " " + arrayCarinhas[varCarinha] + " ";

			}
		-->
		</script>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"></head>
	<body bgcolor="E8E8E8" onLoad="JavaScript:document.formIncluir.txtDe.focus();">
		<table cellpadding="0" cellspacing="0" border="0" width="100%" height="100%" align="center">
			<tr>
				<td>
					<table border="0" align="center">
						<form name="formIncluir" method="post" action="pop_recado_novo.asp">
							<tr>
								<td>
									<font class="Texto2">
										De:
									</font>
								</td>
								<td>
									<input name="txtDe" type="text" class="Form1" value="<%=session("painel_nick")%>" size="35" maxlength="35">
								</td>
							</tr>
							<tr>
								<td>
									<font class="Texto2">
										E-mail:
									</font>
								</td>
								<td>
									<input type="text" name="txtEmail" maxlength="35" size="35" class="Form1">
								</td>
							</tr>
							<tr>
								<td>
									<font class="Texto2">
										Para:
									</font>
								</td>
								<td>
									<input type="text" name="txtPara" maxlength="35" size="35" class="Form1">
								</td>
							</tr>
							<tr>
								<td>
									<font class="Texto2">
										Mensagem:
										<br><br><br><br><br><br>
									</font>
								</td>
								<td>
									<textarea name="areaMensagem" class="Form1" cols="34" rows="5"></textarea>
								</td>
								<td width="5">
								</td>
								<td>
									<table cellpadding="0" cellspacing="0" border="0">
										<%For i = 1 to 3%>
											<tr>
												<%For ii = 1 to 5%>
													<%varCont = varCont + 1%>
													<td><a href="#"><img src="../images/Carinhas/<%=varCont%>.gif" border="0" onClick="JavaScript:Carinhas(formIncluir, <%=varCont%>);"></a></td>
													<%If ii <> 5 Then%>
														<td width="5">
														</td>
													<%End If%>
												<%Next%>
											</tr>
											<%If i <> 3 Then%>
												<tr>
													<td height="5">
													</td>
												</tr>
											<%End If%>
										<%Next%>
									</table>
								</td>
							</tr>
							<tr>
								<td>
								</td>
								<td>
									<input type="button" name="btnColar" value="Colar" class="Form1" onClick="JavaScript:Incluir(formIncluir);">
								</td>
							</tr>
						</form>
					</table>
				</td>
			</tr>
		</table>
</body>
</html>