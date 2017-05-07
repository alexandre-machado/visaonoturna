<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<html>
<head>
<title>Painel - inicio</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<link href="estilo.css" rel="stylesheet" type="text/css">
</head>
<body>
<!--#include file="menu.asp"-->
<%dim d,e
	d=cdate(FormatDateTime (now(),2))-1
	e=d+14
Set RV=conn.execute("SELECT tb_cobertura.COB_data, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto, tb_local.LOC_nome, tb_cobertura.COB_id FROM tb_local RIGHT JOIN (tb_cobertura RIGHT JOIN  (tb_fotografo LEFT JOIN tb_relacao_fot_cob ON tb_fotografo.FOT_id = tb_relacao_fot_cob.REL_id_fotografo) ON tb_cobertura.COB_id = tb_relacao_fot_cob.REL_id_cob) ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE (((tb_fotografo.FOT_id)="&session("painel_id_usu")&") AND ((tb_cobertura.COB_ativo)=yes)) ORDER BY tb_cobertura.COB_data DESC;")
Set RI=conn.execute("SELECT tb_cobertura.COB_data, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto, tb_local.LOC_nome, tb_cobertura.COB_id FROM tb_local RIGHT JOIN (tb_cobertura RIGHT JOIN  (tb_fotografo LEFT JOIN tb_relacao_fot_cob ON tb_fotografo.FOT_id = tb_relacao_fot_cob.REL_id_fotografo) ON tb_cobertura.COB_id = tb_relacao_fot_cob.REL_id_cob) ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE ((tb_cobertura.COB_ativo)=no) ORDER BY tb_cobertura.COB_data DESC;")
Set RP=conn.execute("SELECT tb_cobertura.COB_data, tb_cobertura.COB_nome_festa, tb_cobertura.COB_qt_foto, tb_local.LOC_nome, tb_cobertura.COB_id FROM tb_local RIGHT JOIN tb_cobertura ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE (((tb_cobertura.COB_data)>DateValue(Now()-1))) ORDER BY tb_cobertura.COB_data;")
%>
<br>
<p><br>
</p>
</body>
</html>
