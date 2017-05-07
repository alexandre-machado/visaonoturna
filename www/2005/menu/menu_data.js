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
headerbgcolor="#4F8EB6";
headerborder=1;
headercolor="#ffffff";
offbgcolor="#ffffff";
offcolor="#000000";
onbgcolor="#ECF4F9";
onborder="1px solid #316AC5";
oncolor="#000000";
outfilter="randomdissolve(duration=0.4)";
overfilter="Fade(duration=0.2);Shadow(color=#777777', Direction=135, Strength=3)";
padding=3;
pagebgcolor="#eeeeee";
pageborder="1px solid #ffffff";
pageimage="db_red.gif";
separatorcolor="#999999";
subimage="black_13x13_greyboxed.gif";
}

with(milonic=new menuname("contextMenu")){
margin=3;
style=contextStyle;
top="offset=2";
aI("image=home.gif;text=Milonic Home Page;url=/;");
aI("image=print.gif;separatorsize=1;text=Print;url=javascript:window.print();");
aI("image=back.gif;text=Back;url=javascript:history.go(-1);");
aI("image=forward.gif;text=Forward;url=javascript:history.go(1);");
aI("image=browser.gif;text=Refresh;url=javascript:history.go(0);");
aI("separatorsize=1;text=View Page Source;url=javascript:Vsrc();");
aI("showmenu=Context Menu Samples;text=Menu samples;");
aI("text=Disable This Menu;url=`javascript:var contextDisabled=true;");
}

with(milonic=new menuname("Context Menu Samples")){
itemwidth=227;
margin=3;
overflow="scroll";
style=contextStyle;
aI("text=Plain Text Horizontal Style DHTML Menu Bar;url=http://www.milonic.com/menusample1.php;")
aI("text=Vertical Plain Text Menu;url=http://www.milonic.com/menusample2.php;onfunction=showtip('Another common sample This time, the sub<br>menus are opened from a vertical main menu') ;")
aI("text=All Horizontal Menus;url=http://www.milonic.com/menusample25.php;onfunction=showtip('If space is limited, this menu sample shows how<br>to open sub-menus in a horizontal orientation') ;")
aI("text=Using The Popup Menu Function Positioned by Images;url=http://www.milonic.com/menusample24.php;onfunction=showtip('The popup function can also open menus<br>based on mouse action but also positioned<br>relative to an image') ;")
aI("text=Classic XP Style Menu;url=http://www.milonic.com/menusample82.php;")
aI("text=XP Style;url=http://www.milonic.com/menusample86.php;")
aI("text=XP Taskbar Style Menu;url=http://www.milonic.com/menusample83.php;")
aI("text=Office XP Style Menu;url=http://www.milonic.com/menusample47.php;")
aI("text=Office 2003 Style Menu;url=http://www.milonic.com/menusample46.php;")
aI("text=Apple Mac Style Menu;url=http://www.milonic.com/menusample72.php;")
aI("text=Amazon Style Tab Menu;url=http://www.milonic.com/menusample74.php;")
aI("text=Milonic Home Menu;url=http://www.milonic.com/menusample78.php;")
aI("text=Windows 98 Style Menu;url=http://www.milonic.com/menusample13.php;onfunction=showtip('The Microfost Windows 98 3D look & feel can be<br>acheived by adding high and low 3D colors to<br>your menu styles') ;")
aI("text=Multiple Styles Menu;url=http://www.milonic.com/menusample5.php;onfunction=showtip('Demonstrating how to declare properties using different<br>menu styles. Separate styles can be declared for each<br>menu ora style can be used globally for every menu') ;")
aI("text=Multi Colored Menu Items;url=http://www.milonic.com/menusample80.php;")
aI("text=Multi Colored Menus Using Styles;url=http://www.milonic.com/menusample7.php;onfunction=showtip('') ;")
aI("text=Multi Tab;url=http://www.milonic.com/menusample50.php;")
aI("text=Tab Top;url=http://www.milonic.com/menusample52.php;")
aI("text=Multi Columns;url=http://www.milonic.com/menusample73.php;")
aI("text=100% Width Span Menu;url=http://www.milonic.com/menusample26.php;onfunction=showtip('Spanning the menu to 100% of the browser width<br>will allow for the menu to become a page separator') ;")
aI("text=Follow Scrolling Style Menu;url=http://www.milonic.com/menusample10.php;onfunction=showtip('Keeping the menu available at all times no matter<br>where your user has scrolled to, can be acheived by<br>setting the followscroll property for your main menu') ;")
aI("text=Menu Positioning With Offsets;url=http://www.milonic.com/menusample23.php;onfunction=showtip('Setting the position of menus using screenposition<br>is a handy way of ensuring that your menus will<br>always be centered or positioned exactly how<br>you need') ;")
aI("text=Table Based (Relative) Menus;url=http://www.milonic.com/menusample9.php;onfunction=showtip('Positioning menus relative to your web pages<br>flow can be acheived by setting the menu style<br>property position to relative') ;")
aI("text=Opening Windows and Frames with the Menu;url=http://www.milonic.com/menusample11.php;onfunction=showtip('Opening links in other windows or other frames<br>is easy by using the target menu item property.') ;")
aI("text=Menus Over Form Selects, Flash and Java Applets;url=http://www.milonic.com/menusample14.php;onfunction=showtip('Older browsers have a problem with form objects<br>and other HTML objects that naturally sit higher in<br>the browser layer hiding the menu.<br>The workaround fr this is to use DIV hiding') ;")
aI("text=Activating Functions on Mouseover;url=http://www.milonic.com/menusample15.php;onfunction=showtip('onfunction, offfunction and clickfunction are<br>built in features that allow you to add<br>custom JavaScript to several menu events') ;")
aI("text=Drag Drop Menus;url=http://www.milonic.com/menusample22.php;onfunction=showtip('By setting your menus type to be <b>draggable</b><br>this will allow for your users to move<br>main menus by drag and drop') ;")
aI("text=Menus with Header Type Items;url=http://www.milonic.com/menusample8.php;onfunction=showtip('If you need to separate blocks of menu items within<br>a single menu, Headers are a handy way of<br>segragating your menu items') ;")
aI("text=Right To Left Openstyle;url=http://www.milonic.com/menusample65.php;")
aI("text=Up Openstyle Featuring Headers;url=http://www.milonic.com/menusample33.php;")
aI("text=DHTML Menus and Tooltips;url=http://www.milonic.com/menusample6.php;onfunction=showtip('Tooltips are a handy way of adding more information<br>informing the user how to navigate your website or<br>use your application incorporating the menu') ;")
aI("text=Unlimited Level Menus Example;url=http://www.milonic.com/menusample67.php;")
aI("text=Context Right Click Menu;url=http://www.milonic.com/menusample27.php;onfunction=showtip('Context menus are easily configured with the<br>Milonic DHTML Menu. No special requirements are needed<br>Except for a small custom JavaScript module') ;")
aI("text=Menus built entirely from images;url=http://www.milonic.com/menusample18.php;onfunction=showtip('If you prefer to build your menus completely<br>from images this is easily possible, let<br>the menu take care of your images.') ;")
aI("text=Static Images Sample;url=http://www.milonic.com/menusample16.php;onfunction=showtip('Inserting images inside menus is made easy<br>with the use of the image property for menu items') ;")
aI("text=Rollover Swap Images Sample;url=http://www.milonic.com/menusample17.php;onfunction=showtip('Swaping images on mouse over can be acheived<br>by setting the image and onimage properties<br>for your menu items') ;")
aI("text=Background Item Images;url=http://www.milonic.com/menusample20.php;onfunction=showtip('Each menu item can have its own background image.<br>Text can be overlaid meaning you only need to build<br>and download one image') ;")
aI("text=Background Image Buttons;url=http://www.milonic.com/menusample89.php;")
aI("text=Menu Background Images;url=http://www.milonic.com/menusample76.php;")
aI("text=Creating Texture with Menu Background Images;url=http://www.milonic.com/menusample19.php;onfunction=showtip('Adding a background image to your menus can<br> vastly improve the apperance of otherwise dull<br>backgrounds.') ;")
aI("text=Static Background Item Images;url=http://www.milonic.com/menusample71.php;")
aI("text=Vertical Static Background Item Images;url=http://www.milonic.com/menusample87.php;")
aI("text=World Map Sample;url=http://www.milonic.com/menusample92.php;")
aI("text=US Map Sample;url=http://www.milonic.com/menusample91.php;")
aI("text=Image Map Sample;url=http://www.milonic.com/menusample4.php;onfunction=showtip('Image maps can be used to open menus using the popup<br>function based on the HTML object AREA') ;")
aI("text=Rounded Edges Imperial Style;url=http://www.milonic.com/menusample21.php;onfunction=showtip('Including rounded edges to menus') ;")
aI("text=Corporation;url=http://www.milonic.com/menusample40.php;")
aI("text=International;url=http://www.milonic.com/menusample70.php;")
aI("text=Clean;url=http://www.milonic.com/menusample32.php;")
aI("text=3D Gradient Block;url=http://www.milonic.com/menusample57.php;")
aI("text=Descreet;url=http://www.milonic.com/menusample42.php;")
aI("text=Agriculture;url=http://www.milonic.com/menusample41.php;")
aI("text=Breeze;url=http://www.milonic.com/menusample29.php;")
aI("text=Chart;url=http://www.milonic.com/menusample66.php;")
aI("text=Cartoon;url=http://www.milonic.com/menusample77.php;")
aI("text=Start Button Menu;url=http://www.milonic.com/menusample69.php;")
aI("text=Tramline;url=http://www.milonic.com/menusample54.php;")

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
    pageimage="db_red.gif";
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
      subimage="black_13x13_greyboxed.gif";
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