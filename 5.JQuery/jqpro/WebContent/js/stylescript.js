/**
 * 
 */

function changeBorder(){ // var를 붙이면 지역변수 붙히지 않으면 전역변수
	
	const arr = ["solid", "double", "dotted", "dashed", "inset", "outset" ];
	
	width = parseInt(Math.random()*10+1);
	idx = parseInt(Math.random()*arr.length);
	style = arr[idx];
	
	cr = parseInt(Math.random()*256);
	cg = parseInt(Math.random()*256);
	cb = parseInt(Math.random()*256);
	color = "rgb(" + cr + "," + cg + "," + cb + ")";
	
	
	vdiv.style.borderWidth = `${width}px`;
	vdiv.style.borderStyle = style;
	vdiv.style.borderColor = color;
	
	// vdiv.style.border = `${width}px ${style} ${color}`
}

changeColor = function(){
	//0~255 난수 발생
	cr = parseInt(Math.random()*256);
	cg = parseInt(Math.random()*256);
	cb = parseInt(Math.random()*256);
	
	
	vdiv.style.color = `rgb( ${cr}, ${cg}, ${cb} )`; // 템플릿리터럴!
}

changeSize =() =>{
	size = parseInt(Math.random()*26+15);
	vdiv.style.fontSize = size + "px";
}