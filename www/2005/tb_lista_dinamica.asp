<script language="javascript" src="../painel/friendSelect002.js"></script>
<script language="javascript" src="../painel/resize003.js"></script>
<SCRIPT type=text/javascript><!--
  var fs = new FriendSelector();
  var rm = new ResizeManager();
  var id_cob = "";
  function updateMsg() {
    var msg = document.getElementById('msg').value;
    document.getElementById('actualMsg').value = (msg?msg+'\n\n':'') + document.getElementById('templateBody').value;
  }

  function initResizeManager(rmInst) {
    rmInst.add(document.getElementById("addFriend"), 180, 400, 2);
    rmInst.add(document.getElementById("friendList"), 180, 400, 2);
    rmInst.add(document.getElementById("inviteList"), 180, 400, 2);
    rmInst.add(document.getElementById("msg"), 500, 200, 1);
    rmInst.add(document.getElementById("actualMsg"), 500, 200, 1);
    rmInst.resize();
  }
  --></SCRIPT>
<% Set RSDINAMICA=conn.execute("SELECT tb_cobertura.COB_id, tb_cobertura.COB_data, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto, tb_cobertura.COB_ordem, tb_fotografo.FOT_nick, tb_local.LOC_nome FROM tb_local RIGHT JOIN (tb_cobertura LEFT JOIN tb_fotografo ON tb_cobertura.COB_fotografo_id = tb_fotografo.FOT_id) ON tb_local.LOC_id = tb_cobertura.COB_id_local ORDER BY tb_cobertura.COB_data DESC;")
 %><link href="estilo1.css" rel="stylesheet" type="text/css">
<div id="div-lista-dinamica"> Localize as coberturas: <br>
	<select id="friendListMaster" style="display:none">
		<%Do while Not RSDINAMICA.EOF%><option value="<%=RSDINAMICA("COB_id")%>"><%= data_4(RSDINAMICA("COB_data"))&"|"&RSDINAMICA("LOC_nome")&" - "&RSDINAMICA("COB_nome_festa")%></option><%RSDINAMICA.MOVENEXT
		LOOP%>
	</select>
  <INPUT name="Input" id="addFriend" onKeyPress="if (fs.getKeyPressed(event) == 13) { fs.addAllFriends(); fs.addFriend.value=''; return false; }" onKeyUp="fs.filterFriends()"><br>
  <span style="FONT-SIZE: smaller">exibindo <SPAN id="friendCount">0</SPAN> festas <SPAN id="criteria" style="DISPLAY: none">correspondente a "<SPAN id="queryString"></SPAN>"</SPAN></span>
	<select name="id" size="10" id="friendList" onclick="id_cob=this.value;" ondblclick="MM_openBrWindow('../2005/pop_up_index.asp?id='+id_cob,'pop_fotos','width=700,height=356')" >
    </select>
	<script language="javascript">fs.init();</script>
</div>
