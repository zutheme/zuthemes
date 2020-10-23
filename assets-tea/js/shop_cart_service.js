// function exist_item(){ 
// 	var _lcart = getCookie('lcart');
// 	if(isRealValue(_lcart)){
// 		var arr_item = JSON.parse(_lcart);
// 		var l = arr_item.length;
// 		console.log(arr_item);
// 	}
// }
// exist_item();
var _e_modal_cart = document.getElementsByClassName("modal-nocart-form")[0]

function func_up(element){
	var _e_parent = element.parentElement.parentElement.parentElement.parentElement;
	var _e_parent_order = _e_parent.getElementsByClassName("parent")[0];
	var _parent_order = _e_parent_order.value;
	var _e_amount = _e_parent.getElementsByClassName("amount")[0];
	var _before_amount = parseInt(_e_amount.value);	
	var _amount_cart = _before_amount + 1;
	 _e_amount.value = _amount_cart;
	var _e_unit_price = _e_parent.getElementsByClassName("unit-price")[0];
	var _unit_price = parseInt(_e_unit_price.value);
	var e_total_item = _e_parent.getElementsByClassName("total-item")[0];
	var sub_total = _unit_price*_amount_cart;
	e_total_item.innerHTML = show_currency(sub_total);
	var _e_subtotal = _e_parent.getElementsByClassName("subtotal")[0];
	_e_subtotal.value = sub_total;
	var _e_order = _e_parent.getElementsByClassName("idorder")[0];
	var _idorder = _e_order.value;
	var _lst_order = '{"idorder":'+_idorder+',"quality":'+_amount_cart+',"trash":1},';
	if(_parent_order==0){
		var _e_lstparentord = _e_parent.parentElement.getElementsByClassName("parent");
		for (var i = _e_lstparentord.length - 1; i >= 0; i--) {
			if(_e_lstparentord[i].value==_idorder){
				var _e_parent_i = _e_lstparentord[i].parentElement;
				var _e_parent_amount = _e_parent_i.getElementsByClassName("amount")[0];
				_e_parent_amount.value = parseInt(_e_parent_amount.value/_before_amount)*_amount_cart;
				var _e_unit_price = _e_parent_i.getElementsByClassName("unit-price")[0];
				var _unit_price = parseInt(_e_unit_price.value);
				var e_total_item = _e_parent_i.getElementsByClassName("total-item")[0];
				var sub_total = _unit_price*parseInt(_e_parent_amount.value);
				e_total_item.innerHTML = show_currency(sub_total);
				var _e_subtotal = _e_parent_i.getElementsByClassName("subtotal")[0];
				_e_subtotal.value = sub_total;
				var _i_e_order = _e_parent_i.getElementsByClassName("idorder")[0];
				var _i_idorder = _i_e_order.value;
				_lst_order = _lst_order + '{"idorder":'+_i_idorder+',"quality":'+_e_parent_amount.value+',"trash":1},';
			}
		}
	}
	_lst_order = _lst_order.substring(0, _lst_order.length - 1);
	_lst_order = "["+_lst_order+"]";
	change_lst_qua_ord(_lst_order,renderlstchange);
	total();
}

function func_down(element){
	var _e_parent = element.parentElement.parentElement.parentElement.parentElement;
	var _e_parent_order = _e_parent.getElementsByClassName("parent")[0];
	var _parent_order = _e_parent_order.value;
	var _e_amount = _e_parent.getElementsByClassName("amount")[0];
	var _before_amount = parseInt(_e_amount.value);	
	if(_before_amount > 1){
		var _amount_cart = _before_amount - 1;
	 _e_amount.value = _amount_cart;
	}else{
		return false;
	}	
	var _e_unit_price = _e_parent.getElementsByClassName("unit-price")[0];
	var _unit_price = parseInt(_e_unit_price.value);
	var e_total_item = _e_parent.getElementsByClassName("total-item")[0];
	var sub_total = _unit_price*_amount_cart;
	e_total_item.innerHTML = show_currency(sub_total);
	var _e_subtotal = _e_parent.getElementsByClassName("subtotal")[0];
	_e_subtotal.value = sub_total;
	var _e_order = _e_parent.getElementsByClassName("idorder")[0];
	var _idorder = _e_order.value;
	var _lst_order = '{"idorder":'+_idorder+',"quality":'+_amount_cart+',"trash":1},';
	if(_parent_order==0){
		var _e_lstparentord = _e_parent.parentElement.getElementsByClassName("parent");
		for (var i = _e_lstparentord.length - 1; i >= 0; i--) {
			if(_e_lstparentord[i].value==_idorder){
				var _e_parent_i = _e_lstparentord[i].parentElement;
				var _e_parent_amount = _e_parent_i.getElementsByClassName("amount")[0];
				_e_parent_amount.value = parseInt(_e_parent_amount.value/_before_amount)*_amount_cart;
				var _e_unit_price = _e_parent_i.getElementsByClassName("unit-price")[0];
				var _unit_price = parseInt(_e_unit_price.value);
				var e_total_item = _e_parent_i.getElementsByClassName("total-item")[0];
				var sub_total = _unit_price*(parseInt(_e_parent_amount.value));
				e_total_item.innerHTML = show_currency(sub_total);
				var _e_subtotal = _e_parent_i.getElementsByClassName("subtotal")[0];
				_e_subtotal.value = sub_total;
				var _i_e_order = _e_parent_i.getElementsByClassName("idorder")[0];
				var _i_idorder = _i_e_order.value;
				_lst_order = _lst_order + '{"idorder":'+_i_idorder+',"quality":'+_e_parent_amount.value+',"trash":1},';
			}
		}
	}
	_lst_order = _lst_order.substring(0, _lst_order.length - 1);
	_lst_order = '['+_lst_order+']';
	change_lst_qua_ord(_lst_order,renderlstchange);
	total();
}
function total(){
	var _e_subtotal = document.getElementsByName("subtotal");
	var total = 0;
	for (var i = _e_subtotal.length - 1; i >= 0; i--) {
		total = total + parseFloat(_e_subtotal[i].value);
	}
	var _e_row_total = document.getElementsByClassName("row-total")[0].getElementsByClassName("total")[0];
	var _total = show_currency(total);
	_e_row_total.innerHTML = _total;
	cart_number();	
}
function hasClass(element, className) {
    return (' ' + element.className + ' ').indexOf(' ' + className+ ' ') > -1;
}
function remove_itemt(element){
	var _e_parent = element.parentElement.parentElement;
	var _e_prev_header = _e_parent.previousElementSibling;
	if(_e_prev_header){
		if(hasClass(_e_prev_header, "header")){
			_e_prev_header.style.display = "none";
		}
	}
	var _e_parent_order = _e_parent.getElementsByClassName("parent")[0];
	var _parent_order = _e_parent_order.value;
	var _e_amount = _e_parent.getElementsByClassName("amount")[0];
	_e_amount.value = 0;
	_e_parent.getElementsByClassName("subtotal")[0].value = 0;
	var _e_order = _e_parent.getElementsByClassName("idorder")[0];
	var _idorder = _e_order.value;
	var _lst_order = '{"idorder":'+_idorder+',"quality":0,"trash":0 },';
	if(_parent_order==0){
		var _e_lstparentord = _e_parent.parentElement.getElementsByClassName("parent");
		for (var i = _e_lstparentord.length - 1; i >= 0; i--) {
			if(_e_lstparentord[i].value==_idorder){
				var _e_parent_i = _e_lstparentord[i].parentElement;
				var _e_prev_header = _e_parent_i.previousElementSibling;
				if(_e_prev_header){
					if(hasClass(_e_prev_header, "header")){
						_e_prev_header.style.display = "none";
					}
				}
				_e_parent_i.style.display="none";
				var _e_parent_amount = _e_parent_i.getElementsByClassName("amount")[0];
				_e_parent_amount.value = 0;
				var _e_unit_price = _e_parent_i.getElementsByClassName("unit-price")[0];
				var _unit_price = 0;
				var e_total_item = _e_parent_i.getElementsByClassName("total-item")[0];
				var sub_total = 0;
				e_total_item.innerHTML = 0;
				var _e_subtotal = _e_parent_i.getElementsByClassName("subtotal")[0];
				_e_subtotal.value = 0;
				var _i_e_order = _e_parent_i.getElementsByClassName("idorder")[0];
				var _i_idorder = _i_e_order.value;
				_lst_order = _lst_order + '{ "idorder":'+_i_idorder+',"quality":0,"trash":0 },';
			}
		}
	}
	_lst_order = _lst_order.substring(0, _lst_order.length - 1);
	_lst_order = '['+_lst_order+']';
	change_lst_qua_ord(_lst_order,renderlstchange);
	_e_parent.style.display = "none";
	total();
}
var e_modal_remove_item = document.getElementsByClassName("modal-remove-item")[0];
var _e_modal_cart_remove = e_modal_remove_item.getElementsByClassName("modal-cart")[0];
function change_lst_qua_ord(_lst_change,callback){
	var _userid_order = 0;
	var _csrf_token = document.getElementsByName("csrf-token")[0].getAttribute("content");
    var http = new XMLHttpRequest();
    var url = url_home+"/teamilk/changequality";
  	var params = JSON.stringify({"userid_order":_userid_order,"listchange":_lst_change});	
    //var params = JSON.stringify({"userid_order":_userid_order,"idorder":_idorder,"quality":_quality});
    http.open("POST", url, true);
    http.setRequestHeader("X-CSRF-TOKEN", _csrf_token);
    http.setRequestHeader("Accept", "application/json");
    http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    
    _e_modal_cart_remove.style.display = "block";
    var _e_loading = e_modal_remove_item.getElementsByClassName("loading")[0];
    _e_loading.style.display = "block";
    http.onreadystatechange = function() {
        if(http.readyState == 4 && http.status == 200) {
        	callback(this.responseText);         
        }
    }
    http.send(params);
 	//var dateTime = getcurentdate();
    //console.log("sent:"+dateTime);
 }
 function getcurentdate(){
 	var today = new Date();
 	var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
	var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
	var dateTime = date+' '+time;
	return dateTime;
 }
 function renderlstchange(data){
 	if(data){
 		var myArr = JSON.parse(data);
 		console.log(myArr);
 		_e_modal_cart_remove.style.display = "none";
 		var _e_loading = e_modal_remove_item.getElementsByClassName("loading")[0];
    	_e_loading.style.display = "none";
    	cart_number();
  		//var dateTime = getcurentdate();
    	//console.log("received:"+dateTime);
    }
 }
