function getSelectedText(elementId) {
    var elt = document.getElementById(elementId);
    if (elt.selectedIndex == -1) return null;
    return elt.options[elt.selectedIndex].text;
}
var _e_type_category = document.getElementsByClassName("type-category")[0];
_e_type_category.addEventListener("change", function(){
    var select_idcat = this.options[this.selectedIndex].value;
    if(select_idcat > -1){
      select_category_by_idcatetype(select_idcat);
    }
});
// var select_idcat = _e_type_category.options[_e_type_category.selectedIndex].value;
//   if(select_idcat > -1){
//     select_category_by_idcatetype(select_idcat);
//   }

function select_category_by_idcatetype(select_idcattype){
  var _csrf_token = document.getElementsByName("csrf-token")[0].getAttribute("content");
  var http = new XMLHttpRequest();
  var host = window.location.hostname;
  var url = url_home+"/admin/aduser/departmentby/"+select_idcattype;
  //console.log(url);
  //var params = JSON.stringify({"sel_idcategory":select_idcat});
  http.open("POST", url, true);

  http.setRequestHeader("X-CSRF-TOKEN", _csrf_token);

  http.setRequestHeader("Accept", "application/json");

  http.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
  //var load = _e_frm_reg.getElementsByClassName("loading")[0];
  //load.style.display = "block";
  var _e_catebyidcatetype = document.getElementsByClassName("catebyidcatetype")[0];
  http.onreadystatechange = function() {
      if(http.readyState == 4 && http.status == 200) {
           var myArr = JSON.parse(this.responseText);
           _e_catebyidcatetype.innerHTML =  myArr['result'];      
			     }    
  }
  http.send();
  //http.send(params);
}
function isRealValue(obj){
  return obj && obj !== 'null' && obj !== 'undefined';
}

