
<% If request("ac-msg")<>"" Then %>
	<%select case request("ac-msg")
		case 1%>
			<div align="center">
			  <div style="width:200; border:dotted; border-width:1; border-color:#FFFFFF; background-color:#FF9900; color:#FFFFFF">
				<div><%= request("msg") %></div>
			  </div>
			</div>
	<%end select%>
<% End If %>