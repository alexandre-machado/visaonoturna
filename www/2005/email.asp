<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<%
dim mensagem%>
'mensagem="<html><body><table width=""100%"" border=""0""><tr><td><p align=""center"">Ol&aacute;, voc&ecirc; recebeu uma foto enviada por: "&request("nome")&"<br><img src="""&request("foto")&""" width=""400"" height=""300"" ><br></p></td></tr></table></body></html>"
<!--#include virtual="/2005/inc_mail_conteudo.asp"-->
<%
IF request("botao") = "Enviar" THEN
	Set Mailer = Server.CreateObject("SMTPsvg.Mailer")
	Mailer.RemoteHost = "visaonoturna.com"
	Mailer.FromAddress = "visaonoturna@visaonoturna.com"'"seu_nome@seudominio.com.br"
	Mailer.FromName = "Site visaonoturna"
	Mailer.AddRecipient "", request.form("emaild")'"teste", request.form("para")
	Mailer.Subject = "Foto do Site visaonoturna"'request.form("assunto")
	Mailer.BodyText = mensagem'request.form("mensagem")
	Mailer.ContentType = "text/html"
 
	On Error Resume Next
	Mailer.SendMail
	Set RS=Conn.Execute("INSERT INTO tb_cad_email (EML_end) VALUES('"&request.form("emaild")&"')")
	session("vn_enviaemail-nome")=request("nome")
	session("vn_enviaemail-emailr")=request("emailr")
	session("vn_enviaemail-emaild")=request("emaild")
	IF Err <> 0 THEN
		Response.Write "Error encountered: " & Err.Description
	ELSE
		Response.Redirect(request.form("end"))
	END IF
END IF
%>