<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<%
	IF IsNumeric(Request("id"))=false THEN
		Response.Write("entrada de dado errada")
	END IF
dim sql,i,e
'mysql= "SELECT tb_cobertura.id, tb_cobertura.qt_foto, tb_cobertura.data, tb_local.nome, tb_local.end_pasta, tb_cobertura.por FROM tb_cat_cob RIGHT JOIN (tb_local RIGHT JOIN (tb_cobertura LEFT JOIN tb_id_foto ON tb_cobertura.id = tb_id_foto.id_cob) ON tb_local.id = tb_cobertura.id_local) ON tb_cat_cob.id = tb_cobertura.id_cat WHERE ((tb_cobertura.id)="&Request("id")&");"
mysql="SELECT tb_cobertura.COB_id, tb_local.LOC_end_pasta, tb_cobertura.COB_data, tb_cobertura.COB_qt_foto FROM tb_local RIGHT JOIN tb_cobertura ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE (((tb_cobertura.COB_id)="&Request("id")&"));"

'Response.Write(mysql)
Set RS=Conn.Execute(mysql)
e=RS("COB_qt_foto")
%>
<html>
<head>
<title>lista</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<script>

/*
Gradual-Highlight Image Script II- 
By J. Mark Birenbaum (birenbau@ugrad.cs.ualberta.ca)
Permission granted to Dynamicdrive.com to feature script in archive
For full source to script, visit http://dynamicdrive.com
*/

nereidFadeObjects = new Object();
nereidFadeTimers = new Object();

/* object - image to be faded (actual object, not name);
 * destop - destination transparency level (ie 80, for mostly solid)
 * rate   - time in milliseconds between trasparency changes (best under 100)
 * delta  - amount of change each time (ie 5, for 5% change in transparency)
 */

function nereidFade(object, destOp, rate, delta){
if (!document.all)
return
    if (object != "[object]"){  //do this so I can take a string too
        setTimeout("nereidFade("+object+","+destOp+","+rate+","+delta+")",0);
        return;
    }
        
    clearTimeout(nereidFadeTimers[object.sourceIndex]);
    
    diff = destOp-object.filters.alpha.opacity;
    direction = 1;
    if (object.filters.alpha.opacity > destOp){
        direction = -1;
    }
    delta=Math.min(direction*diff,delta);
    object.filters.alpha.opacity+=direction*delta;

    if (object.filters.alpha.opacity != destOp){
        nereidFadeObjects[object.sourceIndex]=object;
        nereidFadeTimers[object.sourceIndex]=setTimeout("nereidFade(nereidFadeObjects["+object.sourceIndex+"],"+destOp+","+rate+","+delta+")",rate);
    }
}

</script>
<%'<script language="javascript" src="progressbar.js"></script>%>
<body bgcolor="#000000" background="imagens/pop_up3.gif" leftmargin="0" topmargin="0" Onload="this.focus();">
<table align="center" cellpadding="0" cellspacing="0">
	<%FOR i=1 TO e STEP 1%><tr><td height="5"></td></tr>
		<tr>
		<td width="140" height="105" align="center" bgcolor="#FF9900"><a target="foto" href="pop_up_foto.asp?id=<%=RS("COB_id")%>&foto=<%=i%>">
		<img id="img<%=i%>" src="../fotos/<%=RS("LOC_end_pasta")%>/<%=data_3(RS("COB_data"))%>/mini_<%=i%>.JPG" alt="Foto <%=i%>" border="0" onMouseOver="nereidFade(this,100,30,5);" onMouseOut="nereidFade(this,70,50,5);" style="filter:alpha(opacity=70)"></a></td>
		</tr>
	<%NEXT%>
</table>
</body>
</html>
