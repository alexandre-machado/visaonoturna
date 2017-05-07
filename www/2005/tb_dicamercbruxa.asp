<%
Function cor(i)
	IF (i Mod 2 = 0) THEN
		cor = "#FF9900" 
	Else 
		cor = "#FFB546" 
	End If 
End Function

Function cal()%>
		<link rel="stylesheet" type="text/css" media="all" href="../zpcal/themes/winxp.css" title="winxp" >
		<!--<link href="../zpcal/doc/css/zpcal.css" rel="stylesheet" type="text/css">
		<link href="../zpcal/doc/css/template.css" rel="stylesheet" type="text/css">-->
		<!-- import the calendar script -->
		<script type="text/javascript" src="../zpcal/src/utils.js"></script>
		<script type="text/javascript" src="../zpcal/src/calendar.js"></script>

		<!-- import the language module -->
		<script type="text/javascript" src="../zpcal/lang/calendar-br.js"></script>

		<!-- other languages might be available in the lang directory; please check
		your distribution archive. -->

		<!-- import the calendar setup script -->
		<script type="text/javascript" src="../zpcal/src/calendar-setup.js"></script>
<%End Function

Function cabec() %>
		<html>
		<head>
		<title>Mercado da Bruxa</title>
		<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
		<style type="text/css">
		<!--
		.table {
		background-color: #FF9900;
		border: 1px solid #FFFFFF;
		color: #FFFFFF;
		text-decoration: blink;
		font-family: Arial, Helvetica, sans-serif;
		}
		.borda {
	background-color: #FFD291;
	border: 1px solid #FFFFFF;
	color: #000000;
		}
		-->
		</style>
		<style type="text/css">
		<!--
		a {
		color: #0066CC;
		text-decoration: none;
		}
		-->
		</style>
		<style type="text/css">
<!--
.form1 {
	color: #000000;
	border: thin solid #FFFFFF;
	background-color: #000000;
}
-->
        </style>
		</head>
		<body bgcolor="#000000" >
		<p>
<% End Function %>
		
<% Function listaultima() %>
		<%dim d
		d=cstr(FormatDateTime (now(),2))
		Set RB=Conn.Execute("SELECT * FROM tb_dicabruxa WHERE (((tb_dicabruxa.DBR_data)=DateValue('"&d&"')));")%>
		</p>
		<table width="300"  border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
		<td width="300" height="11" background="imagens/canto02-.gif"></td>
		</tr>
		<tr>
		<td align="center" bgcolor="#FF9900"><font color="#CCCCCC" size="2">Dicas
		di&aacute;rias do Mercado da Bruxa</font><br><% If RB.EOF Then %><% Response.Write("Sem Dica") %><% Else %>
		<font color="#FFFFFF" size="3"><u><%= RB("DBR_titulo") %></u></font><br>
		<a href="javascript:MM_openBrWindow('tb_dicamercbruxa.asp?acao=5','dicabruxa','status=yes,scrollbars=yes,resizable=yes,width=350,height=400')" onMouseOver="status=''; return true;" onMouseOut="status='';"><font color="#FFFFFF" size="2" face="Georgia, Times New Roman, Times, serif" >&quot;<%= nome_(CStr(RB("DBR_texto")),300) %>&quot;</font></a>
		<% End If %></td>
		</tr>
		<tr>
		<td height="11" background="imagens/canto02-.gif"></td>
		</tr>
		</table>
<% End Function %>

<% Function mostrafull() %>
	<!--#include file="_dataconn.asp"-->
	<%dim d
	d=cstr(FormatDateTime (now(),2))
	Set RS=Conn.Execute("SELECT * FROM tb_dicabruxa WHERE (((tb_dicabruxa.DBR_data)=DateValue('"&d&"')));")%>
    <table width="300" height="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
		<td width="300" height="11" background="imagens/canto02-.gif"></td>
	  </tr>
	  <tr>
		<td align="center" bgcolor="#FF9900"><font color="#CCCCCC" size="2">Dicas
			di&aacute;rias do Mercado da Bruxa</font><br><% If RS.EOF Then %><% Response.Write("Sem Dica") %><% Else %>
			<font color="#FFFFFF" size="3"><u><%= RS("DBR_titulo") %></u></font><br>
		    <font color="#FFFFFF" face="Georgia, Times New Roman, Times, serif">&quot;<%= RS("DBR_texto") %>&quot;          </font> <% End If %></td>
	  </tr>
	  <tr>
		<td height="11" background="imagens/canto02-.gif"></td>
	  </tr>
	</table>
<% End Function %>

<% Function banner() %>
	<table width="100%" height="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
		<td width="300" height="11" background="imagens/canto02-.gif"></td>
	  </tr>
	  <tr>
		<td align="center" bgcolor="#FF9900"><p><font color="#FFFFFF" size="2"><img src="imagens/baner/logo_mercbruxa.gif" width="120" height="60"><br>
        Ven&acirc;ncio Aires 1573 fone 30255243</font></p>
		  <p><font color="#FFFFFF" size="2">	        </font><font color="#FFFFFF" face="Geneva, Arial, Helvetica, sans-serif">&quot;Ninguem chega em nem um lugar ha n&atilde;o
	    ser	no exato momento em que esta sendo esperado                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       &quot;		    </font></p></td>
	  </tr>
	  <tr>
		<td height="11" background="imagens/canto02-.gif"></td>
	  </tr>
	</table>
<% End Function %>

<% Function listaedit() %>
	<!--#include file="_dataconn.asp"-->
	<%dim d, e
	d=cdate(FormatDateTime (now(),2))-7
	e=d+14
	Set RS=Conn.Execute("SELECT * FROM tb_dicabruxa WHERE (((tb_dicabruxa.DBR_data) Between DateValue('"&d&"') And DateValue('"&e&"')));") '"& FormatDateTime (now(),2) &"  WHERE DBR_data=#12/8/2005#%>
	<table width="334" align="center" cellpadding="0" cellspacing="0" class="table">
	  <tr>
		<td width="80" align="center">data</td>
		<td width="138" align="center">T&iacute;tulo</td>
		<td width="114" align="center">a&ccedil;&atilde;o</td>
	  </tr>
	  <tr>
		<td colspan="3" align="center"><a href="tb_dicamercbruxa.asp?acao=2">novo</a></td>
	  </tr>
	  
	  <tr><% IF RS.EOF THEN %><td colspan="3" align="center">nenhuma dica</td></tr>
		<% ELSE %>
			<% Do While Not RS.EOF %><% dim i %><% i=i+1 %>
			<tr bgcolor="<%= cor(i) %>"><td><%= RS("DBR_data") %></td>
			<td><%= RS("DBR_titulo") %></td>
			<td align="center"><font color="#FF0000"><a href="tb_dicamercbruxa.asp?id=<%= RS("DBR_id") %>&acao=1" >apagar</a></font> <a href="tb_dicamercbruxa.asp?id=<%= RS("DBR_id") %>&acao=2">editar</a></td>
			</tr><% RS.MoveNext %>
			<% Loop %>
		<% End If %>
	  <tr>
		<td colspan="3" align="center"><a href="tb_dicamercbruxa.asp?acao=2">novo</a></td>
	  </tr>
	</table>
	<% End Function %>

<% Function apaga() %>
	<!--#include file="_dataconn.asp"-->
	<%Set RS=Conn.Execute("DELETE tb_dicabruxa.* FROM tb_dicabruxa WHERE tb_dicabruxa.DBR_id="&Trim(Request.QueryString("id"))&"")%>
	<% Response.Redirect("tb_dicamercbruxa.asp") %>
<% End Function %>

<% Function cria() %>
	<!--#include file="_dataconn.asp"-->
	<% dim sql
	sql="INSERT INTO tb_dicabruxa (DBR_data, DBR_titulo, DBR_texto,DBR_id_usu) VALUES('"&Request("data")&"','"&Request("titulo")&"','"&Request("texto")&"',1)"
	Set RS=Conn.Execute(sql)
	Response.Redirect("tb_dicamercbruxa.asp") %>
<% End Function %>

<% Function edita() %>
	<!--#include file="_dataconn.asp"-->
	<%Set RS=Conn.Execute("UPDATE tb_dicabruxa SET DBR_data='"&Request("data")&"', DBR_titulo='"&Request("titulo")&"', DBR_texto='"&Request("texto")&"' WHERE DBR_id="&Request.QueryString("id"))%>
	<% Response.Redirect("tb_dicamercbruxa.asp") %>
<% End Function %>

<% Function formulario()
	dim rsdata, rstitulo, rstexto, actionx
	If Request.QueryString("id")<>"" Then %>
	<!--#include file="_dataconn.asp"-->
	<%Set RS=Conn.Execute("SELECT tb_dicabruxa.DBR_id, tb_dicabruxa.DBR_data, tb_dicabruxa.DBR_titulo, tb_dicabruxa.DBR_texto FROM tb_dicabruxa WHERE tb_dicabruxa.DBR_id="&Request.QueryString("id"))
	rsdata=RS("DBR_data")
	rstitulo=RS("DBR_titulo")
	rstexto=RS("DBR_texto")
	actionx="tb_dicamercbruxa.asp?acao=4&id="&RS("DBR_id")
	Else
	rsdata=""
	rstitulo=""
	rstexto=""
	actionx="tb_dicamercbruxa.asp?acao=3"
	End If %>
	<form style="form1" name="forminc" method="post" action="<%= actionx %>">
    <table width="375" align="center" cellpadding="0" cellspacing="0" class="table">
      <tr>
        <td width="70" height="28">data:</td>
        <td width="303"><input class="borda" name="data" type="text" id="datacal" value="<%= rsdata %>" size="10"> 
		<input name="bt" type="button" id="cal" value=" ... " onclick="alert('click');" class="borda">        dd/mm/aa</td>
      </tr>
      <tr>
        <td>titulo</td>
        <td><input class="borda" name="titulo" type="text" id="titulo" value="<%= rstitulo %>" size="50"></td>
      </tr>
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
      <tr>
        <td>texto:</td>
        <td><textarea class="borda" name="texto" cols="40" rows="6" id="texto"><%= rstexto %></textarea></td>
      </tr>
      <tr align="center">
        <td colspan="2"><input class="borda" type="submit" name="Submit" value="Enviar">
        </td>
      </tr>
    </table>
	</form>
<div align="center"><iframe border="0" height="400" width="800" name="recados" src="http://www.mercadodabruxa.com.br/dica.php">
Seu navegador não oferece suporte para quadros embutidos ou está configurado para não exibi-los.
</iframe></div>	
<% End Function %>

<% Function rodap() %>
	</body>
	</html>
<% End Function %>

<% session("id_usu")="1" %>
<%IF local="index" THEN%>
	<% listaultima() %>
<%ELSE
	Select Case Trim(Request.QueryString("acao"))
		case ""
			cabec()
			listaedit()
			rodap()
		case "1"
			apaga()
		case "2"
			cabec()
			cal()
			formulario()
			rodap()
		case "3"
			cria()
		case "4"
			edita()
		case "5"
			cabec()
			mostrafull()
			rodap()
		case "6"
			cabec()
			banner()
			rodap()
	End Select
END IF%>