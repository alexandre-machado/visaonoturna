<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<!--#include file="menu.asp"-->
<%  
select case Trim(Request.QueryString("ac"))
	case 0
		inclui_cob()
		response.Redirect("index.asp")
	case 1 'deleta registro de cobertura
		deleta_cob()
		response.Redirect("index.asp")
	case 2 'edita cobertura
		edita_cob()
		response.Redirect("index.asp")
	case 3 'inclui fotografo
		inc_fot()
		response.Redirect("cadfotografo.asp")
	case 4 'edita fotografo
		edita_fot()
		response.Redirect("cadfotografo.asp")
	case 5 'inclui agenda
		inc_agenda()
		response.Redirect(request("pag"))
	case 6 'deleta agenda
		del_agenda()
		'response.Redirect("agenda.asp?")
	case else
		response.Redirect("index.asp")
End Select

'Function zera_campo(x)
	'IF isnull(x) THEN
	'	x=0
	'ELSE
	'	zera_campo=x
	'END IF
'End Function

Function inclui_cob()
	dim d, COB_ativo_var, RSSQL
	
	Set RSTESTAFESTA=Conn.Execute("SELECT tb_cobertura.COB_id, tb_cobertura.COB_data, tb_cobertura.COB_id_local FROM tb_cobertura WHERE (((tb_cobertura.COB_data)=DateValue('"&cstr(FormatDateTime (Request("datacal"),2))&"')) AND ((tb_cobertura.COB_id_local)="&Request("COB_id_local")&"));")
	
	If not RSTESTAFESTA.EOF then
		response.Redirect("cobertura.asp?ac-msg=1&msg=Festa já cadastrada!")
	End If
	
	IF Request("COB_ativo")="true" THEN
		COB_ativo_var="true"
	ELSE
		COB_ativo_var="false"
	END IF
	
	RSSQL="INSERT INTO tb_cobertura ("
	RSSQL= RSSQL & "COB_data, "
	RSSQL= RSSQL & "COB_nome_festa, "
	RSSQL= RSSQL & "COB_id_local, "
	RSSQL= RSSQL & "COB_por, "
	RSSQL= RSSQL & "COB_ativo, "
	RSSQL= RSSQL & "COB_qt_foto, "
	RSSQL= RSSQL & "COB_ordem, "
	RSSQL= RSSQL & "COB_fotografo_id, "
	RSSQL= RSSQL & "COB_id_cat"
	RSSQL= RSSQL & ") "
	
	RSSQL= RSSQL & "VALUES("
	RSSQL= RSSQL & "'" &Request("datacal")& "',"
	RSSQL= RSSQL & "'" &replace(Request("COB_nome_festa"),"'","''")& "',"
	RSSQL= RSSQL & "" &cint(Request("COB_id_local"))& ","
	RSSQL= RSSQL & "'" &Request("COB_por")& "',"
	RSSQL= RSSQL & "" &COB_ativo_var& ","
	RSSQL= RSSQL & "" &zera_campo(Request("COB_qt_foto"))& ","
	RSSQL= RSSQL & "" &zera_campo(Request("COB_ordem"))& ","
	RSSQL= RSSQL & "" &session("painel_id_usu")& ","
	RSSQL= RSSQL & "" &cint(Request("cat_cob"))& ""
	RSSQL= RSSQL & ");"
	response.Write(RSSQL)
	Set RS=Conn.Execute(RSSQL)
	d=cstr(FormatDateTime (Request("datacal"),2))
	Set RSS=Conn.Execute("SELECT tb_cobertura.COB_id, tb_cobertura.COB_data, tb_cobertura.COB_id_local FROM tb_cobertura WHERE (((tb_cobertura.COB_data)=DateValue('"&d&"')) AND ((tb_cobertura.COB_id_local)="&Request("COB_id_local")&"));")
		For i=1 to request.Form("CAD_FOT").count
			response.Write("<br>-"&request.Form("CAD_FOT")(i)&"-"&request.Form("CAD_FOT").count&"-")
			response.Write(RSS("COB_id"))
			Set RSU=Conn.Execute("INSERT INTO tb_relacao_fot_cob (REL_id_cob, REL_id_fotografo) VALUES("&RSS("COB_id")&","&Request.form("CAD_FOT")(i)&")")
		Next

End Function

Function deleta_cob()
	If session("painel_id_usu")=2 Then
		Set RS=Conn.Execute("DELETE tb_cobertura.* FROM tb_cobertura WHERE tb_cobertura.COB_id="&replace(request.QueryString("id"),"'","''")&"")
		response.Redirect("index.asp")
	ELSE
		response.Redirect("index.asp")
	END IF
End Function

Function edita_cob()
	dim d, COB_ativo_var, RSSQL
	IF Request("COB_ativo")="true" THEN
		COB_ativo_var="true"
	ELSE
		COB_ativo_var="false"
	END IF

	RSSQL="UPDATE tb_cobertura SET "
	RSSQL= RSSQL & "COB_data='"&Request("datacal")&"', "
	RSSQL= RSSQL & "COB_nome_festa='"&replace(server.HTMLEncode(request("COB_nome_festa")),"'","&quot;")&"', "
	RSSQL= RSSQL & "COB_id_local='"&Request("COB_id_local")&"', "
	RSSQL= RSSQL & "COB_por='"&Request("COB_por")&"', "
	RSSQL= RSSQL & "COB_ativo="&COB_ativo_var&", "
	RSSQL= RSSQL & "COB_qt_foto='"&zera_campo(Request("COB_qt_foto"))&"', "
	RSSQL= RSSQL & "COB_ordem='"&zera_campo(Request("COB_ordem"))&"', "
	RSSQL= RSSQL & "COB_id_cat='"&Request("cat_cob")&"' "
	RSSQL= RSSQL & "WHERE COB_id="&Request("COB_id")&"; "
	
	Set RS=Conn.Execute(RSSQL)
	Set RSS=Conn.Execute("SELECT tb_cobertura.COB_id, tb_fotografo.FOT_id, tb_relacao_fot_cob.REL_id FROM tb_fotografo INNER JOIN (tb_cobertura INNER JOIN tb_relacao_fot_cob ON tb_cobertura.COB_id = tb_relacao_fot_cob.REL_id_cob) ON tb_fotografo.FOT_id = tb_relacao_fot_cob.REL_id_fotografo WHERE (((tb_cobertura.COB_id)="&Request("COB_id")&"));")
	Set RSF=Conn.Execute("SELECT tb_fotografo.FOT_id, tb_fotografo.FOT_nome, tb_fotografo.FOT_nick FROM tb_fotografo;")
	response.Write("<br>")
	dim x
	Do while Not RSF.EOF
	x=0
		For i=1 to request.Form("CAD_FOT").count
			IF cstr(Request("CAD_FOT")(i))=cstr(RSF("FOT_id")) THEN
				Set RSFX=Conn.Execute("SELECT tb_relacao_fot_cob.REL_id_cob, tb_relacao_fot_cob.REL_id_fotografo FROM tb_relacao_fot_cob WHERE (((tb_relacao_fot_cob.REL_id_cob)="&Request("COB_id")&") AND ((tb_relacao_fot_cob.REL_id_fotografo)="&RSF("FOT_id")&"));")
				IF RSFX.EOF THEN
					Set RS=Conn.Execute("INSERT INTO tb_relacao_fot_cob (REL_id_cob, REL_id_fotografo) VALUES("&Request("COB_id")&","&RSF("FOT_id")&")")
				END IF
			Else
			x=x+1
			END IF
		Next
		
		If x=request.Form("CAD_FOT").count Then
			Set RSFY=Conn.Execute("SELECT tb_relacao_fot_cob.REL_id_cob, tb_relacao_fot_cob.REL_id_fotografo FROM tb_relacao_fot_cob WHERE (((tb_relacao_fot_cob.REL_id_cob)="&Request("COB_id")&") AND ((tb_relacao_fot_cob.REL_id_fotografo)="&RSF("FOT_id")&"));")
			IF not RSFY.EOF THEN
			response.Write("deleta")
				Set RS=Conn.Execute("DELETE tb_relacao_fot_cob.*, tb_relacao_fot_cob.REL_id_fotografo, tb_relacao_fot_cob.REL_id_cob FROM tb_relacao_fot_cob WHERE (((tb_relacao_fot_cob.REL_id_fotografo)="&RSF("FOT_id")&") AND ((tb_relacao_fot_cob.REL_id_cob)="&Request("COB_id")&"));")
			END IF
		End If
		
	RSF.MoveNext
	LOOP
End Function

Function inc_fot()
	dim RSSQL

	RSSQL="INSERT INTO tb_fotografo ("
	RSSQL= RSSQL & "FOT_nome, "
	RSSQL= RSSQL & "FOT_nick, "
	RSSQL= RSSQL & "FOT_email, "
	RSSQL= RSSQL & "FOT_info, "
	RSSQL= RSSQL & "FOT_info2, "
	RSSQL= RSSQL & "FOT_senha, "
	RSSQL= RSSQL & "FOT_ativo "
	RSSQL= RSSQL & ") "
	
	RSSQL= RSSQL & "VALUES("
	RSSQL= RSSQL & "'" &replace(Request("FOT_nome"),"'","''")& "',"
	RSSQL= RSSQL & "'" &replace(Request("FOT_nick"),"'","''")& "',"
	RSSQL= RSSQL & "'" &replace(Request("FOT_email"),"'","''")& "',"
	RSSQL= RSSQL & "'" &replace(Request("FOT_info"),"'","''")& "',"
	RSSQL= RSSQL & "'" &replace(Request("FOT_info2"),"'","''")& "',"
	RSSQL= RSSQL & "'" &replace(Request("FOT_senha"),"'","''")& "',"
	RSSQL= RSSQL & "" &f_checkbox(Request("FOT_ativo"))& ""
	RSSQL= RSSQL & ");"
	response.Write(RSSQL)
	Set RS=Conn.Execute(RSSQL)
	
End Function
	
Function edita_fot()


	RSSQL="UPDATE tb_fotografo SET "
	RSSQL= RSSQL & "FOT_nome='"&replace(Request("FOT_nome"),"'","''")&"', "
	RSSQL= RSSQL & "FOT_nick='"&replace(Request("FOT_nick"),"'","''")&"', "
	RSSQL= RSSQL & "FOT_email='"&replace(Request("FOT_email"),"'","''")&"', "
	RSSQL= RSSQL & "FOT_info='"&replace(Request("FOT_info"),"'","''")&"', "
	RSSQL= RSSQL & "FOT_info2='"&replace(Request("FOT_info2"),"'","''")&"', "
	RSSQL= RSSQL & "FOT_senha='"&replace(Request("FOT_senha"),"'","''")&"', "
	RSSQL= RSSQL & "FOT_ativo="&f_checkbox(Request("FOT_ativo"))&" "
	RSSQL= RSSQL & "WHERE FOT_id="&Request("FOT_id")&"; "
	
	'response.Write(RSSQL)
	Set RS=Conn.Execute(RSSQL)
	
End Function

Function inc_agenda()

	dim RSSQL

	RSSQL="INSERT INTO tb_agenda ("
	RSSQL= RSSQL & "agn_data, "
	RSSQL= RSSQL & "agn_nome, "
	RSSQL= RSSQL & "agn_info, "
	RSSQL= RSSQL & "agn_hora, "
	RSSQL= RSSQL & "agn_ingresso, "
	RSSQL= RSSQL & "agn_consumacao, "
	RSSQL= RSSQL & "agn_id_local, "
	RSSQL= RSSQL & "agn_id_fotografo "
	RSSQL= RSSQL & ") "
	
	RSSQL= RSSQL & "VALUES("
	RSSQL= RSSQL & "'" &replace(Request("datacal"),"'","''")& "',"
	RSSQL= RSSQL & "'" &replace(Request("agn_nome"),"'","''")& "',"
	RSSQL= RSSQL & "'" &replace(Request("agn_info"),"'","''")& "',"
	RSSQL= RSSQL & "'" &replace(Request("agn_hora"),"'","''")& "',"
	RSSQL= RSSQL & "'" &replace(Request("agn_ingresso"),"'","''")& "',"
	RSSQL= RSSQL & "'" &replace(Request("agn_consumacao"),"'","''")& "',"
	RSSQL= RSSQL & "" &replace(Request("agn_id_local"),"'","''")& ","
	RSSQL= RSSQL & "" &session("painel_id_usu")& ""
	RSSQL= RSSQL & ");"
	response.Write(RSSQL)
	Set RS=Conn.Execute(RSSQL)

End Function

Function del_agenda()

	If session("painel_logado")="1" Then
		Set RS=Conn.Execute("DELETE tb_agenda.* FROM tb_agenda WHERE tb_agenda.agn_id="&replace(request.QueryString("id"),"'","''")&"")
		response.Redirect("../2005/pag_festas.asp?date="&request("date")&"")
	ELSE
		response.Redirect("../2005/pag_festas.asp?date="&request("date")&"")
	END IF


End Function
%>