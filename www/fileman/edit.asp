<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="validate.asp"-->
<!--#include file="fmlib.asp"-->
<link rel=stylesheet href="fm.css">
<script language="javascript" src="fm.js"></script>
<%#@~^DQUAAA==@#@&qW,1}KPzwask1lOkKxcEG+4!Lobxorb~K4+	P6x~3MDGD,.+kEhn,x+aO@#@&(0,j/dbW	`J&/"nl9rUVHJb~}IPvj+k/kKUcJU+DYrxLdr#c 8bPz19~grK~j/dkKUvJjYDkxT/rb`8#bP:tnU,?tKA2MDWMcE29kDPWEU^DkGxk~lM+~UKYPCs^WA+9Zr#@#@&@#@&l'dZmd+vIn;!+dOvJlrb#@#@&0{]n;!+kYcJWE*@#@&q6~l{JdC7+J~P4+U@#@&7Ul-P6@#@&AVkn@#@&d3NbY~W@#@&2	[P&0@#@&@#@&B[a[a:a::[a:a[:a[a::[aa::@#@&jj~~ANrD`6#@#@&B[:a[a:a[a::[aa[:a[aa[::a@#@&&0~b22^k^lDrW	`E94ELLbxLJ*xwlsk+,Ktx,6x,2.DKD~./EsnP	+6D@#@&r^Nwks+UCs+x0@#@&0{A;r^NnCO4`W#@#@&&0~vI;E/DcJsJb'rtE~z1f,j+k/kKUcJU+DYrxLdr#c*+b#,Y4n	PCP\dHGNx:D;PAV/P_PHdHGN'oC^/+@#@&0{N+1KCY4`6#@#@&(W,0dWcok^+3ab/Ydc6#~K4n	@#@&iq6PV;lkn`6#xS;ldnv?+M-+MR:m22lDtvJLVG8mV lkCJ*#~P4+x~(kMsW(C^bjz':DEPAs/P(/VVG8mVbU)'wlVkn@#@&i?Y~YWx6/GRTnY6ksnv0#@#@&i0jk.n{YWc/by+@#@&,7q6PW?byn@*ZPK4nx@#@&Pi7j+DP6Dx0dGcr2+	P+XYor^+`WS8~Wl^d#@#@&d,d4KNHx0MR.+mNCs^@#@&i~d6DR1sG/@#@&d74G[H']+asl1+c8KNXSELJSJLCswIr#@#@&d,d(GNH']+aVC^`4K[XBJ@!rSE[^YpJb@#@&7,d8W9z'"+2smm+c8KNz~r@*r~ELoDiJ*@#@&72	N~q6@#@&7U+Y,O0{1WD4rxT@#@&dj+ddbWU`r$l	NAr9YtEb{?n/krKxcrAmxNSk9Otr#~_,IG;	N`6jk.+z8T+c*@#@&2s/n@#@&d(0,Hr:PuPtSHG[PPtU,0xr1hP:+XOPGW^Es+UOcY6DEPAV/~W'r1h~hn8,0rV tD:E~@#@&2U[,qW@#@&$mmV!w{I+$EdYcmGW0kndvJh6hJ*`J(C^3!wr#@#@&WU{0dWcL+Dsrsxlhnv0b@#@&v[a:[P_KHdPsGN@#@&q6PuPtSHK[+,b1G~Hr:P&/!VG8mV)?z~K4+U@#@&dsmgBAA==^#~@%>
	<body>
	<form method=post action="edit.asp?a=save" id=editform>
	<table border='1' cellpadding=6 cellspacing='0' bordercolor='#555555'>
	<tr><td align='center' bgcolor=<%=#@~^HAAAAA==)awsbmmYkKxvEATZGVKDunmN+ME#+gkAAA==^#~@%>><font color=FFFFFF size=2>
	<b><%=#@~^EgAAAA==j/dbW	`JUYME#v #awUAAA==^#~@%></b></font></td></tr>
	<tr><td bgcolor=DDDDDD>
	<TEXTAREA name="body" id="body"><%=#@~^BAAAAA==8KNzrgEAAA==^#~@%></Textarea>
	<script src="editor/scripts/language/<%=fso.getbasename(Session("LanguageFile"))%>/editor_lang.js"></script>
	<script language=JavaScript src='editor/scripts/innovaeditor.js'></script>
	<script>
		var oEdit1 = new InnovaEditor("oEdit1");
		//oEdit1.css="fm.css";
		oEdit1.arrStyle = [["BODY",false,"","font-family:Tahoma,Verdana,Arial,Helvetica;font-size:8pt;"]];
		oEdit1.mode="HTML";
		oEdit1.height=450;
		oEdit1.width=650;
		oEdit1.initialRefresh=true;
		oEdit1.useBR=true;
		oEdit1.useDIV=false;
		oEdit1.btnPrint=true;
		oEdit1.btnPasteText=true;
		//oEdit1.btnFlash=true;
		oEdit1.btnMedia=true;
		//oEdit1.btnLTR=true;
		//oEdit1.btnRTL=true;
		//oEdit1.btnSpellCheck=true;
		oEdit1.btnStrikethrough=true;
		oEdit1.btnSuperscript=true;
		oEdit1.btnSubscript=true;
		//oEdit1.btnClearAll=true;
		//oEdit1.btnSave=true;
		oEdit1.btnStyles=true;
		oEdit1.REPLACE("body");
	</script>
	<br>
	<%#@~^HwAAAA==(6Pj/kkW	`rj+DYrxT/Ebv*v*~K4+xBAoAAA==^#~@%>
		<a href=edit.asp?a=edit&f=<%=#@~^HQAAAA==jD-DcjId2	^W9+cr^Nor^+xmh+*dwoAAA==^#~@%>><img align=absmiddle border=0 src=img/t_txt.gif Title='<%=#@~^EwAAAA==j/dbW	`JUYME#v X *nAUAAA==^#~@%>'></a>
	<%#@~^BgAAAA==3	N~&05gEAAA==^#~@%>
	<input type=text name=f size=25 Class=FormItem value="<%=#@~^AgAAAA==W	1AAAAA==^#~@%>">
	<input type=button Class=FormItem value='<%=#@~^EgAAAA==j/dbW	`JUYME#vcT#ZwUAAA==^#~@%>' onclick='location.href="fileman.asp"';> 
	<input type=submit Class=FormItem value='<%=#@~^EgAAAA==j/dbW	`JUYME#v&1#bwUAAA==^#~@%>'> 
	<br><input type=checkbox name='backup' <%=#@~^BgAAAA==8mmV!wdgIAAA==^#~@%> value=1><font size=1><%=#@~^EgAAAA==j/dbW	`JUYME#v {#bAUAAA==^#~@%></font> 
	</td></tr></table>
	</form>
	</body>
	<%#@~^HgAAAA==@#@&B:[a,K+XY,hW9+@#@&AVdn@#@&6AUAAA==^#~@%>
	<script>
	function gotoLine(msg) {
	    var obj  = document.editform.body;
	    var line = document.editform.line.value;
	    if (obj.innerText) {
	        var items = obj.innerText.split("\n");
	        if ( ( isNaN(line) )|| ( line > items.length ) || ( line <=0 ) || !line) {
	            alert(msg + items.length + '.'); 
	            return;
	        }
	        var lineContent = items[line-1];
	        var rangContent = '';
	        for (var i=0; i<line; i++) rangContent += items[i];
	
	        var items    = rangContent.split(lineContent);
	        var numTimes = (items.length > 1) ? ( items.length-1 ) : 1;
	
	        var txtRange = obj.createTextRange();
	        var found    = txtRange.findText(rangContent);
	        if (found) {
	            var tmp = 0;
	            while (txtRange.findText(lineContent)) {
	                tmp++;  
	                if ( tmp == numTimes ) {
	                    txtRange.select();
	                    break;
	                }
	                txtRange.moveStart("character",1);
	            }
	            txtRange.scrollIntoView();
	        }
	    }
	    else alert('The file is empty!')
	}
	</script>
	<Script>
	setTimeout('document.editform.body.focus();',100);
	</Script>
	<form name=editform method=post action="edit.asp?a=save">
	<table border='1' cellpadding=6 cellspacing='0' bordercolor='#555555'>
	<tr><td align='center' bgcolor=<%=#@~^HAAAAA==)awsbmmYkKxvEATZGVKDunmN+ME#+gkAAA==^#~@%>><font color=FFFFFF size=2>
	<b><%=#@~^EgAAAA==j/dbW	`JUYME#v #awUAAA==^#~@%></b></font></td></tr>
	<tr><td bgcolor=DDDDDD>
	<textarea id="body" name=body COLS=110 ROWS=28 Class=TextArea><%=#@~^BAAAAA==8KNzrgEAAA==^#~@%></textarea>
	<%#@~^WgEAAA==@#@&d(6P&/M^W(CVz?)P:tnU,@#@&i7I/wKUd+cMkO+~E@!4.@*@!rxaEO~DXwnx4k[NU,xCs+{?l7+VsW(lsbkl~-mVExF@*J@#@&77I/aWU/n qDrY~J@!0GUDPmGsKDxD[@*@!8@*ZzjK&rgZP:tnPmw2sbmlDrW	PhbssP(+,Dn/OCMYnN,C0D+.~HWE~dm\nPTsK4C^Rm/lc@!(.@*,.W	oW;^VX,nNbYk	L~o^W(lsRCdmPAk^sPaDn-xY~O4+~la2^k^mYbWx,0MG:,/OlMYrUTPEa~wMWw.sXe@!J4@*@!&WKxO@*@!8D@*J@#@&i2x[~&0@#@&i12wAAA==^#~@%>
	<br>
	<table width=100%><tr><td>
	<%#@~^MwAAAA==(6Pj/kkW	`rj+DYrxT/Ebv*v*~bgfPg6PP&/VVG4Csz?)P:4+	ChAAAA==^#~@%>
		<a href=edit.asp?a=edit&m=h&f=<%=#@~^HQAAAA==jD-DcjId2	^W9+cr^Nor^+xmh+*dwoAAA==^#~@%>><img align=absmiddle border=0 src=img/t_htm.gif Title='<%=#@~^EwAAAA==j/dbW	`JUYME#v XF*mwUAAA==^#~@%>'></a>&nbsp;
	<%#@~^BgAAAA==3	N~&05gEAAA==^#~@%>
	<input type=text name=f size=22 Class=FormItem value="<%=#@~^AgAAAA==W	1AAAAA==^#~@%>">
	<input type='button' Class=FormItem value='<%=#@~^EgAAAA==j/dbW	`JUYME#vcT#ZwUAAA==^#~@%>' onclick='location.href="fileman.asp"';> 
	<input type=submit Class=FormItem value='<%=#@~^EgAAAA==j/dbW	`JUYME#v&1#bwUAAA==^#~@%>'><br>
	<font size=1>
	<input type=checkbox <%=#@~^BgAAAA==$mmV!wVgIAAA==^#~@%> value=1 name=backup ><%=#@~^EgAAAA==j/dbW	`JUYME#v {#bAUAAA==^#~@%>&nbsp;&nbsp;&nbsp;
	</font>
	</td>
	<td valign=top align=right>
	<font size=1>
	<input type=checkbox checked name=proportional onclick='ToggleFont()'><%=#@~^EwAAAA==j/dbW	`JUYME#v Tc*mQUAAA==^#~@%>&nbsp;&nbsp;&nbsp;
	<input type=checkbox checked name=wrap onclick='ToggleWrap()'><%=#@~^EwAAAA==j/dbW	`JUYME#v T**mgUAAA==^#~@%>&nbsp;&nbsp;&nbsp;
	<%=#@~^EwAAAA==j/dbW	`JUYME#v T *lwUAAA==^#~@%> <input Class=FormItem name=line size=3 maxlength=5><input type=button Class=FormItem value='<%=#@~^EgAAAA==j/dbW	`JUYME#vc+#aQUAAA==^#~@%>' onclick='gotoLine("<%=#@~^EwAAAA==j/dbW	`JUYME#v T&*mAUAAA==^#~@%> ")'>
	</font>
	</td></tr></table>
	</td></tr>
	</table>	

	</form>
	<%#@~^wwYAAA==@#@&2U9P&0@#@&q6~bawsk1lOrKx`rJWTS+7nsJ*@*8PPtnU,.kDnSKoJr	+`E39kOP6r^+~rPLP0*@#@&(0,+.D@!@*T~:t+	~ZmVV,j4WS2MDGDcj/dkKU`r?O.r#`q*+#~[,E,J~LP"+VmYb-+hlOtv0bb@#@&2	[PUjA@#@&@#@&Ea[a:a::[a:a[:a[a::[aa::[@#@&?`$,?C7+v0#@#@&E:a[a:a[a::[aa[:a[aa[::a[@#@&d(0~)awsk1CYbWUcrf+8;TorxTE*'omVk+P:tUP}x~2MDG.,D+k;:PxaO@#@&d(W[Xx];;+kO`r4G[HJ#@#@&i.laxvIn$E/YvJS.laJb@!@*JEb@#@&d;.+mY+~C^3!w{Z$WGsvJTJ,'P"+5;/YcE(l^3!2r#b@#@&i0'x1KlDtc0*@#@&7&0P"n;!+/DcE?m\MsW8C^bdlrb@!@*JE~:t+U~6'j+M-D slawlDtvEo^W8l^RCdmJ#,3Vk+P6x$EbV9nCY4c6#@#@&iW'9+^KmYtcW*@#@&d&W,0xrJ,rI,qkoWM4rN9+Uc6#P:4+	P?4GA2MDKDc?ndkkGxvE?DDEbvFcXb*@#@&d&W,.mw,Ktx,]+kwGxk+ ^KW3bn/vJh6hE#vJSDCwEb{J/t^3NE~AV/n~"+dwKUk+ 1WK3k/vEh6:E#vJA.mwJ*xJr@#@&i(WP;DlO+$C13;w,)1GPWdKRsrs2akkOk`W*P:t+	@#@&7d"+dwKxdncmWKVk/`rAW:r#vJ8l^V!wE#{EZ4+^VNJ@#@&id]+k2KxdR1WW0kd`rhW:r# 3XwkMn/{1WS~QP2!@#@&7d[U{0dWcL+DwC.xYWG^NnD	Cs+c6#,[Pr-r@#@&idWx{0dGcM+D$lk+1mhn`6#@#@&7dnU{0dWc!+D2aOx/rG	1C:c6#@#@&diq0,q	dYM`WxBJcq*J#{J+	`0	bR ,bgf~SnUv0U#@*fPDtnU,0xxJ0O`6UBVn	`6x# &*@#@&idH+S1Ch'0	~[,J`8b J,[,+U@#@&7i4k^nP6/G wkVn3XkdYkc9x~LPg+hglsn#,lUN,x@!1O@#@&i7dix'	Qq@#@&did71nAglh+{Wx,[~EvJP'~	P'PrbcJ~LPx@#@&di	+	N@#@&idWdKRmK2X6kV~W~9x,[~1nAglh+Bj+k/rG	`JjnDYrxTdr#cy&*@#@&i2	[P&0@#@&iqW~6/Wcok^+2XrdYk`6#~K4n	Pvranxz/PnXY?O.lhP0nwd,N/mMkaOkKx~k	PjOM+lsSP}w+	Pn6DsbVnP[G/~xKO@#@&d7jYPOW{0dWc!YobV`0*@#@&7dU+OP6h~x,Y0c6wxbkPn6D?DDnlhcy~R *@#@&i2sdP@#@&7i?nY,WS'WkWcrwx:n6DsrV`WSy~KM;+*@#@&i3UN,q6@#@&dWAch.kDnP(W[z@#@&dWAcmsWkn@#@&7U+k/kKxvEAmx[hbNO4r#'Un/kkW	cEAmx9hrNO4r#~_,J+	`8G9X#&qZ *@#@&7&0~zwaVk1lDrW	`ESKoJn7+Vrb@*8PK4nUPqDbYnSGLdkU+vE?m\n~6kVn~rP'P6~*@#@&iq6P2MD{TP:tnx,IndaWxknRM+Nb.nmDPr0rVnhmx lk2J,2sdP?4GS2.DK.v?nk/bWxvJUODr#cFW*bb@#@&2	[PUjA@#@&fuYBAA==^#~@%>