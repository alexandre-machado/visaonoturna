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
End Function

dim c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,xx
xx=request.QueryString("ac")
select case xx
	case "1"
		Set RO=Conn.Execute("SELECT tb_cobertura.* FROM tb_cobertura ORDER BY tb_cobertura.COB_ordem DESC;") 'lista ultimo valor de ordenação
		Set RE=Conn.Execute("SELECT tb_cobertura.*, tb_cobertura.COB_id FROM tb_cobertura WHERE (((tb_cobertura.COB_id)="&Request("id")&"));")
		c1=RE("COB_data")
		c2=RE("COB_nome_festa")
		c3=RE("COB_id_local")
		c4=RE("COB_id_cat")
		c5=RE("COB_ativo")
		c6=RE("COB_id")
		c7=""
		c8=RE("COB_por")
		c9=RE("COB_qt_foto")
		c10=RE("COB_ordem")
		b1="editar"
		b2="editdb.asp?ac=2"
		b3="<a href=""editdb.asp?ac=1&id=" &Request("id")&""">apagar</a>"
		t1=RO("COB_ordem")
	case else
		Set RO=Conn.Execute("SELECT tb_cobertura.* FROM tb_cobertura ORDER BY tb_cobertura.COB_ordem DESC;") 'lista ultimo valor de ordenação
		c1=""
		c2=""
		c3=""
		c4=""
		c5=""
		c6=""
		c7=""
		c8=""
		c9=""
		c10=""
		b1="enviar"
		b2="editdb.asp?ac=0"
		b3=""
		t1=RO("COB_ordem")
End select%><br>
<!--#include file="msg.asp"-->
<form action="<%= b2 %>" method="post" name="form1" onSubmit="MM_validateForm('datacal','','R');return document.MM_returnValue">
<table align="center" class="table">
  <tr>
    <td><div align="right">dia:</div></td>
    <td><input name="datacal" type="text" class="form" id="datacal" value="<%= c1 %>">
      <input class="form" name="bt" type="button" id="cal" value=" ... " onClick="alert('click');">    </td>
  </tr>
  <tr>
    <td><div align="right">nome da festa:</div></td>
    <td><input class="form" name="COB_nome_festa" type="text" size="50" value="<%= c2 %>"></td>
  </tr>
  <tr>
    <td><div align="right">local da festa:</div></td>
    <td>	<select name="COB_id_local" class="form100">
	  <option <% If c3="" Then %>selected<% End If %> >selecione</option><% Do while not RL.EOF %>
	  <option value="<%= RL("LOC_id") %>" <% If c3=RL("LOC_id") Then %>selected<% End If %>><%= RL("LOC_nome") %></option><% RL.MoveNext %><% Loop %>
    </select></td>
  </tr>
    <tr>
      <td><div align="right">categoria: </div></td>
      <td><select class="form100" name="cat_cob">
        <option <% If c4="" Then %>selected<% End If %> >selecione</option>
        <% Do while not RC.EOF %>
        <option value="<%= RC("CAC_id") %>" <% If c4=RC("CAC_id") Then %>selected<% End If %>><%= RC("CAC_nome") %></option>
        <% RC.MoveNext %>
        <% Loop %>
      </select></td>
    </tr>
    <tr>
      <td><div align="right">ativada:</div></td>
      <td><input name="COB_ativo" type="checkbox" class="form" id="COB_ativo" onClick="onoffdisplay(camada_qt_ordem)" value="true"<% If c5=true Then %> checked <% End If %>>
        <div class="table" id="camada_qt_ordem" style="position:absolute; border-width:0; display:none"><% If c5=true Then %><script language="javascript">onoffdisplay('camada_qt_ordem');</script><% End If %>
        n&ordm; foto:
        <input name="COB_qt_foto" type="text" class="form" value="<%= c9 %>" size="5">
        ordem:
      <input name="COB_ordem" type="text" class="form" value="<%= c10 %>" size="6"> <font size="2"><%= t1 %></font></div></td>
    </tr>
    <tr>
    <td><div align="right">fotografos:</div></td>
    <td><% Do while Not RF.EOF %>
      <input type="checkbox" class="form" name="CAD_FOT" value="<%= RF("FOT_id") %>" id="<%= RF("FOT_id") %>" <%= testa_fotografo(RF("FOT_id")) %>>
      <label for="<%= RF("FOT_id") %>"><u><%= RF("FOT_nick") %></u> (<span class="style3"><%= RF("FOT_nome") %></span>)</label>
      <Br>
	<% RF.MOVENEXT %><% LOOP %>
	<input name="COB_por" type="text" class="form" id="COB_por" value="<% =c8 %>">
	<span class="style5">	preencher caso fotografo n&atilde;o esteja listado.</span> </td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <input type="submit" name="Submit" value="<%= b1 %>">
      <input type="reset" name="Submit2" value="Redefinir">
      <input type="hidden" name="COB_id" value="<%= c6 %>">
      <%= b3 %></div></td>
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
