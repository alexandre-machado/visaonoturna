<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<html>
<head>
<title>Painel - inicio</title>
<meta http-equiv="Content-Language" content="pt-br">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<script language="javascript" src="friendSelect002.js"></script>
<script language="javascript" src="resize003.js"></script>
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
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<link href="estilo.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {font-size: 10px}
-->
</style>
</head>
<body onLoad="fs.init();">
<!--#include file="menu.asp"-->
<%dim d,e
	d=cdate(FormatDateTime (now(),2))-1
	e=d+14
Set RV=conn.execute("SELECT tb_cobertura.COB_data, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto, tb_local.LOC_nome, tb_cobertura.COB_id, tb_cobertura.COB_fotografo_id FROM tb_local RIGHT JOIN (tb_cobertura RIGHT JOIN  (tb_fotografo LEFT JOIN tb_relacao_fot_cob ON tb_fotografo.FOT_id = tb_relacao_fot_cob.REL_id_fotografo) ON tb_cobertura.COB_id = tb_relacao_fot_cob.REL_id_cob) ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE (((tb_fotografo.FOT_id)="&session("painel_id_usu")&") AND ((tb_cobertura.COB_ativo)=true)) ORDER BY tb_cobertura.COB_data DESC;")

Set RC=conn.execute("SELECT tb_cobertura.COB_id, tb_cobertura.COB_data, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto, tb_cobertura.COB_ordem, tb_fotografo.FOT_nick, tb_local.LOC_nome FROM tb_local RIGHT JOIN (tb_cobertura LEFT JOIN tb_fotografo ON tb_cobertura.COB_fotografo_id = tb_fotografo.FOT_id) ON tb_local.LOC_id = tb_cobertura.COB_id_local ORDER BY tb_cobertura.COB_id DESC;")

Set RI=conn.execute("SELECT DISTINCTROW tb_cobertura.COB_data, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto, tb_local.LOC_nome, tb_cobertura.COB_id, tb_cobertura.COB_ativo, tb_cobertura.COB_fotografo_id, tb_fotografo.FOT_nick FROM (tb_local RIGHT JOIN tb_cobertura ON tb_local.LOC_id = tb_cobertura.COB_id_local) LEFT JOIN tb_fotografo ON tb_cobertura.COB_fotografo_id = tb_fotografo.FOT_id WHERE (((tb_cobertura.COB_data)<DateValue(Now())) AND ((tb_cobertura.COB_ativo)=False)) OR (((tb_cobertura.COB_data)<DateValue(Now())) AND ((tb_cobertura.COB_ordem)<1)) ORDER BY tb_cobertura.COB_data DESC;")

Set RP=conn.execute("SELECT tb_cobertura.COB_data, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto, tb_local.LOC_nome, tb_cobertura.COB_id, tb_cobertura.COB_ativo, tb_cobertura.COB_fotografo_id, tb_fotografo.FOT_nick FROM (tb_local RIGHT JOIN tb_cobertura ON tb_local.LOC_id = tb_cobertura.COB_id_local) LEFT JOIN tb_fotografo ON tb_cobertura.COB_fotografo_id = tb_fotografo.FOT_id WHERE (((tb_cobertura.COB_data)>DateValue(Now()-1)) AND ((tb_cobertura.COB_ativo)=False)) ORDER BY tb_cobertura.COB_data;")

Set RSR=conn.execute("SELECT TOP 10 tb_cobertura.COB_id, tb_relacao_fot_cob.REL_id, tb_cobertura.COB_data, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto, tb_cobertura.COB_id, tb_cobertura.COB_fotografo_id FROM tb_cobertura LEFT JOIN tb_relacao_fot_cob ON tb_cobertura.COB_id = tb_relacao_fot_cob.REL_id_cob WHERE (((tb_relacao_fot_cob.REL_id) Is Null)) ORDER BY tb_cobertura.COB_id DESC;")
%>
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="4" bordercolor="#FFFFFF">
  <tr>
    <td width="50%" valign="top">
	<% If session("painel_nivel")>1 Then %>
      <form class="form" name="form1" method="post" action="cobertura.asp?ac=1">
        <p align="center" class="style1">identifica&ccedil;&atilde;o da festa: 
          <input name="id" type="text" class="form" id="id" size="8">
          <input name="Submit" type="submit" class="form" id="Submit" value="editar">
        </p>
      </form><br><% End If %>
      
      <table width="100%" bordercolor="#FFFFFF" class="table">
        <tr>
          <td width="100%">Localize coberturas: <br>
            <INPUT name="Input" class="form100" id="addFriend" onKeyPress="if (fs.getKeyPressed(event) == 13) { fs.addAllFriends(); fs.addFriend.value=''; return false; }" onKeyUp="fs.filterFriends()">
          <span style="FONT-SIZE: smaller">exibindo <SPAN id="friendCount">0</SPAN> festas <SPAN id="criteria" style="DISPLAY: none">correspondente a <SPAN id="queryString"></SPAN></SPAN></span></td>
        </tr>
        <tr>
          <td width="100%"><form style="margin:0" name="form2" method="post" action="cobertura.asp?ac=1">
            <div align="center" style="width:100%">
              <select name="id" size="10" class="form100" id="friendList" onclick="id_cob=this.value;" ondblclick="MM_openBrWindow('../2005/pop_up_index.asp?id='+id_cob,'pop_fotos','width=700,height=356')" >
                </select>
              <select id="friendListMaster" style="display:none">
                <%Do while Not RC.EOF%><option value="<%=RC("COB_id")%>"><%=RC("COB_id")%> - <%= data_4(RC("COB_data"))&"|"&RC("COB_nome_festa")&"-"&RC("LOC_nome")%></option><%RC.MOVENEXT
			LOOP%>
              </select>
              <input name="Button" type="button" onClick="MM_openBrWindow('../2005/pop_up_index.asp?id='+id_cob,'pop_fotos','width=700,height=356')" value="visualisar">
              <% If session("painel_nivel")>1 Then %>
              <input type="submit" value="editar">
              <% End If %>
            </div>
          </form>          </td>
        </tr>
      </table>
        </p>
        <table width="100%" bordercolor="#FFFFFF" class="table">
        <tr>
          <td>festas cobertas por voc&ecirc;:</td>
        </tr>
        <tr>
          <td><% If RV.EOF Then %>
voc&ecirc; ainda n&atilde;o tirou fotos
<% Else
	Do while Not RV.EOF%>
<% If session("painel_nivel")>1 Or RV("COB_fotografo_id")=session("painel_id_usu") Then %>
<a href="cobertura.asp?ac=1&id=<%=RV("COB_id")%>"><img src="../2005/imagens/edita.gif" width="17" height="17" border="0" align="middle"></a>
<% End If %> <a href="<%=link_pop_(RV("COB_id"))%>" ><%= nome_(data_4(RV("COB_data"))&" - "&RV("COB_nome_festa"),35)%></a><br>
<%RV.MOVENEXT
	LOOP
End If %></td>
        </tr>
      </table>
      <br>    </td>
    <td width="50%" valign="top" bordercolor="#FFFFFF">
	<table width="100%" bordercolor="#FFFFFF" class="table">
        <tr>
          <td>proximas festas:</td>
        </tr>
        <tr>
          <td><% If RP.EOF Then %>
n&atilde;o existem festas marcadas
<% Else
		Do while Not RP.EOF%>
&radic; <% If session("painel_nivel")>1 Or cint(RP("COB_fotografo_id"))=session("painel_id_usu") Then %>
<a href="cobertura.asp?ac=1&id=<%=RP("COB_id")%>"><img src="../2005/imagens/edita.gif" width="17" height="17" border="0" align="middle"></a>
<% End If %><%= data_4(RP("COB_data"))&"("&RP("FOT_nick")&") - <u>"&RP("LOC_nome")&"</u>|"&RP("COB_nome_festa")%><br>
<%RP.MOVENEXT
		LOOP
	End If %></td>
        </tr>
      </table>
	  <br><table width="100%" bordercolor="#FFFFFF" class="table">
        <tr>
          <td>festas inativas: </td>
        </tr>
        <tr>
          <td><% If RI.EOF Then %>
n&atilde;o existem festas inativas
<% Else
	Do while Not RI.EOF%>
<% If session("painel_nivel")>1 Or RI("COB_fotografo_id")=session("painel_id_usu") Then %>
<a href="cobertura.asp?ac=1&id=<%=RI("COB_id")%>"><img src="../2005/imagens/edita.gif" width="17" height="17" border="0" align="middle"></a>
<% End If %> <%= data_4(RI("COB_data"))&"("&RI("FOT_nick")&") - <u>"&RI("LOC_nome")&"</u>|"&RI("COB_nome_festa")%>  <br>
<%RI.MOVENEXT
	LOOP
End If %></td>
        </tr>
    </table><br>
      <table width="100%" bordercolor="#FFFFFF" class="table">
              <tr>
                <td>cobertura sem relacionamento: </td>
              </tr>
              <tr>
                <td><% If RSR.EOF Then %>
n&atilde;o existem festas marcadas
<% Else
		Do while Not RSR.EOF%>
<% If session("painel_nivel")>1 Or RSR("COB_fotografo_id")=session("painel_id_usu") Then %><a href="cobertura.asp?ac=1&id=<%=RSR("COB_id")%>"><img src="../2005/imagens/edita.gif" width="17" height="17" border="0" align="middle"></a><% End If %> <a href="<%=link_pop_(RSR("COB_id"))%>" ><%= nome_(data_4(RSR("COB_data"))&" - "&RSR("COB_nome_festa"),35)%></a><br>
<%RSR.MOVENEXT
		LOOP
	End If %></td>
              </tr>
    </table>
    <br>
    <table width="100%" bordercolor="#FFFFFF" class="table">
      <tr>
        <td><p>data de inicio do servidor: <%=application("DataHoraI") %><br>
          numero de usu&aacute;rios online no site: <%=application("num_usuarios") %><br>
          fotografos logados: <%=application("painel-usuarios") %></p>
          </td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</body>
</html>
