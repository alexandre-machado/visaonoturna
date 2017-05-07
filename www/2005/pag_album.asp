<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<%' secure_(request("casa"),0) %>
<html>
<head>
<!--#include file="inc_head.asp"-->
<script type="text/JavaScript">
<!--

function MM_jumpMenu(targ,selObj,restore){ //v3.0
  eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
  if (restore) selObj.selectedIndex=0;
}
//-->
</script>
<style type="text/css">
<!--
a {
	color: #333333;
	text-decoration: none;
}
.style2 {
	font-size: 12;
	color: #FF9900;
}
.style3 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12;
	color: #314D6B;
	font-weight: bold;
}
-->
</style>
</head>
<% Set RSC=Conn.execute("SELECT tb_local.LOC_id, tb_local.LOC_nome FROM tb_local ORDER BY tb_local.LOC_nome;") %>
<%' <!--#include file="menu_contexto.asp"--> %>
<body bgcolor="#000000" leftmargin="0" topmargin="0" rightmargin="0" bottommargin="0">
<div id="Layer1" style="position:absolute;  width: 100%; height: 100%;" align="center">
<table width="770" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><!--#include file="inc_topo.asp"--></td>
  </tr>
</table>
<table width="770" height="316" border="0" cellpadding="0" cellspacing="0" background="imagens/fundo_full.gif" bgcolor="#E8E8E8" class="viu">
  <tr>
    <td width="120" height="265" valign="top">
	<!--#include file="inc_menu.asp" --></td>
    <% ' #############conteudo do corpo inicio#############%>
	<td width="650"  align="center" valign="top">
	    <br>
	    <%
Set RS = Server.CreateObject("ADODB.RecordSet")
RS.PageSize = 30
dim lista_casa, mysql, n_cob, n_fot, x, y, busca,z
	'IF Request.ServerVariables("REQUEST_METHOD")<>"POST" THEN
		IF request("casa")<>"" Then
			busca="SELECT tb_cobertura.COB_id, tb_local.LOC_id, tb_cobertura.COB_data, tb_local.LOC_nome, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto, tb_cobertura.COB_ativo FROM tb_local RIGHT JOIN (tb_cat_cob RIGHT JOIN tb_cobertura ON tb_cat_cob.CAC_id = tb_cobertura.COB_id_cat) ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE (tb_local.LOC_id="&request("casa")&") AND (((tb_cobertura.COB_ativo)=Yes)) ORDER BY tb_cobertura.COB_data DESC;"
			'x="casa="&request("casa")&"&"
		'ELSE
			'lista_casa="SELECT tb_cobertura.COB_id, tb_local.LOC_id, tb_cobertura.COB_data, tb_local.LOC_nome, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto FROM tb_local RIGHT JOIN (tb_cat_cob RIGHT JOIN tb_cobertura ON tb_cat_cob.CAC_id = tb_cobertura.COB_id_cat) ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE tb_cobertura.COB_nome_festa like'%"&request("festa")&"%' AND tb_local.LOC_nome LIKE'%"&request("festa")&"%' AND tb_cobertura.COB_data like'%"&request.form("data")&"%' ORDER BY tb_cobertura.COB_data DESC;"
			'x="festa="&request.form("festa")&"&data="&request.form("data")&"&"
		'END IF
		'mysql=lista_casa
	ELSE
	IF request("data")<>"" THEN
		busca="SELECT tb_cobertura.COB_id, tb_local.LOC_id, tb_cobertura.COB_data, tb_local.LOC_nome, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto, tb_cobertura.COB_ativo FROM tb_local RIGHT JOIN (tb_cat_cob RIGHT JOIN tb_cobertura ON tb_cat_cob.CAC_id = tb_cobertura.COB_id_cat) ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE (tb_cobertura.COB_data LIKE'"&request("data")&"%') AND (((tb_cobertura.COB_ativo)=Yes)) ORDER BY tb_cobertura.COB_data DESC;"
	ELSE
		busca="SELECT tb_cobertura.COB_id, tb_local.LOC_id, tb_cobertura.COB_data, tb_local.LOC_nome, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto, tb_cobertura.COB_ativo FROM tb_local RIGHT JOIN (tb_cat_cob RIGHT JOIN tb_cobertura ON tb_cat_cob.CAC_id = tb_cobertura.COB_id_cat) ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE (tb_cobertura.COB_nome_festa like'%"&request("festa")&"%' OR tb_local.LOC_nome LIKE'%"&request("festa")&"%') AND (((tb_cobertura.COB_ativo)=Yes)) ORDER BY tb_cobertura.COB_data DESC;"
	END IF
	END IF
		mysql=busca
		x="festa="&request("festa")&"&data="&request("data")&"&casa="&request("casa")&"&"
RS.Open mysql,Conn,3,3
	n_cob=0
	n_fot=0
	IF NOT RS.EOF THEN
		Do While Not RS.EOF
			n_cob=n_cob+1
			n_fot=n_fot+RS("COB_qt_foto")
			RS.MoveNext
		Loop
		RS.MoveFirst
	END IF
	IF RS.EOF THEN%>
	  <table>
          <tr>
            <td bgcolor="#FF9A00">não existe cobertura neste local.</td>
          </tr>
        </table>
	<%
	ELSE
			IF Request.QueryString("pagina")="" then 
				intpagina=1 
			ELSE
				IF cint(Request.QueryString("pagina"))<1 then
					intpagina=1
				ELSE
					IF cint(Request.QueryString("pagina"))> RS.PageCount then
						intpagina=RS.PageCount
					ELSE
						intpagina=cint(Request.QueryString("pagina"))
					END IF
				END IF
			END IF
		RS.AbsolutePage=intpagina
		intrec=0
%>
	  <table  width="605" border="0" cellpadding="0" cellspacing="0">
		<tr>
		  <td width="4"></td>
		  <td align="center"><span class="style3">Lista com <%=n_cob%> coberturas e <%=n_fot%> fotos. </span></td>
		  <td><form style=" margin: 0 " name="form1" method="post" action="pag_album.asp">
		    <p align="right">
		      <select name="casa" class="form">
		        <option value="">selecione o local</option>
		        <% do while not RSC.eof %>
		        <option value="<%= RSC("LOC_id") %>"<% If cstr(RSC("LOC_id"))=request("casa") Then %> selected<% End If %>><%= RSC("LOC_nome") %></option>
		        <% RSC.MoveNext %>
		        <% Loop %>
		        </select>
		      <input type="submit" name="Submit" value="ok">
		    </p>
		  </form>		  </td>
		  <td></td>
		</tr>
		  <tr>
		    <td width="4"></td>
	        <td colspan="2">&nbsp;</td>
	        <td width="4"></td>
		  </tr>
	  <%	DO WHILE intrec < RS.PageSize and not RS.EOF%>
		  <tr><td width="4"></td>
		    <td colspan="2"><a href="<%= link_pop_(RS("COB_id"))%>" title="<%= RS("LOC_nome") &" - "& RS("COB_nome_festa") %>" class="style2">&bull;<%= data_4(RS("COB_data")) %>|<strong><u><%= nome_(RS("LOC_nome") & "</u></strong> - " & RS("COB_nome_festa"),70) %></a></td>
		    <td></td>
		  </tr><%
		RS.MoveNext
		intrec=intrec+1 
	LOOP
%>
		  <tr><td colspan="4" align="right" class="style2"><%IF intpagina>1 THEN%><a href="pag_album.asp?<%= x %>pagina=<%=intpagina-1%>">anterior</a> | 
		    <%
		  			ELSE%>anterior | <%END IF
					dim i
					i=0
					do while i<rs.pagecount 
					%><a href="pag_album.asp?<%= x %>pagina=<%=i+1%>"><%IF intpagina<>i+1 THEN%><%=i+1%><%ELSE%><span style="text-decoration:overline underline"><%=i+1%></span><%END IF%></a> <% 
					i=i+1
					loop
					IF strcomp(intpagina,RS.PageCount) <> 0 THEN
					%> | <a href="pag_album.asp?<%= x %>pagina=<%=intpagina+1%>">próxima</a><%
					ELSE%>  |  próxima<%
					END IF%></td></tr><%
END IF %>
	  </table>
      <br></td><% ' #############conteudo do corpo fim#############%>
   </tr>
 </table>
<!--#include file="inc_rodape.asp" -->
</div>
</body>
</html>
