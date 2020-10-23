var _e_modal_cross_form = document.getElementsByClassName("modal-cross-form")[0];
var _e_modal_cross = _e_modal_cross_form.getElementsByClassName("modal-cross")[0];
var _e_close = _e_modal_cross.getElementsByClassName("close")[0];
var _e_idparentcrosss="";
function cross_product(){
  _e_modal_cross.style.display = "block";
}
_e_close.addEventListener("click", close_cross);
function close_cross(){
  _e_modal_cross.style.display = "none";
}
var _e_modal_cate_form = document.getElementsByClassName("modal-cate-form")[0];
var _e_modal_cate = _e_modal_cate_form.getElementsByClassName("modal-cate")[0];

function cate_products(element){
  alert("function");
   //_e_idparentcrosss = element.parentElement;
  //_e_modal_cate.style.display = "block";
}

function close_cate(){
  _e_modal_cate.style.display = "none";
}
function getSelectedText(elementId) {

    var elt = document.getElementById(elementId);

    if (elt.selectedIndex == -1)

        return null;

    return elt.options[elt.selectedIndex].text;

}

function(element){

}
var _e_sel_idcat_main = document.getElementsByName("sel_idcat_main")[0];

_e_sel_idcat_main.addEventListener("change", function(){

    var select_idcat = this.options[this.selectedIndex].value;
    //console.log(select_idcat);
    if(select_idcat > -1){

      select_category(select_idcat);
      
    }

});

function select_category(select_idcat){

  var _csrf_token = document.getElementsByName("csrf-token")[0].getAttribute("content");

  var http = new XMLHttpRequest();

  var host = window.location.hostname;

  var url = url_home + "/admin/product/categorybyid/product/"+select_idcat+"/"+_idproduct;
 
  var params = JSON.stringify({"sel_idcategory":select_idcat});

  http.open("POST", url, true);

  http.setRequestHeader("X-CSRF-TOKEN", _csrf_token);

  http.setRequestHeader("Accept", "application/json");

  http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

  //var load = _e_frm_reg.getElementsByClassName("loading")[0];

  //load.style.display = "block";

  http.onreadystatechange = function() {
      if(http.readyState == 4 && http.status == 200) {
           var myArr = JSON.parse(this.responseText);
           var e_sel_dynamic =  document.getElementsByClassName("select_dynamic")[0];
           //var e_ul =  document.getElementsByClassName("list-check")[0];
           var idcat;
           if(e_sel_dynamic){
              while (e_sel_dynamic.firstChild) {
                  e_sel_dynamic.removeChild(e_sel_dynamic.firstChild);
              }
            }
          //console.log(myArr);
           e_sel_dynamic.innerHTML = myArr;
          //load.style.display = "none";      
      }
  }
  http.send(params);
}

  
var _e_sel_idcat_main_edit = document.getElementsByName("sel_idcat_main_edit")[0];
_e_sel_idcat_main_edit.addEventListener("change", function(){
    var select_idcat = this.options[this.selectedIndex].value;
    if(select_idcat > -1){
      select_category_search(select_idcat);     
    }
});

function select_category_search(select_idcat){

  var _csrf_token = document.getElementsByName("csrf-token")[0].getAttribute("content");

  var http = new XMLHttpRequest();

  var host = window.location.hostname;

  var url = url_home + "/admin/product/listcategorybyid/product/"+select_idcat+"/"+_idproduct;
 
  var params = JSON.stringify({"sel_idcategory":select_idcat});

  http.open("POST", url, true);

  http.setRequestHeader("X-CSRF-TOKEN", _csrf_token);

  http.setRequestHeader("Accept", "application/json");

  http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

  //var load = _e_frm_reg.getElementsByClassName("loading")[0];

  //load.style.display = "block";

  http.onreadystatechange = function() {
      if(http.readyState == 4 && http.status == 200) {
           var myArr = JSON.parse(this.responseText);
           var e_sel_dynamic =  document.getElementsByClassName("select_dynamic_edit")[0];
           //var e_ul =  document.getElementsByClassName("list-check")[0];
           var idcat;
           if(e_sel_dynamic){
              while (e_sel_dynamic.firstChild) {
                  e_sel_dynamic.removeChild(e_sel_dynamic.firstChild);
              }
            }
          //console.log(myArr);
           e_sel_dynamic.innerHTML = myArr;
          //load.style.display = "none";      
      }
  }
  http.send(params);
}
var _e_form_cate = document.getElementsByClassName("modal-cate-form")[0].getElementsByClassName("frm-cate")[0];
var _e_btn_search = _e_form_cate.getElementsByClassName("btn-search")[0];
_e_btn_search.addEventListener("click",function(){
    var listcheck = _e_form_cate.getElementsByClassName("select_dynamic_edit")[0];
    var e_lst_check = listcheck.getElementsByClassName("checklist");
    var lst_value = ""; var _search = false;
    if(e_lst_check){
      for (var i = 0; i < e_lst_check.length; i++) {
        if(e_lst_check[i].checked){
            lst_value = lst_value + '{"idcate":'+e_lst_check[i].value + '},';
            _search = true;
        }
      }
      if(_search){
        lst_value = '['+lst_value.replace(/,\s*$/, "")+']';
        search_productbyidcate(lst_value);
      }else{
         alert("Bạn chọn ít nhất một chuyên mục");
      } 
    }  
});
function search_productbyidcate(_list_idcate){
  var _csrf_token = document.getElementsByName("csrf-token")[0].getAttribute("content");
  var http = new XMLHttpRequest();

  var host = window.location.hostname;

  var url = url_home + "/admin/product/listproductbyidcate";
 
  var params = JSON.stringify({"list_idcate":_list_idcate});

  http.open("POST", url, true);

  http.setRequestHeader("X-CSRF-TOKEN", _csrf_token);

  http.setRequestHeader("Accept", "application/json");

  http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

  var load = _e_form_cate.getElementsByClassName("loading")[0];
  load.style.display = "block";

  http.onreadystatechange = function() {
      if(http.readyState == 4 && http.status == 200) {
           var myArr = JSON.parse(this.responseText);
           //console.log(myArr);
           var e_ul =  _e_form_cate.getElementsByClassName("list-check-result")[0]; 
            e_ul.innerHTML = myArr;
           load.style.display = "none";      
      }
  }
  http.send(params);
}

function remove(element){
  var _e_parent = element.parentElement.parentElement.parentElement;
  _e_parent.getElementsByClassName("cross_id_status_type")[0].value = 5;
  _e_parent.style.display = "none";
}
// _e_form_cate.getElementsByClassName("btn-create-new-relative")[0].addEventListener("click",function(){
//     var e_ul =  _e_form_cate.getElementsByClassName("list-check-result")[0]; 
//     if(e_ul){
//         var lst_item="";
//         var check = false;
//         var _e_lstchk = e_ul.getElementsByClassName("listcheck");
//         for (var i = 0; i < _e_lstchk.length; i++) {
//           if(_e_lstchk[i].checked){
//              check = true;
//           }
//         }
//         if(!check){
//           alert("bạn chưa chọn sản phẩm liên quan");
//           return false;
//         }
//         _e_form_cate.submit();
//     }
// });
// var _e_btn_update_relative = _e_form_cate.getElementsByClassName("btn-update-relative")[0];
// _e_btn_update_relative.addEventListener("click",function(){
//     var e_ul =  _e_form_cate.getElementsByClassName("list-check-result")[0]; 
//     if(e_ul){
//         var lst_item=""; var count = 0;
//         var _e_lstchk = e_ul.getElementsByClassName("listcheck");
//         for (var i = 0; i < _e_lstchk.length; i++) {
//           if(_e_lstchk[i].checked){
//               var _e_parent_lst = _e_lstchk[i].parentElement;
//               var _href = _e_parent_lst.getElementsByTagName("a")[0].getAttribute('href');
//               var _title = _e_parent_lst.getElementsByTagName("a")[0].innerHTML;
//               var _src = _e_parent_lst.getElementsByTagName("img")[0].getAttribute('src');
//               //console.log(_src,_href,_title);
//               var _e_id_status_type = _e_idparentcrosss.getElementsByClassName("id_status_type")[0];
//               //_e_id_status_type.value = ;
//               console.log(_e_id_status_type);
//               _e_idparentcrosss.getElementsByClassName("idparentcross")[0].value = _e_lstchk[i].value;
//               _e_idparentcrosss.getElementsByTagName("img")[0].src = _src;
//               _e_idparentcrosss.getElementsByClassName("name-product")[0].innerHTML = _title;
//               //lst_item = lst_item + _e_lstchk[i].value + ',';
//           }
//         }
//         //lst_item = lst_item.replace(/,\s*$/, "");
//        close_cate();
//     }
// });