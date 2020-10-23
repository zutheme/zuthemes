@extends('teamilk.master')
@section('other_styles')

   {{-- <link href="{{ asset('dashboard/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css') }}" rel="stylesheet"> --}}

   <!-- BEGIN: BASE PLUGINS  -->

			<link href="{{ asset('assets-tea/assets/plugins/cubeportfolio/css/cubeportfolio.min.css') }}" rel="stylesheet" type="text/css">

			<link href="{{ asset('assets-tea/assets/plugins/owl-carousel/assets/owl.carousel.css') }}" rel="stylesheet" type="text/css">

			<link href="{{ asset('assets-tea/assets/plugins/fancybox/jquery.fancybox.css') }}" rel="stylesheet" type="text/css">

			<link href="{{ asset('assets-tea/assets/plugins/slider-for-bootstrap/css/slider.css') }}" rel="stylesheet" type="text/css">

				<!-- END: BASE PLUGINS -->

			<link href="{{ asset('assets-tea/css/custom-product.css?v=0.9.0') }}" rel="stylesheet" type="text/css">

@stop



@section('content')

<!-- BEGIN: LAYOUT/BREADCRUMBS/BREADCRUMBS-2 -->

<div class="c-layout-breadcrumbs-1 c-subtitle c-fonts-uppercase c-fonts-bold c-bordered c-bordered-both">

	<div class="container">

		<div class="c-page-title c-pull-left">

			<h3 class="c-font-uppercase c-font-sbold">Giỏ hàng</h3>

			<h4 class="">Danh sách sản phẩm đã mua</h4>
			<?php $str_session = Session::get('idorderhistory'); 
			 	$Object = json_decode($str_session,true);
				//var_dump($Object); ?>
			{{ $str_qr }}
			@if(isset($error))

				{{-- <h4>{{ $error }}</h4> --}}

			@endif

		</div>

		{{-- <ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular">

			<li><a href="shop-product-details-2.htm">Product Details 2</a></li>

			<li>/</li>

			<li class="c-state_active">Jango Components</li>					

		</ul> --}}

	</div>

</div>
<!-- BEGIN: CONTENT/SHOPS/SHOP-CART-1 -->
<div class="c-content-box c-size-lg">
	<div class="container">
		<div class="c-shop-cart-page-1">
			<div class="row c-cart-table-title">
				<div class="col-md-2 c-cart-image">
					<h3 class="c-font-uppercase c-font-bold c-font-16 c-font-grey-2">Hình ảnh</h3>
				</div>
				<div class="col-md-4 c-cart-desc">
					<h3 class="c-font-uppercase c-font-bold c-font-16 c-font-grey-2">Mô tả</h3>
				</div>
				<div class="col-md-1 c-cart-ref">
					<h3 class="c-font-uppercase c-font-bold c-font-16 c-font-grey-2"></h3>
				</div>
				<div class="col-md-1 c-cart-qty">
					<h3 class="c-font-uppercase c-font-bold c-font-16 c-font-grey-2">Số lượng</h3>
				</div>
				<div class="col-md-2 c-cart-price">
					<h3 class="c-font-uppercase c-font-bold c-font-16 c-font-grey-2">Đơn giá</h3>
				</div>
				<div class="col-md-1 c-cart-total">
					<h3 class="c-font-uppercase c-font-bold c-font-16 c-font-grey-2">Thành giá</h3>
				</div>
				<div class="col-md-1 c-cart-remove"></div>
			</div>
			<!-- BEGIN: SHOPPING CART ITEM ROW -->
			<?php $subtotal = 0; 
				$idcrosstype = 0;
			?>
	@foreach($rs_lstordsess as $row)
		@if($row['parent']==0)
		<?php $idparent = $row['idorder']; ?>	
			<div class="row c-cart-table-row header">
				{{-- <h3 class="c-font-uppercase c-font-bold c-font-dark c-cart-item-first">Dịch vụ</h3> --}}
				@if($row['idcrosstype']==0)
					<p>{{ $row['namepro'] }}</p>
				@endif
			</div>
			<?php $_total_item_parent = $row['price']*$row['inp_session'];?>
			<div class="row c-cart-table-row">
				<input type="hidden" class="idorder" name="idoder" value="{{ $row['idorder'] }}">
				<input type="hidden" class="parent" name="parent" value="0">
				<h2 class="c-font-uppercase c-font-bold c-theme-bg c-font-white c-cart-item-title c-cart-item-first">{{ $row['namepro'] }}</h2>
				<div class="col-md-2 col-sm-3 col-xs-5 c-cart-image">
					<img src="{{ asset($row['urlfile']) }}">
				</div>
				<div class="col-md-4 col-sm-9 col-xs-7 c-cart-desc">
					<h3><a href="{{ action('teamilk\ProductController@show',$row['idproduct']) }}" class="c-font-bold c-theme-link c-font-22 c-font-dark">{{ $row['namepro'] }}</a></h3>
					<p>{{ $row['short_desc'] }}</p>
				</div>
				<div class="col-md-1 col-sm-3 col-xs-6 c-cart-ref">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold"></p>
				</div>
				<div class="col-md-1 col-sm-3 col-xs-6 c-cart-qty">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold">SL</p>
					<div class="c-input-group c-spinner">
					    <input type="text" class="form-control c-item-parent amount" value="{{ $row['inp_session'] }}">
					    <div class="c-input-group-btn-vertical">
					    	
					    	<button class="btn btn-default" type="button" onclick="func_up(this)"><i class="fa fa-caret-up"></i></button>
					    	<button class="btn btn-default" type="button" onclick="func_down(this)"><i class="fa fa-caret-down"></i></button>
					    </div>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-6 c-cart-price">
					<input type="hidden" name="unit-price" class="unit-price" value="{{ $row['price'] }}">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold">Đơn giá</p>
					<p class="c-cart-price c-font-bold"><span class="currency">{{ $row['price'] }}</span><span class="vnd"></span></p>
				</div>
				<div class="col-md-1 col-sm-3 col-xs-6 c-cart-total">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold">Tổng</p>
					<p class="c-cart-price c-font-bold"><span class="currency total-item">{{ $_total_item_parent }}</span><span class="vnd"></span></p>
					<input type="hidden" name="subtotal" class="subtotal" value="{{ $_total_item_parent }}">
				</div>
				<div class="col-md-1 col-sm-12 c-cart-remove">
					<a href="javascript:void(0)" onclick="remove_itemt(this);" class="c-theme-link c-cart-remove-desktop">×</a>
					<a href="javascript:void(0)" onclick="remove_itemt(this);" class="c-cart-remove-mobile btn c-btn c-btn-md c-btn-square c-btn-red c-btn-border-1x c-font-uppercase">Xóa</a>
				</div>
			</div>
			
		<?php $subtotal = $subtotal + $_total_item_parent; ?>
		
		@endif
	@endforeach
			<!-- END: SHOPPING CART ITEM ROW -->
			
			<!-- BEGIN: SUBTOTAL ITEM ROW -->
			<div class="row row-total">
				<div class="c-cart-subtotal-row c-margin-t-20">
					<div class="col-md-2 col-md-offset-9 col-sm-6 col-xs-6 c-cart-subtotal-border">
						<h3 class="c-font-uppercase c-font-bold c-right c-font-16 c-font-grey-2">Tổng cộng</h3>
					</div>
					<div class="col-md-1 col-sm-6 col-xs-6 c-cart-subtotal-border">
						<h3 class="c-font-bold c-font-16"><span class="currency total">{{ $subtotal }}</span><span class="vnd"></span></h3>
					</div>
				</div>
			</div>
		
			<!-- END: SUBTOTAL ITEM ROW -->
			<!-- BEGIN: SUBTOTAL ITEM ROW -->
			{{-- <div class="row">
				<div class="c-cart-subtotal-row">
					<div class="col-md-2 col-md-offset-9 col-sm-6 col-xs-6 c-cart-subtotal-border">
						<h3 class="c-font-uppercase c-font-bold c-right c-font-16 c-font-grey-2">Shipping Fee</h3>
					</div>
					<div class="col-md-1 col-sm-6 col-xs-6 c-cart-subtotal-border">
						<h3 class="c-font-bold c-font-16">$15.00</h3>
					</div>
				</div>
			</div> --}}
			<!-- END: SUBTOTAL ITEM ROW -->
			<!-- BEGIN: SUBTOTAL ITEM ROW -->
			{{-- <div class="row">
				<div class="c-cart-subtotal-row">
					<div class="col-md-2 col-md-offset-9 col-sm-6 col-xs-6 c-cart-subtotal-border">
						<h3 class="c-font-uppercase c-font-bold c-right c-font-16 c-font-grey-2">Grand Total</h3>
					</div>
					<div class="col-md-1 col-sm-6 col-xs-6 c-cart-subtotal-border">
						<h3 class="c-font-bold c-font-16">$261.00</h3>
					</div>
				</div>
			</div> --}}
			<!-- END: SUBTOTAL ITEM ROW -->
			<div class="c-cart-buttons">
				<a href="{{ url('/') }}" class="btn c-btn btn-lg c-btn-red c-btn-square c-font-white c-font-bold c-font-uppercase c-cart-float-l">Mua thêm</a>
				<a href="{{ url('/teamilk/checkout') }}" class="btn c-btn btn-lg c-theme-btn c-btn-square c-font-white c-font-bold c-font-uppercase c-cart-float-r">Kế tiếp</a>
			</div>
		</div>
	</div>
</div><!-- END: CONTENT/SHOPS/SHOP-CART-1 -->
<div class="c-content-box c-size-lg all-items">

	<div class="container">

		<div class="c-shop-cart-page-1">

		</div>

	</div>

</div>

 <script type="text/javascript">

	var _url_show = '{{ action('teamilk\ProductController@show',0) }}';

	_url_show = _url_show.substring(0, _url_show.length-1);

	var url_home = '{{ url('/') }}';

	var _url_check_out = '{{ url('/teamilk/checkout') }}';

</script>

<!-- END: PAGE CONTENT -->
<div class="modal-remove-item">

  <div class="modal-cart">

    <!-- Modal content -->

    <div class="modal-content-cart">

     {{--  <span class="close">&times;</span> --}}

      	<form class="frm-cart">
      		<div class="area-process">
      		<a href="javascript:void(0)"><img class="loading" style="display:none;width:100%;" src="{{ asset('dashboard/production/images/spinner.gif') }}"></a></div>
		</form>	  	

    </div>

  </div>

</div>  
<div class="modal-nocart-form">

  <div class="modal-nocart">

    <div class="modal-content-nocart">

      <span class="close">&times;</span>

      	<form class="frm-nocart">

	  		<div class="col-sm-12 text-center">

		  		<h3>Hiên tại, chưa có sản phẩm trong giỏ</h3>

		  	</div>

		  	<div class="col-sm-12 text-center">

		  		<a href="{{ url('/') }}" class="btn btn-default btn-cart-continue">Tiếp tục mua hàng&nbsp;&nbsp;<i class="fa fa-shopping-cart"></i></a>

		  	</div>

		  	<p><img class="loading" style="display:none;width:80px;" src="{{ asset('dashboard/production/images/spinner.gif') }}"></p>	 

		</form>	  	

    </div>

  </div>

</div>  

@stop

@section('other_scripts')
    <!-- BEGIN: PAGE SCRIPTS -->
	<script src="{{ asset('assets-tea/assets/plugins/zoom-master/jquery.zoom.min.js') }}" type="text/javascript"></script>
	<!-- END: PAGE SCRIPTS -->
	<script src="{{ asset('assets-tea/js/shop_cart_service.js?v=0.1.2.3') }}" type="text/javascript"></script>
@stop