function getSelectedText(elementId) {

    var elt = document.getElementById(elementId);

    if (elt.selectedIndex == -1)

        return null;

    return elt.options[elt.selectedIndex].text;

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
    var lst_value = "";
    if(e_lst_check){
      for (var i = 0; i < e_lst_check.length; i++) {
        if(e_lst_check[i].checked){
            lst_value = lst_value + '{"idcate":'+e_lst_check[i].value + '},';
        }
      }

      lst_value = '['+lst_value.replace(/,\s*$/, "")+']';
      //alert(lst_value);
      search_productbyidcate(lst_value);
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

  //var load = _e_frm_reg.getElementsByClassName("loading")[0];

  //load.style.display = "block";

  http.onreadystatechange = function() {
      if(http.readyState == 4 && http.status == 200) {
           var myArr = JSON.parse(this.responseText);
           console.log(myArr);
           var e_ul =  _e_form_cate.getElementsByClassName("list-check-result")[0];
           console.log(e_ul);
           if(e_ul){
              while (e_ul.firstChild) {
                  e_ul.removeChild(e_ul.firstChild);
              }
            }
            var _idproduct = 0; 
          Object.keys(myArr).forEach(function(key) {
            var e_li = document.createElement("li");
             var label = document.createElement("label");
             var e_input = document.createElement("input");
             
             _idproduct = myArr[key].idproduct;
             e_input.type = "checkbox";
             e_input.value = _idproduct;
             e_input.name = "list_check[]";
             e_input.setAttribute("class", "flat");
             label.innerHTML = "&nbsp;"+myArr[key].namepro;
             e_input.setAttribute("class", "flat");
             e_li.appendChild(e_input);
             e_li.appendChild(label); 
             e_ul.appendChild(e_li);     
            //console.log('idcategory='+myArr[key].idcategory+',name='+myArr[key].name)
          });
        e_ul.appendChild(e_ul);
          //load.style.display = "none";      
      }
  }
  http.send(params);
}