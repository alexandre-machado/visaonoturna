		<%Set RSVOTO=Conn.Execute("SELECT top 3 tb_id_foto.IDF_id_cob, tb_id_foto.IDF_n_foto, tb_id_foto.IDF_id, Avg(tb_cont_nota_foto.CNF_nota) AS MediaDeCNF_nota, Count(tb_cont_nota_foto.CNF_id) AS ContarDeCNF_id, tb_cobertura.COB_id, tb_cobertura.COB_data, tb_cobertura.COB_nome_festa, tb_local.LOC_end_pasta, tb_local.LOC_nome FROM tb_local RIGHT JOIN (tb_cobertura INNER JOIN (tb_id_foto INNER JOIN tb_cont_nota_foto ON tb_id_foto.IDF_id = tb_cont_nota_foto.CNF_id_foto) ON tb_cobertura.COB_id = tb_id_foto.IDF_id_cob) ON tb_local.LOC_id = tb_cobertura.COB_id_local GROUP BY tb_id_foto.IDF_id_cob, tb_id_foto.IDF_n_foto, tb_id_foto.IDF_id, tb_cobertura.COB_id, tb_cobertura.COB_data, tb_cobertura.COB_nome_festa, tb_local.LOC_end_pasta, tb_local.LOC_nome HAVING (((Count(tb_cont_nota_foto.CNF_id))>3) AND ((tb_cobertura.COB_data)>(Now()-30))) ORDER BY Avg(tb_cont_nota_foto.CNF_nota) DESC , Count(tb_cont_nota_foto.CNF_id) DESC;")%>
<style type="text/css">
<!--
.style1 {color: #FFFFFF}
-->
</style>


		<table width="300" border="0" align="center" cellpadding="4" cellspacing="0" style="border-left:solid 1pt #000000; border-right:solid 1pt #000000">
			<tr bgcolor="#9BB7DC">
			<td height="11" background="imagens/canto02-.gif" bgcolor="#9BB7DC"></td>
			</tr>
			<tr>
			  <td align="center" bgcolor="#FF9C00"><span class="style1">Fotos mais votadas do &uacute;ltimo m&ecirc;s </span></td>
			</tr>
			<% Do while not RSVOTO.EOF %>
			<tr>
			<td bgcolor="#FF9900"><a style="text-decoration:none" href="<%=link_pop_(RSVOTO("COB_id"))%>"><span class="style1">
		      <img src="../fotos/<%=RSVOTO("LOC_end_pasta")%>/<%=data_3(RSVOTO("COB_data"))%>/mini_<%= RSVOTO("IDF_n_foto") %>.JPG" border="0" align="left" ><u><%=RSVOTO("LOC_nome")%></u><br>
		      <%=RSVOTO("COB_data")%><br>
			&quot;<%=RSVOTO("COB_nome_festa")%>&quot;<br>
			nota: <%=Round(2*RSVOTO("MediaDeCNF_nota"),2)%><br>
			<%=RSVOTO("ContarDeCNF_id")%> votos </span></a></td>
		  </tr>
				<% RSVOTO.MoveNext %>
			<% Loop %>
			<tr bgcolor="#9BB7DC">
			<td height="11" background="imagens/canto02-.gif" bgcolor="#9BB7DC"></td>
      		</tr>
</table>
