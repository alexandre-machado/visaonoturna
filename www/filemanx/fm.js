// #############################################################################
// FileMan core javascript functions
// For more information see: http://www.iisworks.com
// #############################################################################

function setntfs(){
for (var f, n=0, DL=document.listform, i=0; i<DL.elements.length; i++) {if ((DL.elements[i].name.indexOf('f')> -1)) {if (DL.elements[i].checked){n=n+1; }}}
if (n>0) {
		document.listform.action="ntfs.asp";
		document.listform.submit();}
else {
	alert(sel_item_msg)
}}

function SubmitForm(action){
for (var f, n=0, DL=document.listform, i=0; i<DL.elements.length; i++) {if ((DL.elements[i].name.indexOf('f')> -1)) {if (DL.elements[i].checked){n=n+1; }}}
if (n>0) {
	document.listform.action=action;
	document.listform.submit();
	}
else {
	alert(sel_item_msg)
}}

var c = 0;
function showTooltip (el) {
  if (!el.tooltip) {
    var html = '<DIV ID="tooltip' + c + '" CLASS="tooltip"><\/DIV>';
    document.body.insertAdjacentHTML('beforeEnd', html);
    el.tooltip = document.all['tooltip' + c++];
  }
  el.tooltip.innerHTML = el.title;
  el.tooltip.style.left = event.x + 'px';
  el.tooltip.style.top = (event.y + el.offsetHeight) + 'px';
  el.tooltip.style.visibility = 'visible';
  window.status=el.title;
}
function hideTooltip (el) {
  if (el.tooltip)
    el.tooltip.style.visibility = 'hidden';
    window.status='';
}

if (document.layers){
	 document.captureEvents(Event.KEYPRESS);
	 document.onkeypress=function (evt) {
		 var key=document.all ? event.keyCode : evt.which ? evt.which : evt.keyCode;
		 if (key==13)
		 this.form.submit();
	}
}

function ToggleCheckItems(){
	var newstatus=((document.listform.elements[0].checked) != true);
	for (var i=0;i<document.listform.elements.length;i++) {
		var e=document.listform.elements[i];
		if (e.name !='allbox'){
			e.checked = newstatus;
		}
	}
}

function CheckAll(){
	for (var i=0;i<document.listform.elements.length;i++) {
		var e=document.listform.elements[i];
		if (e.name !='allbox'){
			e.checked=document.listform.allbox.checked;
		}
	}
}

function viewDBlog(msg){
	var findstr=prompt(msg,"");
	if (findstr!=null)
	{
		document.listform.action="admin.asp?a=showdblog&findstr="+escape(findstr);
		document.listform.submit();
	}
}

function CheckFileTypes(ext){
	var ext=ext.toUpperCase();
	for (var i=0;i<document.listform.elements.length;i++) {
		var e=document.listform.elements[i];
		var fext=e.value.toUpperCase().substring(e.value.lastIndexOf('.') + 1,e.value.length);
		if ((e.name != 'allbox') && (fext == ext)) {
			e.checked=(e.checked != true);
		}
	}
}

function encrypt(msg){
for (var f, n=0, DL=document.listform, i=0; i<DL.elements.length; i++) {if ((DL.elements[i].name.indexOf('f')> -1)) {if (DL.elements[i].checked){f=DL.elements[i].value;n=n+1; }}}
if (n>0) {
	var key=prompt(msg,"");
	if ((key!="") && (key!=null))
	{
		document.listform.action="fileman.asp?a=encrypt";
		document.listform.key.value=key;
		document.listform.submit();
	}}
else {
	alert(sel_item_msg);
}
}

function saveurl(msg){
	var url=prompt(msg,"");
	if ((url!="") && (url!=null))
	{
		document.listform.action="fileman.asp?a=saveurl&url=" + escape(url);
		document.listform.submit();
	}
}

function FMPopup(URL) {
	newwindow=window.open(URL,Math.floor(Math.random() * 99999),"height=520,width=650,location=no,menubar=no,resizable=yes,scrollbars=yes,status=no,toolbar=no");
	newwindow.focus();
}

function copytext(s) {
	window.clipboardData.setData("Text", s);
}

function newfolder(msg){
	var folder=prompt(msg,"");
	if ((folder!="") && (folder!=null))
	{
		document.listform.action="fileman.asp?a=newfolder&newfolder=" + escape(folder);
		document.listform.submit();
	}
}

function viewlog(msg,f){
	var findstr=prompt(msg,"");
	if (findstr!=null)
	{
		document.listform.action="fileman.asp?a=findtext&f="+ escape(f) + "&findstr="+escape(findstr);
		document.listform.submit();
	}
}

function findtext(msg){
for (var f, n=0, DL=document.listform, i=0; i<DL.elements.length; i++) {if ((DL.elements[i].name.indexOf('f')> -1)) {if (DL.elements[i].checked){n=n+1; }}}
if (n>0){
	var findstr=prompt(msg,"");
	if (findstr!=null)
	{
		document.listform.action="fileman.asp?a=findtext&findstr="+escape(findstr);
		document.listform.submit();
	}}
else {
	alert(sel_item_msg)
}}

function attribs(msg){
for (var f, n=0, DL=document.listform, i=0; i<DL.elements.length; i++) {if ((DL.elements[i].name.indexOf('f')> -1)) {if (DL.elements[i].checked){n=n+1; }}}
if (n>0) {
	var attr=prompt(msg,"");
	if ((attr!="") && (attr!=null))
	{
		document.listform.action="fileman.asp?a=attribs&attr="+escape(attr);
		document.listform.submit();
	}}
else {
	alert(sel_item_msg)
}}

function GetFromHistory(){
		document.listform.action="fileman.asp?a=list";
		document.listform.submit();
}

function zip_dl(zippage){
for (var f, n=0, DL=document.listform, i=0; i<DL.elements.length; i++) {if ((DL.elements[i].name.indexOf('f')> -1)) {if (DL.elements[i].checked){n=n+1; }}}
if (n>0) {
		document.listform.action=zippage + "?a=zip_dl";
		document.listform.submit();
	}
else {
	alert(sel_item_msg)
}}

function rename(curtemplate,msg1,msg2){
for (var f, n=0, DL=document.listform, i=0; i<DL.elements.length; i++) {if ((DL.elements[i].name.indexOf('f')> -1)) {if (DL.elements[i].checked){f=DL.elements[i].value;n=n+1; }}}
if (n>0) {
	if (n==1) {
		if(f.indexOf("\\")!=-1){ var L=(f.length-1),S;while(f.charAt(L)=="\\"){f=f.substring(0,L);L--;}S=f.split("\\"); f=S[(S.length-1)];}
		if(f.indexOf("|")!=-1){S=f.split("|");f=S[1];}
		f=f.replace("<",",");
		f=f.replace(">","&");
		msg=msg1;
	}
	else {
		f=curtemplate;
		msg=msg2;
	}
	var newname=prompt(msg,f);
	if ((newname!="") && (newname!=null)){
		document.listform.action="fileman.asp?a=rename&newname="+escape(newname);
		document.listform.submit();
		}
	}
else {
	alert(sel_item_msg)
}}

function zip(zippage,msg){
for (var f, n=0, DL=document.listform, i=0; i<DL.elements.length; i++) {if ((DL.elements[i].name.indexOf('f')> -1)) {if (DL.elements[i].checked){f=DL.elements[i].value.toLowerCase();n=n+1; }}}
if (n>0) {
	if(f.indexOf("\\")!=-1){ var L=(f.length-1),S;while(f.charAt(L)=="\\"){f=f.substring(0,L);L--;}S=f.split("\\"); f=S[(S.length-1)]; }
	if(f.indexOf("|")!=-1){S=f.split("|");f=S[1];}
	var p=f.lastIndexOf(".");
	if (p!=-1) {f=f.substring(0,p);
	}

	f=f.replace("<",",");
	f=f.replace(">","&");
	var target=prompt(msg,f + ".zip");
	if ((target!="") && (target!=null)) {
		document.listform.action=zippage + "?a=zip&target="+escape(target);
		document.listform.submit();
	}}
else {
	alert(sel_item_msg)
}}

function unzip(zippage,msg){
for (var f, n=0, DL=document.listform, i=0; i<DL.elements.length; i++) {if ((DL.elements[i].name.indexOf('f')> -1)) {if (DL.elements[i].checked){n=n+1; }}}
if (n>0) {
	if(confirm(msg)){
		document.listform.action=zippage + "?a=unzip";
		document.listform.submit();}}
else {
	alert(sel_item_msg)
}}

function submitform(action){
for (var f, n=0, DL=document.listform, i=0; i<DL.elements.length; i++) {if ((DL.elements[i].name.indexOf('f')> -1)) {if (DL.elements[i].checked){n=n+1; }}}
if (n>0 || action == "paste") {
		document.listform.action="fileman.asp?a="+action;
		document.listform.submit();}
else {
	alert(sel_item_msg)
}}

function del(msg){
for (var f, n=0, DL=document.listform, i=0; i<DL.elements.length; i++) {if ((DL.elements[i].name.indexOf('f')> -1)) {if (DL.elements[i].checked){n=n+1; }}}
if (n>0) {
	if(confirm(msg+"?")){
		document.listform.action="fileman.asp?a=del";
		document.listform.submit();}}
else {
	alert(sel_item_msg)
}}

function ButtonOver(item) {
	item.className = "Button_sel";
	if (item.alt !=null) {
		window.status=item.alt;
	}
}

function ButtonOff(item) {
	item.className = "Button_unsel";
	window.status='FileMan home page: http://www.iisworks.com/fileman';
}

function confirmSQL(msg){
	var SQL=document.sqlform.SQL.value;
	if ((SQL!="") & (SQL.toUpperCase().indexOf('SELECT')<0)){
		if(confirm(msg))
			document.sqlform.submit();
		}
	else	
			document.sqlform.submit();
	}

function CheckAllZips(){
	for (var i=0;i<document.unzip.elements.length;i++) {
		var e=document.unzip.elements[i];
		if (e.name !='allbox'){
			e.checked=document.unzip.allbox.checked;
		}
	}
}

function unzipitems(zippage,msg){
	if(confirm(msg+"?")){
		document.unzip.action=zippage + "?a=unzipitems";
		document.unzip.submit();
	}
}

function ToggleFont(){
	var f=document.editform;
	 if(f.proportional.checked){
		f.body.style.fontFamily='Arial, Helvetica';
		f.body.cols=110;
		}
	 else{
		f.body.style.fontFamily='Courier new,Courier';
		f.body.cols=83;
 }}

function ToggleWrap(){
	var f=document.editform;
	 if(f.wrap.checked){
		f.body.wrap= 'soft';
		}
	 else{
		f.body.wrap= 'off';
 }}
