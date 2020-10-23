var _e_modal_form_cart = document.getElementsByClassName("modal-cart-form")[0];
var _e_modal_cart = _e_modal_form_cart.getElementsByClassName("modal-cart")[0];
var _e_close = _e_modal_cart.getElementsByClassName("close")[0];
var _e_loading = _e_modal_cart.getElementsByClassName("processing")[0];
var _e_note = _e_modal_cart.getElementsByClassName("note")[0];
// function note_addcart(){
// 	_e_modal_cart.style.display = "block";
// 	var _l_itemts = getCookie('lcart');
// 	if(!isRealValue(_l_itemts)){
// 		setCookie('lcart',1,3);
// 	}
// }
_e_close.addEventListener("click",close_note_cart);
function close_note_cart(){
	_e_modal_cart.style.display = "none";
	_e_note.style.display ="none";
}
function func_up(element){
	var _e_parent = element.parentElement.parentElement;
	var _e_amount = _e_parent.getElementsByClassName("amount")[0];	
	var _amount_cart = parseInt(_e_amount.value) + 1;
	 _e_amount.value = _amount_cart;
}

function func_down(element){
	var _e_parent = element.parentElement.parentElement;
	var _e_amount = _e_parent.getElementsByClassName("amount")[0];
	var _amount_cart = parseInt(_e_amount.value);	
	if(_amount_cart > 1){
		_amount_cart =  parseInt(_e_amount.value) - 1;
		_e_amount.value = _amount_cart;
	}

}
//addcart
var items_cookie;
var carts = [];
var total = 0;
var cart_items = [];
var item;
var order_id = 0;
var arr_lcart = [];
var arr_item = [];
//var _e_btn_add_cart = _e_product_add_cart.getElementsByClassName("btn-add-cart")[0];
//_e_btn_add_cart.addEventListener("click",addcart);
function addcart(element){
	makeAJAXCall(element,renderdata);
	///total_items(_l_itemts);
	//note_addcart();
}

function makeAJAXCall(element,callback){
	var _e_parent = element.parentElement.parentElement;
	var _e_idproduct = _e_parent.getElementsByClassName("idproduct")[0];
	var _idproduct = _e_idproduct.value;
	var _e_amount = _e_parent.getElementsByClassName("amount")[0];
	var _quality = _e_amount.value;
	var _userid_order = 0;
	var _csrf_token = document.getElementsByName("csrf-token")[0].getAttribute("content");
    var http = new XMLHttpRequest();
    var url = url_home+"/orderhistory";
    var params = JSON.stringify({"userid_order":_userid_order,"idproduct":_idproduct,"quality":_quality});
    http.open("POST", url, true);
    http.setRequestHeader("X-CSRF-TOKEN", _csrf_token);
    http.setRequestHeader("Accept", "application/json");
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    _e_modal_cart.style.display = "block";
    _e_loading.style.display = "block";
    http.onreadystatechange = function() {
        if(http.readyState == 4 && http.status == 200) {
        	var myArr = JSON.parse(this.responseText);
        	callback(this.responseText);     
        }
    }
    http.send(params);
   console.log("request sent to the server");
 }
 function renderdata(data){
 	if(data){
 		var myArr = JSON.parse(data);
 		console.log(myArr);
  //   	var _idorderhistory = myArr[0]['idorderhistory'];
  //   	var _l_itemts = getCookie('lcart');          
		// if(!isRealValue(_l_itemts)){
		// 	var item = {"idorderhistory":_idorderhistory};
  //       	arr_lcart[0] = item;
  //       	var json_arr = JSON.stringify(arr_lcart);    
		// 	setCookie('lcart',json_arr,3);
		// }else{
		// 	arr_item = JSON.parse(_l_itemts);
		// 	var l = arr_item.length;
		// 	var item = {"idorderhistory":_idorderhistory};
  //       	arr_lcart[l] = item;
  //       	var json_arr = JSON.stringify(arr_lcart);    
		// 	setCookie('lcart',json_arr,3);
		// }
    	_e_loading.style.display = "none";
    	_e_note.style.display = "block";
    	cart_number();
    }
 }

