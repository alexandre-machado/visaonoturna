<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="validate.asp"-->
<!--#include file="fmlib.asp"-->
<!--
####################################################################################################
Fileman upload page for FathUpload, included with FileMan for customers
Also needed: ul_fathbar.asp (upload progress bar)
####################################################################################################
-->
<link rel=stylesheet href="fm.css">
<%#@~^JwIAAA==@#@&?nM\DRUmMrwDKr:W;O{bwask1lYbGU`rSKxL?^.bwOKbh+KEOE*@#@&@#@&&0~?dkkG	`rq/"+m[r	VzJ*P6],1r:~?//bGU`r?YOkULkJb`ybP:tnU,?tGAAD.WMcrj2^WmNk	o,r/,xGY,lssKh+9ZJ*@#@&@#@&C'"+$En/OcrlE#@#@&Hm6jr.+'+qWG*%2W%@#@&q6P?/krW	`Ejk+]GKY0KsND/rb~K4+	P(0~j/dkKU`rIo}!WYCE*`j+kdbWUvJ;ED"sg;:r#b@*ZPP4xPtC6Ukyxj+k/bWU`E]w?ryoD+Ebv?+ddbWU`r/!D]w1!:J*#@#@&q6P\lX?r"@*ba2VbmlDrGxvJtlaj2sKl[?b"+r#~)gfPH6:Pj+kdbWUvJ&/b9:bUJ*PPtx~\m6?b"+{bwasrmmYbWU`E\m6iw^Gl9?r"J#@#@&&0~l{ErPP4+	@#@&iq6~I;;+kYcE	J#@!@*JrPK4nUPU+k/rWUcr1;:`2VKl[ob+V[dr#xI5!+dD`rxJ*@#@&7iKkAAA==^#~@%>
	<script language="javascript">
	function DoUpload() {
		var PID=(new Date()).getTime() % 1000000000;
		if (document.fmupload.showprogress.checked) {
			window.open("ul_fathbar.asp?PID=" + PID,PID, "height=100,width=400,location=no,menubar=no,resizable=yes,scrollbars=no,status=no,toolbar=no");
		}
		document.fmupload.action = "ul_fath.asp?a=upload&PID=" + PID;
		document.fmupload.submit();
	}
	</script>
	<%#@~^5QkAAA==@#@&d]/aWxk+c	DbYnPr@!9rM@*@!6GDsP+	^OXa+{:;VOral.YJWWM:R[mYl~Um:n'6h!wsKl9PHY4GN{n6?:@*E@#@&dIdwKx/ 	DbYPE@!4f@*J~[,j+k/rG	`JjOMJb`y0*P',J@!zt2@*r@#@&iqWPtlajby+@!+FWGcRfcRP:tnx~]/2W	d+c.rD+PE@!6WUY,dbyn{F@*JPLPUn/kkGxvJjOMJ#vq Z#PL~E),J,[~?r"?ODbUovHCaUkynb,[~J@!8M@*E@#@&iq0,ba2VbmCYbWUcrbV^GhNsbsnKHw/E#@!@*rJ~bg9PgrP~U+/drKxcJ&dzNhbxr#P:tUP"+dwKxdncDbO+r@!0KUOPkk.+xF@*)^VGh[P6ksn,YX2nk)~J,',b2aVbmlDkKU`rbsVKhn[wkVPXa+/rb~[,J@!zWWUO@*@!8D@*E@#@&doGMPkxq,YGPUnk/rKxvJ1!:`2VKl[sb+s[kJ#@#@&diI+k2Gxk+c.kOn,J@!k	2EDPOza+'Wr^+~xmh'WbVJ[,k,'PrPdk.+xflPZ^C/k'sK.hqD+s@*@!4.@*r@#@&dgn6D@#@&7"+/2G	/nRS.bYn,J@!kxaED~YHwn';C3/nAro~xm:+{d4WSwMWLDndk@*@!0KUY,/r"'F@*E,[~?dkkG	`r?YMJ*c W%bPLPE@!J0W	O@*Lx4k2I[	4kwI[U8kwI[	8/ai'U(/wI'	4dwp'	4daiLx4kwp'x(/2ir@#@&7"+/aGxk+RS.rYPr@!CP4.0xE^m0mY4 m/w_U{J~[,j/dbW	`JgEsiw^WCNwkns9/J*~_8P[,E@*@!6W	Y~/r"'q@*r~[,?ndkkWUcr?ODrbv *O#,[Pr@!JWW	Y@*@!Jl@*@!(D@*@!8D@*J@#@&7]+kwKxd+ 	MkO+,E@!bx2;DPYz2'v4!ODWUEP7lV!+{~BrP'PU+ddbWxvE?DDJ*c*!*PLPEB~G	msk1V'EtrdDWDz TWcO8bEi~;Vm//{sK.:&Yn:@*PE@#@&dIdwKx/ 	DbYPE@!(HhjPPDzw'd;(:kO~	lh+{h,\C^E'J,[,j+k/rW	`EjDDJ*ccl#PL~EP}x;VrmVxEfGjasWmNcbEPZsCk/xsK.sqO:@*J@#@&d"n/aWU/R	.bY+,E@!J0WMh@*J@#@&AVd+(W,lxJ!2VKl[E,KtnU@#@&7r	~D.KD,D+kEsnP	+aY@#@&7jYPKiw^Wl9~xPU+M\nD /M+CY64N+^OvJsCO4Riw^GmNE*@#@&dW`w^Gl9RKDKo.nk/qGxI;EdO`rn&fE#@#@&iBGjasWmN /KN+KCT+~',l!T8PEv*Z!8xj:s@#@&iWi2^Wl9 Hm6jasGl9?byn'\CX?ry@#@&iWi2^Wl[ }\nDS.bYnwk^+/{?d/bWU`r?nODkxTdJ*` 2b@#@&iW`wsWC[cZG:as+D+i2^Wl[6	2.DK.,'omVk+@#@&dKiw^WCNcIn^k\c?//bGU`rfbDE#b@#@&d3DM/W9+x3MDRH;s4nD@#@&iB:[a,?+	N,;w^WCN,kUWKP4H~+slk^~r0,mKxWkL;M+[@#@&7q6P3.MZW[n{!~K4n	P@#@&di?+k/bGxvJ$l	NAr9Ytrb'U+/krGxvJ~lUNAr9Y4J*~_,IG;	N`GiaVGl9 :WOmVUkyz8T W#@#@&idor^+SbdY{JJ,@#@&disKD~kU[6~',qPDW~G`wVGC9Rok^n;W;	Y@#@&did6U'Kj2VKl[ wkVck	N+Xb sbVxC:n@#@&d7dwrVSrdD'Por^+JkkO,[~&x9+6,[,E#,J~[,?OCMYZm2kDlVvWU#,[,J~`E~LPjk.n?DDrUT`Wi2^WCNcobVnvk	N+X#cjk.+bPLPEbrP[,#4;DS6@#@&did&0~qdoKD8k9[+	`jnk/kGUvJ9kME*P',0	#P:tUP6/GR9+snD+0bs+,?+kdrW	`rfrDEb,[~0	SP:D;n@#@&d7H6O@#@&7iqW,qk?tmD[sKV[+M`jnk/kKU`rfkMEb#,bgf~Wi2^WCNcok^+/G!xY@*T,K4+	~U+U9jaVWmNgGYb0rmmYrG	`sbs+dk/Db@#@&id&0~srsSr/D@!@*rJ~P4+x~jx[b9hbxiaVKlNgWDr0bmCYbWU~wkVJkkY@#@&73x9P&0@#@&7(6P)wask1lOrKx`EJKoJ+7n^Jb@*!,Ktx,	DbYnSKoJr	+Priw^Wl9~OW,J,[~?ndkkGxvEfbDEb,[PE~rP'P"naVC1+vsk^+dr/D~#4;DJoBPJB~J*@#@&ijnY,W`wsWC[{1GY4rxT@#@&~iq0~3MD/W9n@!@*T,K4+x,?4GhAD.WM`E3MDWM~EaVWm[rxTP6ks+d r#@#@&i/tmV]KWYWG^NnDvj/dbW	`J;EM]sgEhJ*#@#@&iBDdwKx/ ADbYPhladbyn@#@&7I/2G	/+ .NrD^DPE6k^+:mxcC/aJ@#@&Ax[~&0@#@&mfQCAA==^#~@%>
