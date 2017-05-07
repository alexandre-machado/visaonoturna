<% dim nota,vy,vz
nota=0
vy=0
vz=0
IF NOT RF.EOF THEN
	Set RN=Conn.Execute("SELECT tb_id_foto.IDF_id, tb_cont_nota_foto.CNF_nota FROM tb_id_foto INNER JOIN tb_cont_nota_foto ON tb_id_foto.IDF_id = tb_cont_nota_foto.CNF_id_foto WHERE (((tb_id_foto.IDF_id)="&RF("IDF_id")&"));")
	DO WHILE NOT RN.EOF
		vz=vz+RN("CNF_nota")
		RN.MoveNext
		vy=vy+1
		nota=vz/vy
	LOOP
	'RF.Movefirst
END IF
Function cheqestar(xy)
	IF xy>nota THEN
		cheqestar="imagens/star2.gif"
	ELSE
		cheqestar="imagens/star1.gif"
	END IF
End Function
Function votos()
	Select case vy
		case 0
		votos="nenhum voto"
		case 1
		votos=vy&" voto"
		case else
		votos=vy&" votos"
	End select
End Function
%>
<div id="basepornota" style="position:absolute; width:100%; z-index:3; height: 100%;">
	<div id="por" style="position:absolute; z-index:2;"><font color="#FF9900" size="1">Por:</font><font color="#FF9900" size="1"><%= nome_(por_(RS("COB_id")),38) %></font><font color="#FF9900" size="2"><br>
		<% If session("ft"&cstr(RF("IDF_id")))<>"1" AND session("ok")="1" Then %>
<a href="pop_up_foto.asp?foto=<%= n_foto %>&id=<%= Request("id") %>&ac=1&vt=1"><img src="<%= cheqestar(1) %>" alt="nota 1" name="nota1" width="12" height="12" border="0" align="absmiddle" id="nota1" onMouseOver="MM_swapImage('nota1','','imagens/star3.gif',1)" onMouseOut="MM_swapImgRestore()"></a><a href="pop_up_foto.asp?foto=<%= n_foto %>&id=<%= Request("id") %>&ac=1&vt=2"><img src="<%= cheqestar(2) %>" alt="nota 2" name="nota2" width="12" height="12" border="0" align="absmiddle" id="nota2" onMouseOver="MM_swapImage('nota2','','imagens/star3.gif',1)" onMouseOut="MM_swapImgRestore()"></a><a href="pop_up_foto.asp?foto=<%= n_foto %>&id=<%= Request("id") %>&ac=1&vt=3"><img src="<%= cheqestar(3) %>" alt="nota 3" name="nota3" width="12" height="12" border="0" align="absmiddle" id="nota3" onMouseOver="MM_swapImage('nota3','','imagens/star3.gif',1)" onMouseOut="MM_swapImgRestore()"></a><a href="pop_up_foto.asp?foto=<%= n_foto %>&id=<%= Request("id") %>&ac=1&vt=4"><img src="<%= cheqestar(4) %>" alt="nota 4" name="nota4" width="12" height="12" border="0" align="absmiddle" id="nota4" onMouseOver="MM_swapImage('nota4','','imagens/star3.gif',1)" onMouseOut="MM_swapImgRestore()"></a><a href="pop_up_foto.asp?foto=<%= n_foto %>&id=<%= Request("id") %>&ac=1&vt=5"><img src="<%= cheqestar(5) %>" alt="nota 5" name="nota5" width="12" height="12" border="0" align="absmiddle" id="nota5" onMouseOver="MM_swapImage('nota5','','imagens/star3.gif',1)" onMouseOut="MM_swapImgRestore()"></a>
		<% Else %>
			<img src="<%= cheqestar(1) %>" width="12" height="12" border="0" align="absmiddle"><img src="<%= cheqestar(2) %>" width="12" height="12" border="0" align="absmiddle"><img src="<%= cheqestar(3) %>" width="12" height="12" border="0" align="absmiddle"><img src="<%= cheqestar(4) %>" width="12" height="12" border="0" align="absmiddle"><img src="<%= cheqestar(5) %>" width="12" height="12" border="0" align="absmiddle">
		<% End If %>
 </font><font color="#FF9900" size="1"> <%= votos() %></font></div>
</div>
