var tooggle = false;
window.addEventListener("scroll", quick_widget,false);
var _width_device = (window.innerWidth > 0) ? window.innerWidth : screen.width;
var _width = (window.innerWidth > 0) ? window.innerWidth : screen.width;
var calltawkto = false;
var callzalo = false;
var callfb = false;
var callwhatsapp = false;
function quick_widget(){ 
   var top = window.pageYOffset; 
        //var top = document.documentElement.scrollTop;     
   if(top > 100){  
          /*call tawkto*/
          if(!calltawkto){
            //inittawkto();
            //exist_tawkchat();
          }
          /*end call tawkto*/
          if(!callzalo){
            //initzalo();
            //existzalochat();
          }
          if(!callfb){
            initfb();
            existfbchat();
          }
          if(!callwhatsapp){
            //initwhatsapp();
            //existwhatsappchat();
          }
        }
}
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
/*function inittawkto(){
      var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
      s1.async=true;
      s1.src='https://embed.tawk.to/'+htz_option.idtawkto+'/default';
      s1.charset='UTF-8';
      s1.setAttribute('crossorigin','*');
      s0.parentNode.insertBefore(s1,s0);
    calltawkto = true;
}
Tawk_API.onLoad = function(){
    Tawk_API.minimize();
    var e_body = document.getElementsByTagName("body")[0];
    var elast = e_body.lastElementChild;
    elast.style.zIndex = '10000 !important';
    console.log(this);
};*/
/*setTimeout(function(){
  var e_alert_reg = document.getElementsByClassName("alert-reg")[0];
  e_alert_reg.style.display = "none";
},10000);*/
function initwhatsapp(){
    var s1whatsapp=document.createElement("script"),s0whatsapp=document.getElementsByTagName("script")[0];
      s1whatsapp.async=true;
      s1whatsapp.setAttribute('data-id',htz_option.data_id);
      s1whatsapp.src='https://cdn.widgetwhats.com/script.min.js';
      s0whatsapp.parentNode.insertBefore(s1whatsapp,s0whatsapp);
      callwhatsapp = true;
}
function initzalo(){
  var s1zalo=document.createElement("script"),s0zalo=document.getElementsByTagName("script")[0];
      s1zalo.async=true;
      s1zalo.src='https://sp.zalo.me/plugins/sdk.js';
      s0zalo.parentNode.insertBefore(s1zalo,s0zalo);
      callzalo = true;
}
function initfb(){
   window.fbAsyncInit = function() {
            FB.init({
              xfbml            : true,
              version          : 'v8.0'
            });
          };

          (function(d, s, id) {
          var js, fjs = d.getElementsByTagName(s)[0];
          if (d.getElementById(id)) return;
          js = d.createElement(s); js.id = id;
          js.src = 'https://connect.facebook.net/vi_VN/sdk/xfbml.customerchat.js';
          fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));
        callfb = true;
        console.log('facebook');
}

function isRealValues(obj)
{
  return obj && obj !== 'null' && obj !== 'undefined';
}

//console.log(_width);
//var e_testscreen = document.getElementsByClassName("copy-right")[0].getElementsByClassName("testscreen")[0];
//console.log("width="+_width);
// e_testscreen.addEventListener("click", function(){
//   alert(_width);
// });
/*end zalo*/
var e_figure = document.getElementsByClassName("custom-block");
if(e_figure){
  var _width = (window.innerWidth > 0) ? window.innerWidth : screen.width;
  if(_width <= 768 ) {
      for (var i = e_figure.length - 1; i >= 0; i--) {
        e_figure[i].getElementsByTagName("figure")[0].style.maxWidth = "100%";
      }
  }else {
    for (var i = e_figure.length - 1; i >= 0; i--) {
        e_figure[i].getElementsByTagName("figure")[0].style.maxWidth = "60%";
      }
  }
}
function existzalochat(){
  var count_find = 100;
  var internal_zalo_chat_widget = setInterval(function() {
    var xzalowg = document.getElementsByClassName("zalo-chat-widget")[0];
    var xzalo =  xzalowg.getElementsByTagName("iframe")[0];
     if (xzalo) {
        if(_width < 768){
            var c = 1000;
              let _bottom;
            var interval_zalo_mb = setInterval(function() {
              _bottom = xzalowg.style.bottom;
                 if(_bottom!=='0px'&& c < 1){
                    console.log(_bottom,c);
                  clearInterval(interval_zalo_mb);   
               }else if(c < 0){
                  clearInterval(interval_zalo_mb);
                }
                xzalowg.style.left = "13px";
                xzalowg.style.right = "auto"; 
                //xzalowg.style.bottom = "31%";
                xzalowg.style.bottom = "23%";
                xzalowg.style.zIndex = "900000"; 
                c--;
             },100);  
        }else {
	            var c = 1000;
	            let _bottom;
	       		var interval_zalo_desktop = setInterval(function() {
	       		  _bottom = xzalowg.style.bottom;
	               if(_bottom!=='0px'&& c < 1){
	               	  console.log(_bottom,c);
		              clearInterval(interval_zalo_desktop);   
		           }else if(c < 0){
	                clearInterval(interval_zalo_desktop);
	              }
	              xzalowg.style.left = "15px";
	              xzalowg.style.right = "auto"; 
	              //xzalowg.style.bottom = "25%";
                xzalowg.style.bottom = "18%";
	              xzalowg.style.zIndex = "900000"; 
	              c--;
	           },100);     
        }
        clearInterval(internal_zalo_chat_widget);
     }else if(count_find < 0){
        clearInterval(internal_zalo_chat_widget);
     }
     count_find--;
  }, 100); // check every 100ms
}
//messenger
function existfbchat(){
  var count_find = 100;
  var interval_fb = setInterval(function() {
    var x = document.getElementsByClassName("fb_dialog")[0];
     if (x) {
        var efbcustomerchat = document.getElementsByClassName("fb-customerchat")[0];
        var efrm_chat = efbcustomerchat.getElementsByTagName("iframe")[0];
        var efrm = x.getElementsByTagName("iframe")[0];
        if(_width <= 768 ) {
             efrm.style.bottom = "14%";
            efrm.style.left = "8px";
            efrm.style.right = "auto";
            efrm_chat.style.right = "auto";
            efrm_chat.style.left = "5%";
        }else {
            efrm.style.bottom = "15%";
            efrm.style.left = "10px";
            efrm.style.right = "auto";
            efrm_chat.style.right = "auto";
            efrm_chat.style.left = "5%";
        } 
        clearInterval(interval_fb);
     }else if(count_find < 0){
         clearInterval(interval_fb);
     }
     count_find--;
  }, 100);
}
function exist_tawkchat(){
   count_find = 250;
  var interval_tawkchat = setInterval(function() {
  var etawkchat = document.getElementById("PA8mX4D-1594636967573");
     if (etawkchat) {
        //console.log(etawkchat);
        /*if(_width <= 768 ) {
            bubble.style.bottom = "16%";
            bubble.style.left = "15px";
        }else {
            bubble.style.bottom = "10%";
            bubble.style.left = "20px";
            //bubble.style.right = "auto";
        } */
        clearInterval(interval_tawkchat);
     } else if(count_find < 0){
        clearInterval(interval_tawkchat);
     }
      count_find--;
  }, 100); 
}
function existwhatsappchat(){
  var count_find = 100;
  var internal_whatsapp = setInterval(function() {
  	var pa_okewa = document.getElementById("okewa");
     if (pa_okewa) {
     	/*console.log(pa_okewa);*/
     	var x = document.getElementById("okewa-floating_cta");
     	var border = pa_okewa.getElementsByClassName("okewa-pulse_3")[0];
   		var e_popup = document.getElementById("okewa-floating_popup");
        if(_width <= 768 ) {
            x.style.bottom = "23%";
            x.style.left = "18px";
            x.style.right = "auto";
            border.style.bottom = "23%";
            border.style.left = "18px";
            border.style.right = "auto";
            e_popup.style.left = "8%";
        }else {
            x.style.bottom = "18%";
            x.style.left = "20px";
            x.style.right = "auto";
            border.style.bottom = "18%";
            border.style.left = "20px";
            border.style.right = "auto";
            e_popup.style.left = "8%";
        } 
        clearInterval(internal_whatsapp);
     }else if(count_find < 0){
         clearInterval(internal_whatsapp);
     }
     count_find--;
  }, 100); // check every 100ms
}

/*function existboxlink(){
  var count_find = 100;
  var internal_box_link = setInterval(function() {
    var x = document.getElementsByClassName("box-link")[0];
     if (x) {
        var e_fb = x.getElementsByClassName("facebook")[0];
        e_fb.addEventListener("click",function(){
           alert("jo");
        });
        clearInterval(internal_box_link );
     }else if(count_find < 0){
         clearInterval(internal_box_link );
     }
     count_find--;
  }, 100); // check every 100ms
}
existboxlink();*/
