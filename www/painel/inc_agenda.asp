<style type="text/css">
<!--
.form-100{
	color: #FFFFFF;
	background-color: #FFA54A;
	width: 100%;
	border: 1px solid #FFFFFF;
}
.tab-100 {
	background-color: #FF9900;
	width: 100%;
	color: #FFFFFF;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	border: 1px solid #FFFFFF;
}
-->
</style>
	<%Set RL=Conn.Execute("SELECT tb_local.LOC_id, tb_local.LOC_nome FROM tb_local ORDER BY tb_local.LOC_nome;")%>

<form action="http://www.visaonoturna.com/painel/editdb.asp?ac=5" method="post" name="form1" onSubmit="MM_validateForm('datacal','','R');return document.MM_returnValue">
<table align="center" class="tab-100">
  <tr>
    <td><div align="right">dia:</div></td>
    <td><input name="datacal" type="text" id="datacal" value="<%= c1 %>">
      <input class="form" name="bt" type="button" id="cal" value=" ... " onClick="alert('click');">    </td>
  </tr>
  <tr>
    <td><div align="right">nome da festa:</div></td>
    <td><input name="agn_nome" type="text" class="form-100" id="agn_nome"></td>
  </tr>
  <tr>
    <td><div align="right">Informa&ccedil;&otilde;es:</div></td>
    <td><textarea name="agn_info" rows="6" class="form-100" id="agn_info"></textarea></td>
  </tr>
  <tr>
    <td><div align="right">Hora:</div></td>
    <td><input name="agn_hora" type="text" class="form-100" id="agn_hora"></td>
  </tr>
  <tr>
    <td><div align="right">Ingresso:</div></td>
    <td><input name="agn_ingresso" type="text" class="form-100" id="agn_ingresso"></td>
  </tr>
  <tr>
    <td><div align="right">Consuma&ccedil;&atilde;o:</div></td>
    <td><input name="agn_consumacao" type="text" class="form-100" id="agn_consumacao"></td>
  </tr>
  <tr>
    <td><div align="right">local da festa:</div></td>
    <td>	<select name="agn_id_local" class="form-100" id="agn_id_local">
	  <option <% If c3="" Then %>selected<% End If %> >selecione</option><% Do while not RL.EOF %>
	  <option value="<%= RL("LOC_id") %>" <% If c3=RL("LOC_id") Then %>selected<% End If %>><%= RL("LOC_nome") %></option><% RL.MoveNext %><% Loop %>
    </select></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center">
      <input type="submit" name="Submit" value="envia">
      <input type="reset" name="Submit2" value="Redefinir">
      <input type="hidden" name="pag" value="<%= pag %>" />
    </div></td>
    </tr>
</table>
</form>
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
