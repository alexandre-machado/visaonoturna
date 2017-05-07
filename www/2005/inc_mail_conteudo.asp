<%
dim por
mensagem= mensagem & "<html xmlns=""http://www.w3.org/1999/xhtml"">"
mensagem= mensagem & "<head><meta http-equiv=""Content-Type"" content=""text/html; charset=iso-8859-1"" /><title>email</title>"
mensagem= mensagem & "</head><body>"
mensagem= mensagem & "<table width=""50%"" border=""0"" align=""center"" cellpadding=""6"" cellspacing=""0"">"
mensagem= mensagem & "  <tr>"
mensagem= mensagem & "    <td height=""11"" background=""http://www.visaonoturna.com/2005/imagens/canto02-.gif""></td>"
mensagem= mensagem & "  </tr>"
mensagem= mensagem & "  <tr>"
mensagem= mensagem & "    <td bgcolor=""#FF9900""><font color=""#FFFFFF"" face=""Verdana, Arial, Helvetica, sans-serif"" size=""2px""><p align=""center"" >Ol&aacute;,"
mensagem= mensagem & "      Voc&ecirc; recebeu uma foto do site <a href=""http://www.visaonoturna.com/"">www.visaonoturna.com</a> enviada por: "
if request("nome")="" then
 por="anonimo" 
else
 por=request("nome")
end if
mensagem= mensagem & por & "</p></font>"
mensagem= mensagem & "        <p align=""center""><br />"
mensagem= mensagem & "            <img src="""&request("foto")&""" width=""400"" height=""300"" /><br />"
mensagem= mensagem & "      </p></td>"
mensagem= mensagem & "  </tr>"
mensagem= mensagem & "  <tr>"
mensagem= mensagem & "    <td height=""11"" background=""http://www.visaonoturna.com/2005/imagens/canto02-.gif""></td>"
mensagem= mensagem & "  </tr>"
mensagem= mensagem & "</table></body></html>"
%>
