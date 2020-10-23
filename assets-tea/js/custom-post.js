var _width = (window.innerWidth > 0) ? window.innerWidth : screen.width;
var _height = (window.innerHeight > 0) ? window.innerHeight : screen.height;
var _e_img_post = document.getElementsByClassName("img-post");
if(_e_img_post){
		for (var i = 0; i < _e_img_post.length; i++) {
		_e_img_post[i].style.height = "130px";
	}
}

if(_width < 768){
	var _e_show_post = document.getElementsByClassName("show-post")[0];
	if(_e_show_post){
		console.log(_e_show_post);
		var e_img = _e_show_post.getElementsByTagName('img');
		for (var i = 0; i < e_img.length; i++) {
			//e_img[i].style.width = "100%";
			//e_img[i].style.height = "auto";
			e_img[i].setAttribute("width", "100%");
			e_img[i].setAttribute("height", "auto");
		}
	}
	
}


