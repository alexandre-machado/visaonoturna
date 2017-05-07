<%@ LANGUAGE = VBScript.Encode %>
<!--#include file="validate.asp"-->
<!--#include file="fmlib.asp"-->
<!--
####################################################################################################
Fileman upload page for the free ABCUpload component with an upload progress bar (http://www.websupergoo.com)
Also needed: ul_abcbar.asp (upload progress bar)
####################################################################################################
-->
<link rel=stylesheet href="fm.css">
<%#@~^SQQAAA==@#@&?nM\DRUmMrwDKr:W;O{bwask1lYbGU`rSKxL?^.bwOKbh+KEOE*@#@&(W,16K,)awsbmmYkKxvEf4;oTkULr#P:4+	Pr	~3DMWMP.+d;s+~xaY@#@&@#@&&0Pjnk/rW	crqd"+mNr	VHE#,r]PgrP~U+/krW	`JUnOYbxT/E#c+*PPtUPUtGAADDG.vJiw^GmNr	o,k/,xKOPmVsWS+[Zr#@#@&@#@&&0Pg6PP}4N+^Y3ab/O/vEb~Zi2^Wl[*c(oWMhr#~:txPUtKA+MDGDvJ)$;jw^Gl9PmKh2W	+	Y~xGO,0GE	[R,Z4n13PLsK4CVcCkl~DW,mtmxTnPDtnP9+WC!VY,;w^Wl9~2lT+cJb@#@&C{In;!n/D`ECr#@#@&\m6jk.n{ qWGW%&+cR@#@&&0~?/drKx`ri/IWKOWW^NDdJb~:tnx,(0,?ndkkWUcrIop!GDlE*`U+/kkKU`rZ;D"sH;sJ#*@*!,KtU~Hm6Uk"+xj/dkKU`rIojby+o.+E#vj/dbW	`J;EM]sgEhJ*#@#@&&0PtC6Uky@*)waVbmCYrG	`EHmajaVGC9?k"nr#~bg9,16:PU+/kkKU`rqdb9:rUr#P:4+	PHmajk.+{b2wsr1lOkKU`rHCa`wVGC9?ryE*@#@&U+DP0kW{j+M\nDcZ.nmY+}8LmYvEjmMkaYrxL wks+Uz/D+h6(L+^Or#@#@&&W,lxrEaVWmNr~K4+U@#@&d9G`wVKCN,?+kdrW	`rfrDEb@#@&7Z4nm0IGGD0Ws[Dc?dkkG	`rZEMIwHEsJb#@#@&~7&0P.D@!@*!,P4+	P;lsV~j4WA2M.WM`EiaVWC[bxLPkn^+^D+9P0bVdPDW~J,[~]VlDr\nlD4c?/kkGxcEGk.J*b#,2sdPIndaWU/ M+[bDmY,J6rV:Cxcld2r@#@&As/@#@&ij4WSjaVGl[oKDh@#@&3x9P(W@#@&?nO,0dW{HKY4bxT@#@&@#@&E:a[a:a[a::[aa[:a[aa[::a[@#@&?iA~j4WAjasWmNoGM:@#@&v[a:a[:[a:[a[aa[a[:a[a:a[@#@&jk4BAA==^#~@%>
<script language="javascript">
<!--
function DoUpload() {
	theFeats = "height=115,width=400,location=no,menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no";
	theUniqueID = (new Date()).getTime() % 1000000000;
	window.open("ul_abcbar.asp?ID=" + theUniqueID, theUniqueID, theFeats);
	document.fmupload.action = "ul_abc.asp?a=upload&ID=" + theUniqueID;
	document.fmupload.submit();
}
//-->
</script>
<%#@~^KwcAAA==@#@&d]/aWxk+c	DbYnPr@!9rM@*@!6GDsP+	^OXa+{:;VOral.YJWWM:R[mYl~Um:n'6h!wsKl9P:Y4GN{nG/D@*E@#@&dIdwKx/ 	DbYPE@!4f@*J~[,j+k/rG	`JjOMJb`y0*P',J@!zt2@*r@#@&iqWPtlajby+@!+FWGcRfcRP:tnx~]/2W	d+c.rD+PE@!6WUY,dbyn{F@*JPLPUn/kkGxvJjOMJ#vq Z#PL~E),J,[~?r"?ODbUovHCaUkynb,[~J@!8M@*E@#@&iq0,I5E/O`rxEb@!@*Jr~bgfP&dHEs+Mk^`]n$En/DcJ	Jbb,KtnU,?n/krKxcr1!:jaVKCNwknV9/Eb{Zq	O`"+;!ndYvJ	Jb#@#@&iqWPz2w^k^CDkWUcrbsVKANobVKXa+kE#@!@*EJ,bH9,1r:~?//bGU`rqkb[:rUr#~K4nx,IndaWxdnc.kDnr@!WKxDP/byxF@*bsVKhn[,0k^nPDXwdlPrPLP)w2sbmCYbGxvJ)s^Whn[wks+:za+dr#,[Pr@!JWW	Y@*@!(D@*E@#@&dwGD,k'8~OW,?/dkGUvJHEsiw^WC[wk+s[kJb@#@&7iInkwKx/Rq.kD+~J@!kU2!YPDzw'0bsnP	ls+x0rsJ'Pb~[,J~dby+xflP/Vmdk'oKDsqY:@*@!4M@*E@#@&dHnXY@#@&7I/wKUd+cMkO+~E@!kUw!OPDX2n{tk[[x~xmh'U,\mVE'r~[,1;:`wsGmNsbnV9/PL~E@*@!4M@*E@#@&7"+dwKU/R	.bY+~E@!kUw!O,Yza+{B4!YDGxEP-l^Enx,BJ,'PU+/krGxvJUY.JbcW!bPL~JEPGU1Vk^V{B4kkOKDzcoK`O8#EIP;VC/k'oGM:qDn:@*PJ@#@&7I/aWU/n qDrY~J@!qHK`KPOza+x/!8skO,xm:+{:,-l^En'rP'~U+/krW	`JUO.J*`W*bP'~rP6x;sk13xvGWj2sKl[`*v,Zsm/k'sKDs(Y:@*J@#@&7]/wKU/RMrO+,J@!zWW.h@*J@#@&AUN,?i$@#@&@#@&v[a:a[:[a:[a[aa[a[:a[a:a[@#@&j`APGGjaVWm[cfbD*@#@&B::[a:a[:a[a::[aa::[a:a[:@#@&(6P"ko4Yv9kM~q#@!@*EwrPK4nx,fkMx9kMPLPE-E@#@&?nY,OtsG.sP'~jD-+M ;DnmYr4N+1O`rb$Z`wsGmNccpsKD:rb@#@&DtsGDh tlajasWmNjr.+Px~tla?b"@#@&DtsWM:c)4kWsED+KCDtP{~KME+@#@&OtsKDhR6-DADbO+,'~j//rG	`E?ODkUT/r#`y&*@#@&DtnsKDh &fP{~I;EdO`rqGJb@#@&oKD~k{qPDW~j//rG	`E1!h`wsKl9skV9dJ*@#@&dU+O~Dt+wr+^NP{~OtsKDh`EWbVnJ,'Pb#cq*@#@&7(6POtob+s9RwkV2Xr/D/~K4+U~@#@&diOtsks[RUl7+~fr.,[~Y4nsb+s[cIlAobVn1mh@#@&id&0Pzwask1lOkKxcEdWodn\VJ*@*TP:tx~.rD+JWTJk	+cE`wVGC9PEPL~Gk.,[,YtsbnV9Rok^+HCs+PL~J,`JL~jk.+UY.kULvY4+wr+^N JxoO4*P'Prbr#@#@&di?+k/bGxvJ$l	NAr9Ytrb'U+/krGxvJ~lUNAr9Y4J*~_,IG;	N`O4sr+^[cSn	oDtz8!y*#@#@&72	N~(6@#@&gn6D@#@&UnOPDtsGDh~{PHWD4k	o@#@&AxN~j`A@#@&YhQCAA==^#~@%>