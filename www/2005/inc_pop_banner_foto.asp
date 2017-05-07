<% If session("player_in")="1" Then %>
<% Else %>
<% session("player_in")="1"%>
<div id="camadabanner" style="position:absolute; z-index:2; height: 300px; width: 400px;">
  <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
  codebase="http://active.macromedia.com/flash4/cabs/swflash.cab#version=4,0,0,0" width="400" height="300">
    <param name="movie" value="imagens/baner/imagem.v8.swf">
    <param name="quality" value="high">
    <param name="wmode" value="transparent">
    <param name="bgcolor" value="#000000">
    <embed src="imagens/baner/imagem.v8.swf" quality="high" wmode="transparent" bgcolor="#000000"
    width="400" height="300"
    type="application/x-shockwave-flash"
    pluginspage="http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash"> </embed>
  </object>
</div>
<% End If %>