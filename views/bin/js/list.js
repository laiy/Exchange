window.onload = function() {
	btn1 = document.getElementsByClassName('fan')[0];
	btn1.addEventListener('click', m_fans);
	btn2 = document.getElementsByClassName('fol')[0];
	btn2.addEventListener('click', m_following);
};

function m_fans(){
	var block1 = document.getElementsByClassName('fans')[0];
	var block2 = document.getElementsByClassName('following')[0];
	block1.style.display = "block";
	block2.style.display = "none";
} 

function m_following() {
	var block1 = document.getElementsByClassName('fans')[0];
	var block2 = document.getElementsByClassName('following')[0];
	block1.style.display = "none";
	block2.style.display = "block";
}