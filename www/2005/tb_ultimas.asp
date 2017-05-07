

<%dim mysql,style,link,xx
style=""
mysql="SELECT tb_cobertura.COB_id, tb_cobertura.COB_qt_foto, tb_cobertura.COB_ordem, tb_cidade.CID_nome, tb_local.LOC_nome, tb_local.LOC_end_pasta, tb_cobertura.COB_por, tb_cobertura.COB_data, tb_cobertura.COB_nome_festa, tb_cobertura.COB_ativo FROM (tb_cidade RIGHT JOIN tb_local ON tb_cidade.CID_id = tb_local.LOC_id_cidade) RIGHT JOIN tb_cobertura ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE (((tb_cobertura.COB_ativo)=Yes)) ORDER BY tb_cobertura.COB_ordem DESC;"
Set RS=Conn.Execute(mysql)%>
<script language="JavaScript" src="inc_js_trocaimg.js"></script>
<script language="JavaScript" type="text/javascript">
end_img= new Array(),qt_img= new Array();
<%FOR i=0 TO 3 STEP 1%>
//end_img[<%= i %>]= new Array();
end_img[<%= i %>]= '../fotos/<%=RS("LOC_end_pasta")%>/<%=data_3(RS("COB_data"))%>/mini_';
qt_img[<%= i %>]= '<%=RS("COB_qt_foto") %>';
<%RS.MoveNext
NEXT
RS.MoveFirst%>
troca_img();
</script>

<table border="0" align="center" cellpadding="0" cellspacing="0" class="teste" style="border-collapse: collapse; border-left:solid 1pt #000000; border-right:solid 1pt #000000">
  <tr>  
  	<%FOR i=0 TO 3 STEP 1%><td>		
		<table width="154" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr bgcolor="#9BB7DC">
			<td width="152" height="11" background="imagens/canto02-.gif" bgcolor="#9BB7DC"></td>
			</tr>
			<tr bgcolor="#9BB7DC">
			  <td align="center" bgcolor="ff9900"><font color="#FFFFFF" size="1" face="Verdana, Arial, Helvetica, sans-serif"><%=data_2(RS("COB_data"))%>|<u><%=RS("LOC_nome")%></u></font></td>
			</tr>
			<tr bgcolor="#9BB7DC">
			  <td  height="110" align="center" valign="middle" bgcolor="ff9900"><div style="background-color:#000; width:140; height:105"><a href="<%=link_pop_(RS("COB_id"))%>" onMouseOver="status=''; return true;" onMouseOut="status='';"><img src="../fotos/<%=RS("LOC_end_pasta")%>/<%=data_3(RS("COB_data"))%>/mini_<%= rnd_(RS("COB_qt_foto")) %>.JPG" name="img_ultimas<%= i %>" border="0" style="filter:alpha(opacity=100)"></a></div></td>
		  </tr>
			<tr bgcolor="#9BB7DC">
			<td height="11" background="imagens/canto02-.gif" bgcolor="#9BB7DC"></td>
      		</tr>
	  </table>
	</td><%
	RS.MoveNext
	NEXT
%>
  </tr> 
</table>
