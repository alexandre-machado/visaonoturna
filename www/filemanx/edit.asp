<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="validate.asp"-->
<!--#include file="fmlib.asp"-->
<link rel=stylesheet href="fm.css">
<script language="javascript" src="fm.js"></script>
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

<%#@~^zwQAAA==@#@&qW,1}KPzwask1lOkKxcEG+4!Lobxorb~K4+	P6x~3MDGD,.+kEhn,x+aO@#@&(0,j/dbW	`J&/"nl9rUVHJb~}IPvj+k/kKUcJU+DYrxLdr#c 8bPz19~grK~j/dkKUvJjYDkxT/rb`8#bP:tnU,?tKA2MDWMcE29kDPWEU^DkGxk~lM+~UKYPCs^WA+9Zr#@#@&@#@&?+DPwGDssr+^Nd~{PMOsKD:@#@&C'wWM:okns9/cJmE#@#@&(W,l'Edm\nJ,P4+U@#@&i?l7+@#@&2^/n@#@&d3[bYP"n;!+/DcE0r#@#@&3x[~&0@#@&@#@&B[a::[aa::[a:a[:[a:[a[aa[@#@&jj~P3NbYcW*@#@&E:a[aa[::a[a[a:a::[a:a[:a@#@&7vk2x^G9kUo{EAx^DXa+'Ela2VbmCYbWU&XOhSAO6WDsR;D^+	mGNn[EJ@#@&i6V9srsxlhn{0@#@&iW{A;bV9nlDtvW#@#@&7q6Pc];EdYvJ:rbxJ4J,bHf~j/dkKU`r?nODkxLdr#c*+b*PO4+	PC:Hd\W9+xKMEn~AV/~C:HStG[+{smVd+@#@&iqWPz2w^k^CDkWUcrfn4!LTkUTJ*'smVknP:tnx,rU~ADDK.PM+/!hnP	+XY@#@&7W{NnmhCY4`Wb@#@&d(W,0dWcobVnA6b/Yk`6bP:tnx@#@&77U+Y,O0{0/K L+D0bVn`Wb@#@&7d6jk.+xO6R/r"@#@&d,7&0~6?by+@*!,Ptx@#@&iP77U+Y,WD{0/K 6wx:+aYor^+c0Bq~6lsd#@#@&7iP74K[H'WMRM+l9l^s@#@&d7Pi0. 1VWkn@#@&dd,7(0,1}K~CP\dHGN~K4+U~@#@&d77i4GNHx"+2^l1+`(W9z~r[E~r[ChaiJ*@#@&idd,78W9X{InwsC1+c4K[XBJ@!EBJ[sOpJb@#@&7id~i4KNX{I2Vmmn`(W[zBJ@*rSJLoYpEb@#@&did3x[~&0@#@&i72	N~(6@#@&77U+OPDW{1GDtbxo@#@&i3x9P(0@#@&7$mm3!2'"+;!ndYcmKWVkndvJA0sE#vJ8C13E2E*@#@&PiW	'WkWco+Dsbs+	lh+v0b@#@&d?d/bWxvE$l	NSk[Y4E*'j+kdkKxcE~lx[AbNOtrb,_~"W!xNv0Uryzq!ycb@#@&q0,uKtSHK[nP:tx@#@&v./2W	d+cmsnmD@#@&MVABAA==^#~@%>
<head>
<script language="JavaScript" src="editor/yusasp_ace.js"></script>
<script language="JavaScript" src="editor/yusasp_color.js"></script>
<script>
function Save()
	{
	//Transfer the edited content to the form
	editform.body.value = obj1.getContent()
	editform.submit();
}		

function LoadContent()
	{
	//STEP 5: Use putContent() method to to put the content from the hidden IFRAME 
	//into the editor.
	obj1.putContent(idTextarea.value)
}

</script>	
</head>
<body onload="LoadContent()" style="font:10pt verdana,arial,sans-serif">

<table><tr><td>
<form name="editform" ID=Form1 Method="post" <%=#@~^CQAAAA==dAx^KNbxomgMAAA==^#~@%> action="edit.asp?a=save">
	<input type=hidden name=a value=save>
	<input type="hidden" name="body"  value="" ID=txtContent>
	<script>
	var obj1 = new ACEditor("obj1")
	obj1.width = 700
	obj1.height = 500
	obj1.useStyle = false //here is how to enable/disable toolbar buttons
	obj1.useAsset = false
	obj1.useImage = true
	obj1.isFullHTML = true //edit full HTML (not just BODY)
	obj1.usePageProperties = true
	obj1.ImagePageURL = "editor/insertimg.htm" //specify Image library management page
	obj1.RUN() //run & show the editor
	</script>
	<br>
	<input type=text name=f size=22 Class=FormItem value="<%=#@~^AgAAAA==W	1AAAAA==^#~@%>">
	<input type='button' Class=FormItem value='<%=#@~^EgAAAA==j/dbW	`JUYME#vcT#ZwUAAA==^#~@%>' onclick='history.go(-1)';> 
	<input type=button Class=FormItem onClick=Save() value='<%=#@~^EgAAAA==j/dbW	`JUYME#v&1#bwUAAA==^#~@%>'><br>
	<input type=checkbox name='backup' <%=#@~^BgAAAA==8mmV!wdgIAAA==^#~@%> value=1><font size=1><%=#@~^EgAAAA==j/dbW	`JUYME#v {#bAUAAA==^#~@%></font>&nbsp;&nbsp;&nbsp;
	<%#@~^HwAAAA==(6Pj/kkW	`rj+DYrxT/Ebv*v*~K4+xBAoAAA==^#~@%>
		<a href=edit.asp?a=edit&f=<%=#@~^HQAAAA==jD-DcjId2	^W9+cr^Nor^+xmh+*dwoAAA==^#~@%>><font size=1><%=#@~^EwAAAA==j/dbW	`JUYME#v X *nAUAAA==^#~@%></font></a>
	<%#@~^BgAAAA==3	N~&05gEAAA==^#~@%>
</form>
<TEXTAREA rows=30 cols=100 id=idTextarea name=idTextarea style="display:none"><%=#@~^BAAAAA==$KNzjgEAAA==^#~@%>
</Textarea>
</td></tr></table>
</body>
</html>

<%#@~^DAAAAA==@#@&2sk+@#@&twEAAA==^#~@%>
	<Script>
	setTimeout('document.editform.body.focus();',100);
	</Script>
	<form name=editform method=post action=edit.asp?a=save <%=#@~^CQAAAA==dAx^KNbxomgMAAA==^#~@%> >
	<table border='1' cellpadding=6 cellspacing='0' bordercolor='#555555'>
	<tr><td align='center' bgcolor=<%=#@~^HAAAAA==)awsbmmYkKxvEATZGVKDunmN+ME#+gkAAA==^#~@%>><font color=FFFFFF size=2>
	<b><%=#@~^EgAAAA==j/dbW	`JUYME#v #awUAAA==^#~@%></b></font></td></tr>
	<tr><td bgcolor=DDDDDD>
	<%#@~^2wAAAA==@#@&d(6P^Zlk+vW#{S/lk+cjD\.RslwaCOtvJTVG4Cscldlrb#,K4n	PIndaWU/ qDrD+,J@!bxa;Y,Yzw'4r9N+	~xm:+{jC\M^W8ls)kl~\msE'q@*r@#@&v~[a:Pdnm\n,Y4+PalMOP(+sWSP;UbxNUYNPK.~l,KzA~hrs^P8+,CN9+[~DWPO4PO6D~6ksPKxP^Wm[k	oZ@#@&H0YAAA==^#~@%>
<textarea id="body" name=body COLS=110 ROWS=28 Class=TextArea>
<%=#@~^BAAAAA==8KNzrgEAAA==^#~@%></textarea>
	<br>
	<table width=100%><tr><td>
	<input type=text name=f size=22 Class=FormItem value="<%=#@~^AgAAAA==W	1AAAAA==^#~@%>">
	<input type='button' Class=FormItem value='<%=#@~^EgAAAA==j/dbW	`JUYME#vcT#ZwUAAA==^#~@%>' onclick='history.go(-1)';> 
	<input type=submit Class=FormItem value='<%=#@~^EgAAAA==j/dbW	`JUYME#v&1#bwUAAA==^#~@%>'><br>
	<input type=hidden name=a value=save>
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
	<%#@~^HwAAAA==(6Pj/kkW	`rj+DYrxT/Ebv*v*~K4+xBAoAAA==^#~@%>
		<br><a href=edit.asp?a=edit&m=h&f=<%=#@~^HQAAAA==jD-DcjId2	^W9+cr^Nor^+xmh+*dwoAAA==^#~@%>><font size=1><%=#@~^EwAAAA==j/dbW	`JUYME#v XF*mwUAAA==^#~@%></font></a>
	<%#@~^BgAAAA==3	N~&05gEAAA==^#~@%>
	</td></tr></table>
	</td></tr>
	</table>	

	</form>
	<%#@~^PA4AAA==@#@&2U9P&0PEP:n6DPhW9+~@#@&q0,)waVk1COkKxvJJWLJ\nVrb@*8PP4xP	.bYnSKLdkU`r2NbY,Wk^+~J,[~W*@#@&&WPDD@!@*TP:tx~ZCs^PjtKA2MDG.v?+ddbWU`rjDDE*`8cv*PL~J,J~[,InsmYk7nnmYtvWb#@#@&Ax[Pji~@#@&@#@&va[a::[aa::[a:a[:[a:[a[aa@#@&UiA,?C\@#@&v[aa[:a[aa[::a[a[a:a::[a:@#@&7q6P)2aVk^CDkGxvEG+8!oTkxTJ*xsmVd+,K4n	Pr	~2MDWM~.+kEs+~xnaD@#@&dq.la'coKD:orV[/vESDCaJ*@!@*rJ*@#@&iZ.+mYn$mm3!2';AWKscJZJ,[~sG.ssr+^[/vJ8C13E2E*#@#@&i(6PoKDsskV9d`r?C\MsG(lVzdlr#@!@*EEP:tx~0xjD-+M :mw2CDt`EL^W8l^ m/Cr#,2Vk+,W'~ErV9nCO4`sK.:wk+^[d`r0r#b@#@&7(W[X{oWM:orVNdcr4GNHE*@#@&i?YPwWMhsb+sNkPx~gWY4rxT@#@&@#@&7q6P6'EJ~6"P(/wGD(k[[x`Wb,K4+	~UtGS2MDWM`Un/kkGxvJjOMJ#vqcl##@#@&7q6PqDCw~P4+UP"n/aWUdRmGG0kn/vES0hr#vJhMlaE#{J/tmVn9JPAs/PId2W	/R^WGVb+d`rA0sJbcrhDC2r#xJr@#@&d(6P;D+mY$l13;w,bH9,0/K sbV+Aar/D/v0bPP4x@#@&i7I/2G	/+ ^KWVkdvJA6:r#`r4m^3!wE#{J/4m3[J@#@&di]n/aW	/nR^GK3r+kcJS0hE*R2a2bDn/{HKh~3P2!@#@&di[x{0dWconOalDUY6WV9n.xm:`W#~',JwJ@#@&di0Ux6/W !Y$lknglh`6#@#@&dinx{0dWcMnOA6YU/bWxgCh+v0*@#@&d7(6P(xkODv0USr`FbE*'J+	c6xb  ,b1GPdnxv0U#@*&~O4+x,Wx{S+6Oc0	~^+U`WU*Of#@#@&di1nAgl:nx6x~[,EvFbcJ,[Px@#@&di4k^+~WkWRwrV26bdO/vN	P'PHnS1C:bPmx[~	@!,1@#@&d7diU{xQ8@#@&ddidgnhglh+{0U~LPJvEPLPx,'~J*RrP'PnU@#@&7dqnx9@#@&7i0/G 1W2X6r^+~6~9xPLPgnhglh+B?ndkkW	cJU+YDrUokJ*`+&b@#@&d3x9~q6@#@&7&0PWdKRok^nA6rkYk`0*P:4+	Pvra+U)kK+XO?DD+mh~3+a/~Nnd1DrwDrW	PrU,?Y.nm:SP}2xP6Dsk^+,[W/~xKY@#@&id?OPD0'6dGRV+DsrVnc6#@#@&i7?Y~WSP'~O6R6wUz/P6D?YM+mh`y~R *@#@&7AV/~@#@&ddUnOP6h{0dW 6a+UKaYwksnv0~+S:D;+*@#@&d3	N,q0@#@&iWhch.kD+~$KNX@#@&d6hR1sG/@#@&dj+ddbWU`r$l	NAr9YtEb{?n/krKxcrAmxNSk9Otr#~_,SnUvAW9z#JF!y*@#@&iq6P)w2sbmCYbGxvJJGTS+-n^Jb@*8~:tn	PqDkD+dGodkU+vJjC7+P6rVPJ,'~0,#@#@&7qW~AD.'Z~K4+U~"+/2G	/nRMn9k.mDPJ6k^n:mx lkwE~AV/~?4WhA..WM`U+d/rG	`E?D.J*`q*l##@#@&Ax[PUi~@#@&@#@&@#@&B[a[:a[a:a[a::[aa[:a[aa[:@#@&wE	mOkGU,MnYwGDs@#@&v[aa::[a:a[:[a:[a[aa[a[:a@#@&7q6P)2aVk1CYbWxvE9+(ETorxLE*'ol^d+,K4n	PrU~AD.WM~M+d!:Px6D@#@&i?nY,sG.ssksNkP',jnD7+MR/DnCD+64NnmD`Ej1Dk2ObxLRGr1YrKxmDXr#@#@&d&0~I;;nkYR:GYmV4HOn/@*!,bUN~J;ld+v]+$EndDR?n.7+..m.bl8^+k`J_K:K{;rHKA1Pm:5nAE#*P',ECwaVbmCYrG	zaOSAh 0G.sOE.sx^W9n9J~:tx@#@&dijW!D^+GlOC,'P"n;!+/D $k	lMX]+C[vIn;!n/DRPGDlV8zD+d#@#@&idjKEMm+GlDCP{P$k	l.z:W?D.k	o`UG;D1+GlOlb@#@&d7?K;D1+9CDlPx~UwskDcUW;MmflDlBE[r#@#@&idoGMP2m^t,sks[P&x,?GE.^fCYm@#@&id7ob+V[~{Pdw^rD`ob+^N~,J{E#@#@&7disrn^N1mh+,'P`]JfmKNn`orV[`Zb#@#@&77iskns9ZGxDn	Yd,',jIdf^W9+csb+s[vF#*@#@&iddwG.:wkV[/ )9N~sbnV91Ch~PorV[ZKUD+UD/@#@&di1aY@#@&72	N~(6@#@&ij+DPMOoWM:,'~sG.ssr+^[/@#@&3U9Ps;U1YrW	@#@&@#@&Ea[aa[a[:a[a:a[a::[aa[:a[@#@&w;UmDkKx~j]JG+^W9n`~X#C^P4CD#@#@&E:[a:[a[aa[a[:a[a:a[a::[a@#@&7q6Pba2sk1lDkGxcEG+8ETLk	oEb{slsdPPtU,rU,2MDWMPMn/!:nP	+aO@#@&dq4lDP',]nw^l1+c4CD~~J3E~,J~E*@#@&7jY~?D.lh,',?+M\.R;DnlD+68N+mDcJzfrG$ ?DDlhJb@#@&djYMnlsRPza+Px~yPv?D.bxL@#@&i?YM+mhR}wnx@#@&7KK/P{~q	?YMcq~,4lO~~EuJb@#@&7whWd~{PF@#@&ifGPq4bVn,nK/P@*PZ@#@&idjYM+ChcDbO+:+6D~\k9`qtCYS~anG/B~nK/~R,wnGd*PQP;4M`/dxT`JLCr~[,HrNv4CD~PhG/,_P8S~ *#*@#@&d72hWdP{~nK/~Q,&@#@&7inG/,x,qUUYM`whWkSPqtCYBPEYr#@#@&7SKWw@#@&7?DDlhR	.bYnKaY,Hr[vtCOBP2nKd*@#@&i?DD+m:cKWkkOkKx~x,!@#@&7j"Sf^GNP{PjY.nm: ICN:+aO@#@&djOM+C:c/^Wd@#@&d?Y,jYM+C:{1GO4kxT@#@&AxN,o;x1YbWU@#@&@#@&B:a[:a[a::[aa::[a:a[:[a:[@#@&sE	mDrW	P$k	l.z:W?D.k	o`7$rx*@#@&B:a::[a:a[:a[a::[aa::[a:a@#@&iqW,bawVbmmOkKxcJG+8;Tok	LJ*'smsd+,K4+UP6U,2.DK.PM+d;s+PUnXY@#@&ijY~KZKx\,',j+M\nDcZ.nmY+}8LmYvE)f}f~RjY.nm:E#@#@&dKZGU7RZ4CM/nY,x,J;D0 %J@#@&iGZKx-R:X2n,'P8~B(kxm.z@#@&dKZGx- }wnx@#@&dKZGU7R.rD+~\~r	@#@&iW;Wx7RhG/bYrW	Px~Z@#@&iGZKx\cPzwP{P+PvP6O@#@&7BKZGU7RZ4CM/nY,x,J	bx9WhkO8+*yJ~BKwOrKxl^sX@#@&d~rUlMX:WjY.r	o~',GZKx- "+l[P6O`*@#@&djY,WZKx7x1KY4k	o@#@&AxN,oE	mYbGU@#@&YPcDAA==^#~@%>