<script>
function checa_mail(nform) {
	if (nform.emaild.value == "") {
		alert("Informe o e-mail de destino.");
		nform.emaild.focus();
		nform.emaild.select();
		return false;
	} else {
		prim = nform.emaild.value.indexOf("@")
		if(prim < 2) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf("@",prim + 1) != -1) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf(".") < 1) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf(" ") != -1) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf("zipmeil.com") > 0) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf("hotmeil.com") > 0) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf(".@") > 0) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf("@.") > 0) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf(".com.br.") > 0) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf("/") > 0) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf("[") > 0) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf("]") > 0) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf("(") > 0) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf(")") > 0) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
		if(nform.emaild.value.indexOf("..") > 0) {
			alert("O e-mail informado parece não estar correto.");
			nform.emaild.focus();
			nform.emaild.select();
			return false;
		}
	}
		return true;
}
</script>
<div style="position: absolute; z-index: 0; top: 77px; display: none; left: 149px;" id="camadabase">
  <div align=right id=camadabarra style="border:0; padding:1px; position:absolute; left:61px; top:13px; height:19px; width:262px; z-index:1">
    <div align="right"><img onClick="onoffdisplay()" src="../images/fechar.bmp" align=absbottom width="17" height="17"></div>
  </div>
  <div style="border:1px solid #FFFFFF; padding:1px; position:absolute; left:62px; top:33px; width:260px; z-index:1; background-color: #FF9900; layer-background-color: #FF9900;" id="camadaconteudo">
    <form style="margin: 0px;" action="email.asp" method="post" name="nform" id="nform" onSubmit="return checa_mail(this);">
      <table border="0" align="center">
        <tr>
          <td><font color="#FFFFFF">seu nome:</font></td>
          <td><input name="nome" type="text" id="nome" value="<%= session("vn_enviaemail-nome") %>"></td>
        </tr>
        <tr>
          <td><font color="#FFFFFF">seu email:</font></td>
          <td><input name="emailr" type="text" id="emailr" value="<%= session("vn_enviaemail-emailr") %>">
          </td>
        </tr>
        <tr>
          <td height="22"><font color="#FFFFFF">email de destino:</font></td>
          <td><input name="emaild" type="text" id="emaild" value="<%= session("vn_enviaemail-emaild") %>">
          </td>
        </tr>
        <tr align="center">
          <td height="22" colspan="2"><input type="hidden" name="end" value="pop_up_foto.asp?foto=<%= n_foto %>&id=<%= Request("id") %>&email=ok">
          <input name="foto" type="hidden" id="foto" value="http://www.visaonoturna.com/fotos/<%=RS("LOC_end_pasta")%>/<%=data_3(RS("COB_data"))%>/<%= n_foto %>.JPG">
              <input type="submit" name="botao" value="Enviar">
          </td>
        </tr>
      </table>
    </form>
  </div>
</div>
<script language="JavaScript" type="text/JavaScript">
	function onoffdisplay(){
	if (camadabase.style.display=='') 
	camadabase.style.display='none'
	else
	camadabase.style.display=''
	}
</script>
