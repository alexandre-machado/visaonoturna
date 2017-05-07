<%IF IsNull(RS("LOC_link_foto")) THEN
	IF NOT IsNULL(RS("LOC_site")) THEN%>
		<a style="color:#FFFFFF; text-decoration:none" target="_blank" href="http://<%= RS("LOC_site") %>"><%= RS("LOC_nome") %></a><br>
	<% ELSE %>
		<%= RS("LOC_nome") %><br>
	<% END IF %>
	<% IF NOT ISNull(RS("LOC_fone")) THEN %>
		fone: <%= RS("LOC_fone") %><br>
	<% END IF %>
<% ELSE %>
	<img src="imagens/casas/<%= RS("LOC_link_foto") %>" width=120>
<% END IF %>
	