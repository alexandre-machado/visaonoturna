<%
Set RB=Conn.Execute("SELECT tb_banner.BAN_id, tb_banner.BAN_cont, tb_banner.BAN_end_banner, tb_banner.BAN_end_link, tb_banner.BAN_alt FROM tb_banner WHERE ((tb_banner.BAN_liberado=Yes) AND (tb_banner.BAN_data_inicio<Now()) And (tb_banner.BAN_data_fim>Now())) ORDER BY tb_banner.BAN_id DESC;")
dim matriz(4,4),x(4)
matriz(1,1)=RB("BAN_end_banner")
matriz(1,2)=RB("BAN_end_link")
matriz(1,3)=RB("BAN_alt")
matriz(1,4)=RB("BAN_cont")
RB.MoveNext
matriz(2,1)=RB("BAN_end_banner")
matriz(2,2)=RB("BAN_end_link")
matriz(2,3)=RB("BAN_alt")
matriz(2,4)=RB("BAN_cont")
RB.MoveNext
matriz(3,1)=RB("BAN_end_banner")
matriz(3,2)=RB("BAN_end_link")
matriz(3,3)=RB("BAN_alt")
matriz(3,4)=RB("BAN_cont")
RB.MoveNext
matriz(4,1)=RB("BAN_end_banner")
matriz(4,2)=RB("BAN_end_link")
matriz(4,3)=RB("BAN_alt")
matriz(4,4)=RB("BAN_cont")

'matriz(1,1)="imagens/anuncio2.gif"
'matriz(1,2)=""
'matriz(2,1)="imagens/baner/logo_mercbruxa.gif"' data 2/8/2005
'matriz(2,2)="javascript:MM_openBrWindow('tb_dicamercbruxa.asp?acao=6','bannerbruxa','status=yes,scrollbars=yes,resizable=yes,width=350,height=300')"
'matriz(3,1)="imagens/anuncio3.gif"
'matriz(3,2)=""
'matriz(4,1)="imagens/anuncio4.gif"
'matriz(4,2)=""
Randomize
FOR y=1 TO 4 STEP 1
	x(y)=trim(Int(4*Rnd)+1)
	IF InStr(mid(join(x),1,y*2-2),x(y))<>0 THEN
	y=y-1
	END IF
NEXT
%>
<table width="100%" border="0">
  <%
	FOR i=1 TO 4 STEP 1
		IF Isnull(matriz(x(i),4)) THEN
			IF Isnull(matriz(x(i),2)) THEN%>
				<tr>
				  <td align="center"><img src="<%= matriz(x(i),1) %>" width="120" height="60"></td>
				</tr>
			<%ELSE%>
				<tr>
				  <td align="center"><a <% If trim(mid(matriz(x(i),2),1,4))<>"java" Then %>target="_blank"<% End If %> href="<%= matriz(x(i),2) %>"><img src="<%= matriz(x(i),1) %>" alt="<%= matriz(x(i),3) %>" width="120" height="60" border="0"></a></td>
				</tr>
			<%END IF
		ELSE%>
			<tr>
			  <td align="center"><%= matriz(x(i),4) %></td>
			</tr>
		<%END IF
	NEXT%>
</table>