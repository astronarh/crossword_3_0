// JavaScript Document
function changeImg(imgUrl) {
	"use strict";
	var id = document.getElementById('main');
	id.style.backgroundImage = 'url(' + imgUrl + ')';
}

function select(){
	"use strict";
	var select = document.getElementById('selectDiv');
	select.style.display = 'block';
	//clearCell();
}

function changeSelect() {
	"use strict";
	var select = document.getElementById('selectDiv');
	select.style.display = 'none';
	closeAllDiv();
	var option = document.getElementById('select').value;
	var div = document.getElementById(option);
	div.style.display = 'block';
}

function closeAllDiv() {
	"use strict";
	document.getElementById('letter').style.display = 'none';
	document.getElementById('leterAndArrow').style.display = 'none';
	document.getElementById('question').style.display = 'none';
}

function setLetter() {
	"use strict";
	var labelTree = document.getElementById('ourLabel');
	labelTree.style.fontSize = '40px';
	labelTree.style.textTransform = 'uppercase';
	labelTree.innerHTML = document.getElementById('inputLetter').value;
}

function setLetterTwo() {
	"use strict";
	var labelTree = document.getElementById('ourLabel');
	labelTree.style.fontSize = '40px';
	labelTree.style.textTransform = 'uppercase';
	labelTree.innerHTML = document.getElementById('inputLetterTwo').value;
}

function setLetterTree() {
	"use strict";
	var labelTree = document.getElementById('ourLabel');
	labelTree.style.fontSize = '10px';
	labelTree.style.textTransform = 'none';
	labelTree.innerText = document.getElementById('ourTextArea').value;
}

function clearCell() {
	"use strict";
	document.getElementById('ourLabel').innerText = '';
	document.getElementById('main').style.backgroundImage = 'url(00.png)';
}

function show(state){
	"use strict";
	document.getElementById('window').style.display = state;			
	document.getElementById('wrap').style.display = state; 			
}