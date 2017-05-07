<% If session("painel_logado")="1" Then %>
<div class="menu1" align="center"><a href="index.asp?">inicio</a>|<a href="cobertura.asp?">cobertura</a>
<% If session("painel_nivel")>1 Then %>
|<a href="cadfotografo.asp">fot&oacute;grafos</a>|<a href="banco.asp">banco</a><% End If %>
|<a href="perfil.asp?">perfil</a>|<a href="login.asp?ac=1&pag=index.asp">sair</a> Ol&aacute; <%= session("painel_nick") %>(id=<%= session("painel_id_usu") %>)</div>
<% Else
response.Redirect("login.asp")
End If %>
