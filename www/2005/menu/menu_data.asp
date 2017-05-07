<!--#include file="_dataconn.asp"-->

fixMozillaZIndex=true; //Fixes Z-Index problem  with Mozilla browsers but causes odd scrolling problem, toggle to see if it helps
_menuCloseDelay=500;
_menuOpenDelay=150;
_subOffsetTop=2;
_subOffsetLeft=-2;




with(contextStyle=new mm_style()){
bordercolor="#999999";
borderstyle="solid";
borderwidth=1;
fontfamily="arial, verdana, tahoma";
fontsize="75%";
fontstyle="normal";
headerbgcolor="#ffffff";
headerborder=1;
headercolor="#000000";
offbgcolor="#ffffff";
offcolor="#000000";
onbgcolor="#ECF4F9";
onborder="1px solid #316AC5";
oncolor="#000000";
outfilter="Fade(duration=0.2);Shadow(color=#777777', Direction=135, Strength=3)";
overfilter="Fade(duration=0.2);Shadow(color=#777777', Direction=135, Strength=3)";
padding=1;
pagebgcolor="#eeeeee";
pageborder="1px solid #ffffff";
pageimage="menu/db_red.gif";
separatorcolor="#999999";
subimage="menu/orange_13x13_orangebox.gif";
}

with(milonic=new menuname("contextMenu")){
margin=3;
style=contextStyle;
top="offset=2";
aI("text=Principal;url=index.asp;align=center");
aI("text=Diretório;url=pag_diretorio.asp;");
aI("showmenu=casas;text=Locais Cobertos;url=pag_album.asp;");
aI("text=Contato;url=pag_contato.asp;");
aI("showmenu=busca;text=Localizar festa;url=javascript:onfunction=document.busca_1.festa.focus();");
aI("image=menu/back_orange_15x15.gif;text=Volta;url=javascript:history.go(-1);");
aI("image=menu/forward_orange_15x15.gif;text=Avança;url=javascript:history.go(1);");
aI("image=menu/atualiza.gif;text=Atualizar;url=javascript:history.go(0);");
aI("text=Disabilite este Menu;url=`javascript:var contextDisabled=true;closeAllMenus();`");
//aI("image=home.gif;text=Milonic Home Page;url=/;");
//aI("image=print.gif;separatorsize=1;text=Print;url=javascript:window.print();");
//aI("image=back.gif;text=Back;url=javascript:history.go(-1);");
//aI("image=forward.gif;text=Forward;url=javascript:history.go(1);");
//aI("image=browser.gif;text=Refresh;url=javascript:history.go(0);");
//aI("separatorsize=1;text=View Page Source;url=javascript:Vsrc();");
//aI("showmenu=Context Menu Samples;text=Menu samples;");
//aI("text=Disable This Menu;url=`javascript:var contextDisabled=true;");
}

with(milonic=new menuname("especiais")){
itemwidth=227;
margin=3;
overflow="scroll";
style=contextStyle;
aI("text=1° Etapa Circuito Gaucho Som, Tunning e Rebaixados;url=javascript:abrirjanela('fotos','pop_up_index.asp?id=291',356,700,20,20);")
aI("text=I Sul Brasil Tuning;url=javascript:abrirjanela('','../fotos/index.asp?id=80',450,600,20,20);onfunction=showtip('Another common sample This time, the sub<br>menus are opened from a vertical main menu') ;")
aI("text=III Fórum Mundial de Educação;url=especial_forumedu3.asp;")
aI("text=Universo POP 2004;url=especial_universopop5_index.asp;")
}

with(milonic=new menuname("casas")){
itemwidth=150;
margin=3;
overflow="scroll";
style=contextStyle;
	<%dim mysql
	mysql="SELECT tb_local.LOC_id, tb_local.LOC_nome FROM tb_local ORDER BY tb_local.LOC_nome;"
	Set RS=Conn.Execute(mysql)
	Do While Not RS.EOF%>
		aI("text=<%= RS("LOC_nome") %>;url=pag_album.asp?casa=<%= RS("LOC_id") %>;")
	<%RS.MoveNext
	Loop%>
//aI("text=1° Etapa Circuito Gaucho Som, Tunning e Rebaixados;url=javascript:abrirjanela('fotos','pop_up_index.asp?id=291',356,700,20,20);")
//aI("text=Vertical Plain Text Menu;url=http://www.milonic.com/menusample2.php;onfunction=showtip('Another common sample This time, the sub<br>menus are opened from a vertical main menu') ;")
}

with(milonic=new menuname("busca")){
itemwidth=150;
margin=3;
overflow="scroll";
style=contextStyle;
aI("text=<form id=busca_1 name=busca_1 method=post action=../menu/pag_album.asp>festa: <input id=festa type=text name=festa size=13><br>data: <input type=text name=data size=13><br><input type=submit name=Submit value=Enviar></form>;type=header;align=center;");
}


drawMenus();




function Vsrc(){window.location="view-source:"+window.location.href}

with(contextStyle=new mm_style)
{
     onbgcolor="#ECF4F9";
       oncolor="#000000";
    offbgcolor="#ffffff";
      offcolor="#000000";
   bordercolor="#999999";
   borderstyle="solid";
   borderwidth=1
    overfilter="Fade(duration=0.2);Shadow(color='#777777', Direction=135, Strength=3)"
     pagecolor="";
   pagebgcolor="#eeeeee";
    pageborder="1px solid #ffffff";
    pageimage="menu/db_red.gif";
      onborder="1px solid #316AC5";
separatorcolor="#999999";
     outfilter="randomdissolve(duration=0.4)"
      fontsize="75%";
     fontstyle="normal";
    fontfamily="arial, verdana, tahoma";
 separatorsize=0;
       padding=3
 headerbgcolor="#4F8EB6";
   headercolor="#ffffff";
  headerborder="1px solid #000000";
      fontsize="10px";
      subimage="menu/black_13x13_greyboxed.gif";
if(!mac)onborder="1px solid #000000";
}



with(milonic=new menuname("contextMenu")){		
top="offset=2"
style = contextStyle;
margin=3
aI("text=Milonic Home Page;url=/;image=home.gif");
aI("text=Print;url=javascript:window.print();separatorsize=1;image=print.gif");
aI("text=Back;url=javascript:history.go(-1);image=back.gif");
aI("text=Forward;url=javascript:history.go(1);image=forward.gif");
aI("text=Refresh;url=javascript:history.go(0);image=browser.gif");
aI("text=View Page Source;url=javascript:Vsrc();separatorsize=1;");
aI("text=Menu Samples;showmenu=Context Milonic DHTML menu samples;");
aI("text=Disable This Menu;url=`javascript:var contextDisabled=true;closeAllMenus();`");
}

with(milonic=new menuname("Context Milonic DHTML menu samples")){		
style = contextStyle;
margin=3
overflow="scroll";
itemwidth=200;
aI("text=Text Based Samples;type=header;align=center");aI("text=Horizontal Navigational Menu;url=/menusample1.php;");aI("text=Vertical Navigational Menu;url=/menusample2.php;");aI("text=All Horizontal Menus;url=/menusample25.php;");aI("text=Using The Popup Menu Function Fixed Position;url=/menusample3.php;");aI("text=Using The Popup Menu Function Positioned by Images;url=/menusample24.php;");aI("text=Image Map Sample;url=/menusample4.php;");aI("text=Multiple Styles;url=/menusample5.php;");aI("text=Menus and Tool Tips;url=/menusample6.php;");aI("text=Multiple Colored Menus;url=/menusample7.php;");aI("text=Menu Items as Headers;url=/menusample8.php;");aI("text=Windows XP Style Menus;url=/menusample12.php;");aI("text=Windows 98 Style Menus;url=/menusample13.php;");aI("text=Functionality Samples Samples;type=header;align=center");aI("text=Relative Positioning (Table Bound);url=/menusample9.php;");aI("text=Follow Scrolling;url=/menusample10.php;");aI("text=Opening Windows & Frames;url=/menusample11.php;");aI("text=Hiding DIVs when displaying menus;url=/menusample14.php;");aI("text=Activating MouseOver & MouseOut Functions;url=/menusample15.php;");aI("text=Dynamic Dragable Menus;url=/menusample22.php;");aI("text=Positioning with screenposition & offsets;url=/menusample23.php;");aI("text=100% Width Span Menu;url=/menusample26.php;");aI("text=Context Right Click Menu;url=/menusample27.php;");aI("text=Image Based Samples;type=header;align=center");aI("text=Static Images Sample;url=/menusample16.php;");aI("text=Rollover/swap Images;url=/menusample17.php;");aI("text=Menus built from images;url=/menusample18.php;");aI("text=Images as Menu Backgrounds;url=/menusample19.php;");aI("text=Background Menu Item Images;url=/menusample20.php;");};

drawMenus()
<%
RS.Close
Set RS = Nothing
Conn.Close
Set Conn = Nothing
%>