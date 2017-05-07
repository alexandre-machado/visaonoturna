function troca_img(){ //quantidade de imagens
	imagest=new Array();
	z=0,j='.jpg';
	for (i=0; i<4; i++){
		//for (i=0; i<2; i++){
			//imagest[s,2]= end_img.arguments[s]; 
			//carrega(s,i);
		//document.write('x');	
		//}
		imagest[i]=new Image();
		carrega(i);
	}
	}
	function carrega(ca){
		//var y=qt_img[i];
		var z=Math.ceil(Math.random() * qt_img[ca]);
		imagest[ca].src= end_img[ca]+z+'.jpg';
		check_load(ca);
		//document.write(end_img[i]+(i+1)+j+z)
	}
	
	function check_load(n){
		(imagest[n].complete)? setTimeout('efeito('+n+')', 3000*(n+1)) : setTimeout('check_load('+n+')', 100);
		//document.write(imagest[n].src);
	}
	
	function efeito(xa){
		nereidFade('img_ultimas'+xa,0,40,10);
		setTimeout('muda_img('+xa+')',900);
		setTimeout('nereidFade("img_ultimas'+xa+'",100,40,10)',1800);
		
	}
	
	function muda_img(i){
		var x=end_img[i]+(i+1)+j;
		eval("MM_swapImage('img_ultimas"+i+"','','"+imagest[i].src+"',1)");
		if (i==3) troca_img();
	}