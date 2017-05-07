<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<%
	Set RS = conn.execute("SELECT tb_cobertura.*, tb_cobertura.COB_data, tb_local.LOC_nome, tb_local.LOC_end_pasta FROM tb_local RIGHT JOIN tb_cobertura ON tb_local.LOC_id = tb_cobertura.COB_id_local ORDER BY tb_cobertura.COB_data DESC;")
	'RS.Open mysql,Conn,1,3
	
	dim n_var,end_var,data_var,i,n_cob,n_fot
%>
<table border="1" width="100%">total de
<%
	do while not RS.EOF%>
		<td>
		<img border="1" title="id n°<%=rs("COB_id")%>" src="../fotos/<%=RS("LOC_end_pasta")%>/<%=data_3(RS("COB_data"))%>/mini_1.jpg" align="left" >foto dia <%=rs("COB_data")%><br>
		<%=rs("COB_id")%> - <%=rs("LOC_nome")%></td></tr>
<%		RS.MoveNext
	loop%>
</table>