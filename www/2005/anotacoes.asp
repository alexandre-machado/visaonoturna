<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<html>
<head>
<title>Documento sem t&iacute;tulo</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
this.meu_btn.onRelease=function(){<br>
endereco = &quot;http://www.des16n.com.br/experimentos/3.html&quot;;<br>
localAbre = &quot;des16n&quot;;<br>
largura = 720;<br>
altura = 500;<br>
barra = 1;// o valor um significa verdadeiro e o valor 0 significa falso<br>
localizacao = 0;<br>
diretorio = 0;<br>
status = 0;<br>
menu = 0;<br>
rolagem =01;<br>
redimensao = 0;<br>
abreCentro(endereco, localAbre, largura, altura, barra, localizacao, diretorio,
status, menu,rolagem, redimensao);<br>
}<br>
Movieclip.prototype.abreCentro = function (url, winName, w, h, toolbar, location,
directories,status, menubar, scrollbars, resizable) { <br>
getURL (&quot;javascript:var minhaJanela; if(!minhaJanela || minhaJanela.closed){minhaJanela
= window.open('&quot; + url + &quot;','&quot; + winName + &quot;','&quot; + &quot;width=&quot; +
w + &quot;,height=&quot; + h + &quot;,toolbar=&quot; + toolbar + &quot;,location=&quot; +
location + &quot;,directories=&quot; + directories + &quot;,status=&quot; + status
+ &quot;,menubar=&quot; + menubar + &quot;,scrollbars=&quot; + scrollbars + &quot;,resizable=&quot; +
resizable + &quot;,top='+((screen.height/2)-(&quot; + h/2 + &quot;))+',left='+((screen.width/2)-(&quot; +
w/2 + &quot;))+'&quot; + &quot;')}else{minhaJanela.focus();};void(0);&quot;);<br>
}</body>
</html>
