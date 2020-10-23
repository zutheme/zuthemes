var _e_btn_up = _e_product_add_cart.getElementsByClassName("btn-up")[0];

var _e_btn_down = _e_product_add_cart.getElementsByClassName("btn-down")[0];

_e_btn_up.addEventListener("click",func_up);

_e_btn_down.addEventListener("click",func_down);

function func_up(){

	 _amount_cart = parseInt(_e_amount.value) + 1;

	 _e_amount.value = _amount_cart;

}

function func_down(){

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

var _e_btn_add_cart = _e_product_add_cart.getElementsByClassName("btn-add-cart")[0];

_e_btn_add_cart.addEventListener("click",addcart);

function addcart(){

	var _thumb_topping;

	var _price_topping = 0;

	var _idproduct_topping = 0;

	var _namepro_topping;

	var _index_int = 0;

	var _parent_id = 0;

	var _order_id = 1;

	var re_items = localStorage.getItem('l_items');

	if(!isRealValue(re_items)){

		  item = { orderid:_order_id, parent_id:_parent_id, title:_namepro,idproduct:_idproduct_cart, price_str:_price_cart, src_img:_src_thumb, quality:_amount_cart, size_name:_size_name, trash:0 };

	          cart_items[0] = item;

	          localStorage.setItem('l_items', JSON.stringify(cart_items));

	          _parent_id = _order_id;

	        }else{

	          items_cookie = JSON.parse(re_items);

	          _index_int = items_cookie.length;

	          _order_id = _index_int + 1;

	          item = { orderid:_order_id, parent_id:0, title:_namepro,idproduct:_idproduct_cart, price_str:_price_cart, src_img:_src_thumb, quality:_amount_cart, size_name:_size_name, trash:0 };

	          items_cookie[_index_int] = item;

	          localStorage.setItem('l_items', JSON.stringify(items_cookie));

	          _parent_id = _order_id;

	      }

		for (var i = _e_list_topping.length - 1; i >= 0; i--) {

			if(_e_list_topping[i].checked) {

				_idproduct_topping = _e_list_topping[i].value;

				_price_topping = _e_list_topping[i].parentElement.getElementsByClassName("topping_price")[0].value;

				_thumb_topping = _e_list_topping[i].parentElement.getElementsByClassName("topping_thumb")[0].value;

				_namepro_topping = _e_list_topping[i].parentElement.getElementsByClassName("namepro_topping")[0].value;

				re_items = localStorage.getItem('l_items');

				items_cookie = JSON.parse(re_items);

				_index_int = items_cookie.length;

	          	_order_id = _index_int + 1;

				item = { orderid:_order_id, parent_id:_parent_id, title:_namepro_topping, idproduct:_idproduct_topping, price_str:_price_topping, src_img:_thumb_topping, quality:_amount_cart, size_name:0, trash:0 };

				items_cookie[_index_int] = item;

	          	localStorage.setItem('l_items', JSON.stringify(items_cookie));

			}

		}     

	    var _l_itemts = localStorage.getItem('l_items');

	    total_items(_l_itemts);

	 	note_addcart();

}

var _e_modal_form_cart = document.getElementsByClassName("modal-cart-form")[0];

var _e_modal_cart = _e_modal_form_cart.getElementsByClassName("modal-cart")[0];

var _e_close = _e_modal_cart.getElementsByClassName("close")[0];

function note_addcart(){

	_e_modal_cart.style.display = "block";

	var _l_itemts = getCookie('l_items');

	if(!isRealValue(_l_itemts)){

		setCookie('l_items',1,3);

	}

}

_e_close.addEventListener("click",close_note_cart);

function close_note_cart(){

	_e_modal_cart.style.display = "none";

}





// function change_price_by_idproduct(_idproduct){

//     var _csrf_token = document.getElementsByName("csrf-token")[0].getAttribute("content");

//     var http = new XMLHttpRequest();

//     var url = "/teamilk/admin/producthasfile/delete";

//     var params = JSON.stringify({"idproduct":_idproduct});

//     http.open("POST", url, true);

//     http.setRequestHeader("X-CSRF-TOKEN", _csrf_token);

//     http.setRequestHeader("Accept", "application/json");

//     http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

//     var load = e_element.getElementsByClassName("loading-trash")[0];

//     load.style.display = "block";

//     http.onreadystatechange = function() {

//         if(http.readyState == 4 && http.status == 200) {

//             var myArr = JSON.parse(this.responseText);

//             if(myArr[0]=='success'){

//               load.style.display = "none";

//             }

//         }

//     }

//     http.send(params);

// }