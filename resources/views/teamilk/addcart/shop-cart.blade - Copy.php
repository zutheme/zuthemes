@extends('teamilk.master')



@section('other_styles')

   {{-- <link href="{{ asset('dashboard/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css') }}" rel="stylesheet"> --}}

   <!-- BEGIN: BASE PLUGINS  -->

			<link href="{{ asset('assets-tea/assets/plugins/cubeportfolio/css/cubeportfolio.min.css') }}" rel="stylesheet" type="text/css">

			<link href="{{ asset('assets-tea/assets/plugins/owl-carousel/assets/owl.carousel.css') }}" rel="stylesheet" type="text/css">

			<link href="{{ asset('assets-tea/assets/plugins/fancybox/jquery.fancybox.css') }}" rel="stylesheet" type="text/css">

			<link href="{{ asset('assets-tea/assets/plugins/slider-for-bootstrap/css/slider.css') }}" rel="stylesheet" type="text/css">

				<!-- END: BASE PLUGINS -->

			<link href="{{ asset('assets-tea/css/custom-product.css?v=0.8.6') }}" rel="stylesheet" type="text/css">

@stop



@section('content')

<!-- BEGIN: LAYOUT/BREADCRUMBS/BREADCRUMBS-2 -->

<div class="c-layout-breadcrumbs-1 c-subtitle c-fonts-uppercase c-fonts-bold c-bordered c-bordered-both">

	<div class="container">

		<div class="c-page-title c-pull-left">

			<h3 class="c-font-uppercase c-font-sbold">Giỏ hàng</h3>

			<h4 class="">Danh sách sản phẩm đã mua</h4>
			{{ $str_qr }}
			<?php //var_dump($product); ?>
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
			<?php $subtotal = 0; ?>
			@foreach($product as $item)
			<div class="row c-cart-table-row">
				<h2 class="c-font-uppercase c-font-bold c-theme-bg c-font-white c-cart-item-title c-cart-item-first">Item 1</h2>
				<div class="col-md-2 col-sm-3 col-xs-5 c-cart-image">
					<img src="{{ asset($item['url_thumbnail']) }}">
				</div>
				<div class="col-md-4 col-sm-9 col-xs-7 c-cart-desc">
					<h3><a href="{{ action('teamilk\ProductController@show',$item['idproduct']) }}" class="c-font-bold c-theme-link c-font-22 c-font-dark">{{ $item['namepro'] }}</a></h3>
					<p>{{ $item['short_desc'] }}</p>
				</div>
				<div class="col-md-1 col-sm-3 col-xs-6 c-cart-ref">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold"></p>
				</div>
				<div class="col-md-1 col-sm-3 col-xs-6 c-cart-qty">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold">QTY</p>
					<div class="c-input-group c-spinner">
					    <input type="text" class="form-control c-item-1" value="{{ $item['amount'] }}">
					    <div class="c-input-group-btn-vertical">
					    	<button class="btn btn-default" type="button" data_input="c-item-1" data-maximum="10"><i class="fa fa-caret-up"></i></button>
					    	<button class="btn btn-default" type="button" data_input="c-item-1"><i class="fa fa-caret-down"></i></button>
					    </div>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-6 c-cart-price">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold">Unit Price</p>
					<p class="c-cart-price c-font-bold"><span class="currency">{{ $item['price'] }}</span><span class="vnd"></span></p>
				</div>
				<div class="col-md-1 col-sm-3 col-xs-6 c-cart-total">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold">Total</p>
					<p class="c-cart-price c-font-bold"><span class="currency">{{ $item['price']*$item['amount'] }}</span><span class="vnd"></span></p>
				</div>
				<div class="col-md-1 col-sm-12 c-cart-remove">
					<a href="#" class="c-theme-link c-cart-remove-desktop">×</a>
					<a href="#" class="c-cart-remove-mobile btn c-btn c-btn-md c-btn-square c-btn-red c-btn-border-1x c-font-uppercase">Remove item from Cart</a>
				</div>
			</div>
			<?php $subtotal = $subtotal + $item['price']*$item['amount']; ?>
			@endforeach
			<!-- END: SHOPPING CART ITEM ROW -->
			<!-- BEGIN: COMBO ROW -->
		@if(isset($sel_combo_byidproduct) && count($sel_combo_byidproduct) > 0)
			<div class="row c-cart-table-row">
				<h3 class="c-font-uppercase c-font-bold c-font-dark c-cart-item-first">Combo</h3>
				<p>Pháp đồ điều trị theo Chương trình khuyến mãi 40%:</p>
			</div>
			@foreach($sel_combo_byidproduct as $item)
			<div class="row c-cart-table-row">
				<h2 class="c-font-uppercase c-font-bold c-theme-bg c-font-white c-cart-item-title c-cart-item-first">Item 1</h2>
				<div class="col-md-2 col-sm-3 col-xs-5 c-cart-image">
					<img src="{{ asset($item['urlfile']) }}">
				</div>
				<div class="col-md-4 col-sm-9 col-xs-7 c-cart-desc">
					<h3><a href="{{ action('teamilk\ProductController@show',$item['idproduct']) }}" class="c-font-bold c-theme-link c-font-22 c-font-dark">{{ $item['namepro'] }}</a></h3>
					<p>{{ $item['short_desc'] }}</p>
				</div>
				<div class="col-md-1 col-sm-3 col-xs-6 c-cart-ref">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold"></p>
				</div>
				<div class="col-md-1 col-sm-3 col-xs-6 c-cart-qty">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold">QTY</p>
					<div class="c-input-group c-spinner">
					    <input type="text" class="form-control c-item-1" value="{{ $item['quality_combo'] }}">
					    <div class="c-input-group-btn-vertical">
					    	<button class="btn btn-default" type="button" data_input="c-item-1" data-maximum="10"><i class="fa fa-caret-up"></i></button>
					    	<button class="btn btn-default" type="button" data_input="c-item-1"><i class="fa fa-caret-down"></i></button>
					    </div>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-6 c-cart-price">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold">Unit Price</p>
					<p class="c-cart-price c-font-bold"><span class="currency">{{ $item['price_combo'] }}</span><span class="vnd"></span></p>
				</div>
				<div class="col-md-1 col-sm-3 col-xs-6 c-cart-total">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold">Total</p>
					<p class="c-cart-price c-font-bold"><span class="currency">{{ $item['price_combo']*$item['quality_combo'] }}</span><span class="vnd"></span></p>
				</div>
				<div class="col-md-1 col-sm-12 c-cart-remove">
					<a href="#" class="c-theme-link c-cart-remove-desktop">×</a>
					<a href="#" class="c-cart-remove-mobile btn c-btn c-btn-md c-btn-square c-btn-red c-btn-border-1x c-font-uppercase">Xóa</a>
				</div>
			</div>
			<?php $subtotal = $subtotal + $item['price_combo']*$item['quality_combo']; ?>
			@endforeach
		@endif
			<!-- END: COMBO ROW -->
			<!-- BEGIN: GIFT ROW -->
		@if(isset($sel_gift_byidproduct) && count($sel_gift_byidproduct) > 0)
			<div class="row c-cart-table-row">
				<h3 class="c-font-uppercase c-font-bold c-font-dark c-cart-item-first">Quà tặng</h3>
				{{-- <p>Thẻ bảo hành 24 tháng & Thẻ chăm sóc trị giá 105.000.000đ</p> --}}
				<?php var_dump($sel_gift_byidproduct); ?>
			</div>
			@foreach($sel_gift_byidproduct as $item)
			<div class="row c-cart-table-row">
				<h2 class="c-font-uppercase c-font-bold c-theme-bg c-font-white c-cart-item-title c-cart-item-first">Item 1</h2>
				<div class="col-md-2 col-sm-3 col-xs-5 c-cart-image">
					<img src="{{ asset($item['urlfile']) }}">
				</div>
				<div class="col-md-4 col-sm-9 col-xs-7 c-cart-desc">
					<h3><a href="{{ action('teamilk\ProductController@show',$item['idproduct']) }}" class="c-font-bold c-theme-link c-font-22 c-font-dark">{{ $item['namepro'] }}</a></h3>
					<p>{{ $item['short_desc'] }}</p>
				</div>
				<div class="col-md-1 col-sm-3 col-xs-6 c-cart-ref">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold"></p>
				</div>
				<div class="col-md-1 col-sm-3 col-xs-6 c-cart-qty">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold">QTY</p>
					<div class="c-input-group c-spinner">
					    <input type="text" class="form-control c-item-1" value="{{ $item['quality_gift'] }}">
					    <div class="c-input-group-btn-vertical">
					    	<button class="btn btn-default" type="button" data_input="c-item-1" data-maximum="10"><i class="fa fa-caret-up"></i></button>
					    	<button class="btn btn-default" type="button" data_input="c-item-1"><i class="fa fa-caret-down"></i></button>
					    </div>
					</div>
				</div>
				<div class="col-md-2 col-sm-3 col-xs-6 c-cart-price">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold">Unit Price</p>
					<p class="c-cart-price c-font-bold"><span class="currency">{{ $item['price_gift']}}</span><span class="vnd"></span></p>
				</div>
				<div class="col-md-1 col-sm-3 col-xs-6 c-cart-total">
					<p class="c-cart-sub-title c-theme-font c-font-uppercase c-font-bold">Total</p>
					<p class="c-cart-price c-font-bold"><span class="currency">{{ $item['price_gift']*$item['quality_gift'] }}</span><span class="vnd"></span></p>
				</div>
				<div class="col-md-1 col-sm-12 c-cart-remove">
					<a href="#" class="c-theme-link c-cart-remove-desktop">×</a>
					<a href="#" class="c-cart-remove-mobile btn c-btn c-btn-md c-btn-square c-btn-red c-btn-border-1x c-font-uppercase">Remove item from Cart</a>
				</div>
			</div>
			<?php $subtotal = $subtotal + $item['price_gift']*$item['quality_gift']; ?>
			@endforeach
			@endif
			<!-- END: SHOPPING CART ITEM ROW -->
			<!-- BEGIN: SUBTOTAL ITEM ROW -->
			<div class="row">
				<div class="c-cart-subtotal-row c-margin-t-20">
					<div class="col-md-2 col-md-offset-9 col-sm-6 col-xs-6 c-cart-subtotal-border">
						<h3 class="c-font-uppercase c-font-bold c-right c-font-16 c-font-grey-2">Tổng cộng</h3>
					</div>
					<div class="col-md-1 col-sm-6 col-xs-6 c-cart-subtotal-border">
						<h3 class="c-font-bold c-font-16"><span class="currency">{{ $subtotal }}</span><span class="vnd"></span></h3>
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
				<a href="{{ url('/') }}" class="btn c-btn btn-lg c-btn-red c-btn-square c-font-white c-font-bold c-font-uppercase c-cart-float-l">Tiếp tục mua</a>
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

		  	<p><img class="loading" style="display:none;width:30px;" src="{{ asset('dashboard/production/images/loader.gif') }}"></p>	 

		</form>	  	

    </div>

  </div>

</div>  

@stop

@section('other_scripts')
    <!-- BEGIN: PAGE SCRIPTS -->
	<script src="{{ asset('assets-tea/assets/plugins/zoom-master/jquery.zoom.min.js') }}" type="text/javascript"></script>
	<!-- END: PAGE SCRIPTS -->
	<script src="{{ asset('assets-tea/js/shop_cart_service.js?v=0.0.0.1') }}" type="text/javascript"></script>
@stop