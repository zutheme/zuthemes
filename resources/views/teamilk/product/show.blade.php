@extends('teamilk.master')
@section('other_styles')
   {{-- <link href="{{ asset('dashboard/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css') }}" rel="stylesheet"> --}}
   <!-- BEGIN: BASE PLUGINS  -->
			<link href="{{ asset('assets-tea/assets/plugins/cubeportfolio/css/cubeportfolio.min.css') }}" rel="stylesheet" type="text/css">
			<link href="{{ asset('assets-tea/assets/plugins/owl-carousel/assets/owl.carousel.css') }}" rel="stylesheet" type="text/css">
			<link href="{{ asset('assets-tea/assets/plugins/fancybox/jquery.fancybox.css') }}" rel="stylesheet" type="text/css">
			<link href="{{ asset('assets-tea/assets/plugins/slider-for-bootstrap/css/slider.css') }}" rel="stylesheet" type="text/css">
				<!-- END: BASE PLUGINS -->
			<link href="{{ asset('assets-tea/css/custom-product.css?v=0.7.8') }}" rel="stylesheet" type="text/css">
@stop
@section('content')
<?php
	$curent_idcategory = 0 ;
	if(isset($cate_selected)){
		$curent_idcategory = $cate_selected[0]['idcategory'];
	}
    function breadcrumb($categories, $curent_idcategory = 0, $char = 0, $depth = 0) {
        $cate_child = array();
        $cate_last =  array();
        foreach ($categories as $key => $item) {
            if($item['idcategory'] == $curent_idcategory) {
            	$cate_child[] = $item;
            	unset($categories[$key]);
            	if( $item['idparent'] > 0) {
	                	$char++;$depth++;
	                	breadcrumb($categories, $item['idparent'], $char, $depth); 
	            }
            }
        }               
        if($cate_child){ 
        	foreach ($cate_child as $key => $item) {
        		//echo '<li><a href="'.url('/').'/listproductbyidcate/'.$item['idcategory'].'">'.$item['namecat'].'</a></li>';
        		
        		echo '<li><a href="'.url('/').'/'.$item['slug'].'">'.$item['namecat'].'</a>';		
        	}
        }       
    } ?>
<!-- BEGIN: LAYOUT/BREADCRUMBS/BREADCRUMBS-2 -->
<div class="c-layout-breadcrumbs-1 c-subtitle c-fonts-uppercase c-fonts-bold c-bordered c-bordered-both">
	<div class="container">
		<div class="c-page-title c-pull-left">
			@if(isset($product) and $product[0]['_commit'] > 0)
			<h3 class="c-font-uppercase c-font-sbold">{{ $product[0]['namepro'] }}</h3>
			@else
				<h4 class="">Not permit</h4> 
			@endif
		</div>
			<ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular">
				@if(isset($product) and $product[0]['_commit'] > 0)
				<?php breadcrumb($rs_cat_product, $curent_idcategory, '',0); ?>
				@endif 
			</ul>
	</div>
</div>
<!-- END: LAYOUT/BREADCRUMBS/BREADCRUMBS-2 -->

@if(isset($product) and $product[0]['_commit'] > 0)
	@if ($product[0]['nametype']=='product')
		@include('teamilk.product.show-product')
	@elseif ($product[0]['nametype']=='post')
		@include('teamilk.product.show-post')
	@elseif ($product[0]['nametype']=='page')
		@include('teamilk.page-contact')
	@endif
@endif
<!-- END: CONTENT/SHOPS/SHOP-2-2 -->
 
<!-- END: PAGE CONTENT -->
@if(!isset($product) and $product[0]['_commit'] > 0)
<div class="c-content-box c-size-lg c-overflow-hide c-bg-white">
	<div class="container">
		<div class="c-shop-product-details-2">
			<div class="row">
				<div class="col-md-12 center">
				<h5>Chưa có dữ liệu</h5>
				</div>
			</div>
		</div>
	</div>
</div>
@else
<div class="c-content-box c-size-lg c-overflow-hide c-bg-white">
	<div class="container">
		<div class="c-shop-product-details-2">
			<div class="row">
				<div class="col-md-12 center">
				<h5>Contact administrator</h5>
				</div>
			</div>
		</div>
	</div>
</div>	
@endif
<div class="modal-cart-form">
  <div class="modal-cart">
    <!-- Modal content -->
    <div class="modal-content-cart">
      <span class="close">&times;</span>
      	<form class="frm-cart">
      		<div class="area-process">
      		<a href="javascript:void(0)"><img class="processing" style="display:none;width:100%;" src="{{ asset('dashboard/production/images/spinner.gif') }}"></a></div>
      		<div class="note" style="display: none;">
	      		<div class="col-sm-12">
			  		<h3>Sản phẩm đã thêm vào giỏ hàng</h3>
			  	</div>
			  	<div class="col-sm-6 text-center">
			  		<a href="{{ url('/') }}" class="btn btn-default btn-cart-continue">Tiếp tục mua hàng</a>
			  	</div>
			  	<div class="col-sm-6 text-center">
			  		<a href="{{ url('/cart/shopcart') }}" class="btn btn-default btn-view-cart">Xem giỏ hàng</a>
			  	</div>
			 </div>
		</form>	  	
    </div>
  </div>
</div>

@stop
@section('other_scripts')
    <!-- BEGIN: PAGE SCRIPTS -->
	<script src="{{ asset('assets-tea/assets/plugins/zoom-master/jquery.zoom.min.js') }}" type="text/javascript"></script>
	<!-- END: PAGE SCRIPTS -->
	<script src="{{ asset('assets-tea/js/custom-product.js?v=1.6.9') }}" type="text/javascript"></script>
	
@stop
