<link href="estilo1.css" rel="stylesheet" type="text/css" />
<div id="div-ultimas-lista">
  <div class="barra"></div>
  <div class="cont"><ul id="lista_ultima_lista">
	<%FOR i=0 TO 7 STEP 1%>
  	<li><div class="item"><a href="<%=link_pop_(RS("COB_id"))%>" class="link_pop_player"><%=data_2(RS("COB_data")) & "|<u>" & RS("LOC_nome") & "</u> - " & RS("COB_nome_festa")%></a></div></li>
	<%RS.MoveNext
	NEXT%>
    </ul>
  </div>
  <div class="barra"></div>
</div>
