<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="_dataconn.asp"-->
<!--#include file="funcoes.asp"-->
<%
	IF IsNumeric(Request("id"))=false THEN
		Response.Write("entrada de dado errada")
	END IF
dim sql,i,e
'mysql= "SELECT tb_cobertura.id, tb_cobertura.qt_foto, tb_cobertura.data, tb_local.nome, tb_local.end_pasta, tb_cobertura.por FROM tb_cat_cob RIGHT JOIN (tb_local RIGHT JOIN (tb_cobertura LEFT JOIN tb_id_foto ON tb_cobertura.id = tb_id_foto.id_cob) ON tb_local.id = tb_cobertura.id_local) ON tb_cat_cob.id = tb_cobertura.id_cat WHERE ((tb_cobertura.id)="&Request("id")&");"
mysql="SELECT tb_cobertura.COB_id, tb_local.LOC_end_pasta, tb_cobertura.COB_data, tb_cobertura.COB_qt_foto FROM tb_local RIGHT JOIN tb_cobertura ON tb_local.LOC_id = tb_cobertura.COB_id_local WHERE (((tb_cobertura.COB_id)="&Request("id")&"));"

'Response.Write(mysql)
Set RS=Conn.Execute(mysql)
e=RS("COB_qt_foto")
%>
<html>
<head>
<title>Documento sem t&iacute;tulo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
<script language="JavaScript" type="text/JavaScript">
	<!--
		function MM_findObj(n, d) { //v4.01
		  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
			d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
		  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
		  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
		  if(!x && d.getElementById) x=d.getElementById(n); return x;
		}
		
		function MM_swapImage() { //v3.0
		  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
		   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
		}
	//-->
</script>
<script>
	<!--
	//For full source to script, visit http://dynamicdrive.com
	
	nereidFadeObjects = new Object();
	nereidFadeTimers = new Object();
	
	/* object - image to be faded (actual object, not name);
	 * destop - destination transparency level (ie 80, for mostly solid)
	 * rate   - time in milliseconds between trasparency changes (best under 100)
	 * delta  - amount of change each time (ie 5, for 5% change in transparency)
	 */
	
	function nereidFade(object, destOp, rate, delta){
	if (!document.all)
	return
		if (object != "[object]"){  //do this so I can take a string too
			setTimeout("nereidFade("+object+","+destOp+","+rate+","+delta+")",0);
			return;
		}
			
		clearTimeout(nereidFadeTimers[object.sourceIndex]);
		
		diff = destOp-object.filters.alpha.opacity;
		direction = 1;
		if (object.filters.alpha.opacity > destOp){
			direction = -1;
		}
		delta=Math.min(direction*diff,delta);
		object.filters.alpha.opacity+=direction*delta;
	
		if (object.filters.alpha.opacity != destOp){
			nereidFadeObjects[object.sourceIndex]=object;
			nereidFadeTimers[object.sourceIndex]=setTimeout("nereidFade(nereidFadeObjects["+object.sourceIndex+"],"+destOp+","+rate+","+delta+")",rate);
		}
	}
	//-->
</script>

</head>

<body bgcolor="#000000" background="imagens/pop_up3.gif" leftmargin="0" topmargin="0" Onload="this.focus();">
<script language="JavaScript" type="text/javascript">
	<!--
		// Progressbar - Version 2.0
		// Author: Brian Gosselin of http://scriptasylum.com
		// Featured on Dynamic Drive (http://www.dynamicdrive.com)
		var imagesn='<%=RS("COB_qt_foto")%>';
		var imagecarregando='imagens/fundo_foto.gif';
		var texto='carregando...';
		var pasid='<%=RS("COB_id")%>';
		var imagesend='<%="../fotos/"&RS("LOC_end_pasta")&"/"&data_3(RS("COB_data"))&"/"%>';
		//var imagenames=new Array( '1.jpg' , '2.jpg' , '3.jpg' , '4.jpg' ,  '5.jpg' , '6.jpg');
		var yposition=0;							// POSITION OF LOAD BAR FROM TOP OF WINDOW, IN PIXELS
		var loadedcolor='#FFA851';					// PROGRESS BAR COLOR
		var unloadedcolor='';						// BGCOLOR OF UNLOADED AREA
		var loadedcolortxt='#ffffff';				// PROGRESS BAR COLOR
		var unloadedcolortxt='#ffffff';				// BGCOLOR OF UNLOADED AREA
		var barheight=5;							// HEIGHT OF PROGRESS BAR IN PIXELS (MIN 25)
		var barwidth=130;							// WIDTH OF THE BAR IN PIXELS  
		var bordercolor='ffffff';					// COLOR OF THE BORDER
		
		//DO NOT EDIT BEYOND THIS POINT 
		var NS4 = (navigator.appName.indexOf("Netscape")>=0 && parseFloat(navigator.appVersion) >= 4 && parseFloat(navigator.appVersion) < 5)? true : false;
		var IE4 = (document.all)? true : false;
		var NS6 = (parseFloat(navigator.appVersion) >= 5 && navigator.appName.indexOf("Netscape")>=0 )? true: false;
		var imagesdone=false;
		//var blocksize=barwidth/(imagenames.length);
		var blocksize=barwidth/(imagesn);
		barheight=Math.max(barheight,25);
		var loaded=0, perouter, perdone, images=new Array();
		var txt=(NS4)?'<layer name="perouter" bgcolor="'+bordercolor+'" visibility="hide">' : '<div id="perouter" style="position:absolute; visibility:hidden; border: 1px solid #ffffff;">';
		txt+='<table cellpadding="0" cellspacing="1" border="0"><tr><td width="'+barwidth+'" height="'+barheight+'" valign="center">';
		if(NS4)txt+='<ilayer width="100%" height="100%"><layer width="100%" height="100%" top="0" left="0">';
		txt+='<table cellpadding="0" cellspacing="0" border="0"><tr><td valign="center" width="'+barwidth+'" height="'+barheight+'"><center><font color="'+unloadedcolortxt+'" size="1" face="sans-serif">'+texto+'</font></center></td></tr></table>';
		if(NS4) txt+='</layer>';
		txt+=(NS4)? '<layer name="perdone" width="100%" height="'+barheight+'" bgcolor="'+loadedcolor+'" top="0" left="0">' : '<div id="perdone" style="position:absolute; top:1px; left:1px; width:'+barwidth+'px; height:'+barheight+'px; background-color:'+loadedcolor+'; z-index:100">';
		txt+='<table cellpadding="0" cellspacing="0" border="0"><tr><td valign="center" width="'+barwidth+'" height="'+barheight+'" bgcolor="'+loadedcolor+'"><center><font color="'+loadedcolortxt+'" size="1" face="sans-serif">'+texto+'</font></center></td></tr></table>';
		txt+=(NS4)? '</layer></ilayer>' : '</div>';
		txt+='</td></tr></table>';
		txt+=(NS4)?'</layer>' : '</div>';
		document.write(txt);
		function loadimages(){
			if(NS4){
				perouter=document.perouter;
				perdone=document.perouter.document.layers[0].document.perdone;
			}
			if(NS6){
				perouter=document.getElementById('perouter');
				perdone=document.getElementById('perdone');
			}
			if(IE4){
				perouter=document.all.perouter;
				perdone=document.all.perdone;
			}
			cliplayer(perdone,0,0,barheight,0);
			window.onresize=setouterpos;
			setouterpos();
			//for(n=0;n<imagenames.length;n++){
			for(n=0;n<imagesn;n++){
			images[n]=new Image();
			var x
			x=n+1
			//images[n].src=imagenames[n];
			images[n].src=imagesend+'mini_'+x+'.jpg';
			setTimeout('checkload('+n+')' ,n*150);
		}}
		function setouterpos(){
			var ww=(IE4)? document.body.clientWidth : window.innerWidth;
			var x=(ww-barwidth)/2;
			if(NS4){
			perouter.moveTo(x,yposition);
			perouter.visibility="show";
		}
		if(IE4||NS6){
			perouter.style.left=x+'px';
			perouter.style.top=yposition+'px';
			perouter.style.visibility="visible";
		}}
		function dispbars(x){
			var nx=x+1
			//eval("img"+nx2+".scr=images["+nx+"].src");
			eval("MM_swapImage('img"+nx+"','','"+imagesend+"mini_"+nx+".jpg',1)");
			loaded++;
			cliplayer(perdone, 0, blocksize*loaded, barheight, 0);
			//if(loaded>=imagenames.length)setTimeout('hideperouter()', 800);
			if(loaded>=imagesn)setTimeout('hideperouter()', 800);
		}
		function checkload(index){
			(images[index].complete)? dispbars(index) : setTimeout('checkload('+index+')', 150);
			//eval(("document.body.img"+index+".complete")? dispbars() : setTimeout('checkload('+index+')', 1000)); //eval("document.img" + currCount + ".src=dots[1].src")
		}
		function hideperouter(){
			(NS4)? perouter.visibility="hide" : perouter.style.visibility="hidden";
			imagesdone=true;
		}
		function cliplayer(layer, ct, cr, cb, cl){
			if(NS4){
				layer.clip.left=cl;
				layer.clip.top=ct;
				layer.clip.right=cr;
				layer.clip.bottom=cb;
			}
			if(IE4||NS6)layer.style.clip='rect('+ct+' '+cr+' '+cb+' '+cl+')';
		}
		window.onload=loadimages;
	//-->
</script>
<table align="center" cellpadding="0" cellspacing="0">
<script language="JavaScript" type="text/javascript">
	<!--
	for(n=1;n<=imagesn;n++){
	document.write('<tr><td height="5"></td></tr><tr><td width="140" height="105" align="center" bgcolor="#FF9900"><a target="foto" href="pop_up_foto.asp?id='+pasid+'&foto='+n+'"><img id="img'+n+'" name="img'+n+'" src="'+imagecarregando+'" alt="Foto '+n+'" border="0" onMouseOver="nereidFade(this,100,30,5);" onMouseOut="nereidFade(this,70,50,5);" style="filter:alpha(opacity=70)"></a></td></tr>')
	}
	//onpropertychange="nereidFade(this,70,1,5);"  propriedade para animar carregamento//-->
</script>
<tr><td height="5"></td>
</table> 
</body>
</html>
