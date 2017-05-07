<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<html>
<head>
<title>Painel - cobertura</title>
<link href="estilo.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Language" content="pt-br">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">		<link rel="stylesheet" type="text/css" media="all" href="../zpcal/themes/winxp.css" title="winxp" >
		<script type="text/javascript" src="../zpcal/src/utils.js"></script>
		<script type="text/javascript" src="../zpcal/src/calendar.js"></script>
		<script type="text/javascript" src="../zpcal/lang/calendar-br.js"></script>
		<script type="text/javascript" src="../zpcal/src/calendar-setup.js"></script>
        <script type="text/JavaScript">
<!--
function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function onoffdisplay(x){
	if (x.style.display=='') 
	x.style.display='none'
	else
	x.style.display=''
}

function MM_validateForm() { //v4.0
  var i,p,q,nm,test,num,min,max,errors='',args=MM_validateForm.arguments;
  for (i=0; i<(args.length-2); i+=3) { test=args[i+2]; val=MM_findObj(args[i]);
    if (val) { nm=val.name; if ((val=val.value)!="") {
      if (test.indexOf('isEmail')!=-1) { p=val.indexOf('@');
        if (p<1 || p==(val.length-1)) errors+='- '+nm+' must contain an e-mail address.\n';
      } else if (test!='R') { num = parseFloat(val);
        if (isNaN(val)) errors+='- '+nm+' deve conter um número.\n';
        if (test.indexOf('inRange') != -1) { p=test.indexOf(':');
          min=test.substring(8,p); max=test.substring(p+1);
          if (num<min || max<num) errors+='- '+nm+' must contain a number between '+min+' and '+max+'.\n';
    } } } else if (test.charAt(0) == 'R') errors += '- '+nm+' é necessário.\n'; }
  } if (errors) alert('O seguinte erro ocorreu:\n'+errors);
  document.MM_returnValue = (errors == '');
}
//-->
</script>
        <style type="text/css">
<!--
.style3 {font-size: 12px}
.style5 {
	font-size: 10px;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
-->
        </style>
</head>
<body>
<!--#include file="menu.asp"-->
	<%Set RL=Conn.Execute("SELECT tb_local.LOC_id, tb_local.LOC_nome FROM tb_local ORDER BY tb_local.LOC_nome;")%>
	<%Set RC=Conn.Execute("SELECT tb_cat_cob.* FROM tb_cat_cob ORDER BY tb_cat_cob.CAC_nome;")%>
	<%Set RF=Conn.Execute("SELECT tb_fotografo.FOT_id, tb_fotografo.FOT_nome, tb_fotografo.FOT_nick FROM tb_fotografo ORDER BY tb_fotografo.FOT_nick;")%>
	<%IF Request("id")<>"" THEN
	Set RLF=Conn.Execute("SELECT tb_relacao_fot_cob.REL_id_cob, tb_relacao_fot_cob.REL_id_fotografo FROM tb_relacao_fot_cob WHERE ((tb_relacao_fot_cob.REL_id_cob)="&Request("id")&");")
	END IF

Function testa_fotografo(x)
	IF Request("id")<>"" THEN
		If not RLF.EOF Then
			RLF.MoveFirst
			DO while not RLF.EOF 
				IF x=RLF("REL_id_fotografo") THEN
					testa_fotografo="checked"
				END IF
				RLF.MoveNext
			LOOP
			RLF.MoveFirst
		END IF
	End If
End Function%>
<% If request("ac-msg")<>"" Then %>
<br>
<!--#include file="msg.asp"-->
<% End If %>
<form action="editdb.asp?ac=5" method="post" name="form1" onSubmit="MM_validateForm('datacal','','R');return document.MM_returnValue">
<table align="center" class="table">
  <tr>
    <td><div align="right">dia:</div></td>
    <td><input name="datacal" type="text" class="form" id="datacal">
      <input class="form" name="bt" type="button" id="cal" value=" ... " onClick="alert('click');">    </td>
  </tr>
  <tr>
    <td><div align="right">nome da festa:</div></td>
    <td><input name="agn_nome" type="text" class="form" id="agn_nome" size="50"></td>
  </tr>
  <tr>
    <td><div align="right">Informa&ccedil;&otilde;es:</div></td>
    <td><textarea name="agn_info" rows="6" class="form100" id="agn_info"></textarea></td>
  </tr>
  <tr>
    <td><div align="right">Hora:</div></td>
    <td><input name="agn_hora" type="text" class="form" id="agn_hora" size="50"></td>
  </tr>
  <tr>
    <td><div align="right">Ingresso:</div></td>
    <td><input name="agn_ingresso" type="text" class="form" id="agn_ingresso" size="50"></td>
  </tr>
  <tr>
    <td><div align="right">Consuma&ccedil;&atilde;o:</div></td>
    <td><input name="agn_consumacao" type="text" class="form" id="agn_consumacao" size="50"></td>
  </tr>
  <tr>
    <td><div align="right">local da festa:</div></td>
    <td>	<select name="agn_id_local" class="form100" id="agn_id_local">
	  <option <% If c3="" Then %>selected<% End If %> >selecione</option><% Do while not RL.EOF %>
	  <option value="<%= RL("LOC_id") %>" <% If c3=RL("LOC_id") Then %>selected<% End If %>><%= RL("LOC_nome") %></option><% RL.MoveNext %><% Loop %>
    </select></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <input type="submit" name="Submit" value="envia">
      <input type="reset" name="Submit2" value="Redefinir">
    </div></td>
    </tr>
</table>
</form>
</body>
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
</html>
<% Conn.Close
Set Conn = Nothing
 %>
