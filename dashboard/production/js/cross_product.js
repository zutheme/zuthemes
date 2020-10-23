var _e_modal_cross_form = document.getElementsByClassName("modal-cross-form")[0];
var _e_modal_cross = _e_modal_cross_form.getElementsByClassName("modal-cross")[0];
var _e_close = _e_modal_cross.getElementsByClassName("close")[0];
function cross_product(){
	_e_modal_cross.style.display = "block";
}
_e_close.addEventListener("click", close_cross);
function close_cross(){
	_e_modal_cross.style.display = "none";
}
var _e_modal_cate_form = document.getElementsByClassName("modal-cate-form")[0];
var _e_modal_cate = _e_modal_cate_form.getElementsByClassName("modal-cate")[0];
// var _e_close_cate = _e_modal_cate.getElementsByClassName("close")[0];
// var _e_edit_product_belong = document.getElementsByClassName("edit-product-belong");
// for (var i = _e_edit_product_belong.length - 1; i >= 0; i--) {
// 	_e_edit_product_belong[i].addEventListener(function(){
// 		_e_modal_cate.style.display = "block";
// 	});
// }
function cate_product(element){
	_e_modal_cate.style.display = "block";
}
//_e_close.addEventListener("click", close_cate);
function close_cate(){
	_e_modal_cate.style.display = "none";
}