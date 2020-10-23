<!-- BEGIN: CONTENT/SHOPS/SHOP-2-3 -->
<div class="c-content-box c-size-md c-overflow-hide c-bs-grid-small-space bg-shop23">
	<div class="container">
	<div class="c-content-title-1">
		<h3 class="c-font-uppercase c-center c-font-bold c-font-black">Máy lọc nước</h3>
		<div class="c-line-center c-theme-bg"></div>
	</div>
		<div class="row">
			@if(isset($product_mln))
				@foreach($product_mln as $row)
				<div class="col-md-3 col-sm-6 col-xs-6 c-margin-b-20">
					<div class="c-content-product-2 c-bg-white">
						<div class="c-content-overlay">
							@if(isset($row['old_price'])&& $row['old_price'] > $row['price'])<div class="c-label c-bg-red c-font-uppercase c-font-white c-font-13 c-font-bold">Khuyến mãi</div>@endif
							{{-- <div class="c-label c-bg-red c-font-uppercase c-font-white c-font-13 c-font-bold">Sale</div> --}}
							{{-- <div class="c-label c-label-right c-theme-bg c-font-uppercase c-font-white c-font-13 c-font-bold">New</div> --}}
							<div class="c-overlay-wrapper">
								<div class="c-overlay-content">
									<a href="{{ url('/') }}/{{ $row['slug'] }}" class="btn btn-md c-btn-grey-1 c-btn-uppercase c-btn-bold c-btn-border-1x c-btn-square">Xem thêm</a>
								</div>
							</div>
							<div class="c-bg-img-center-contain c-overlay-object custom-item" data-height="height" style="background-image: url({{ asset( $row['urlfile'] ) }})"></div>
						</div>
						<div class="c-info">
							<p class="c-title render c-font-16 c-font-slim">{{ $row['namepro'] }}</p>
							<p class="c-price c-font-16 c-font-slim render-price"><span class="currency">{{ $row['price'] }}</span><span class="vnd"></span> &nbsp;<span class="c-font-16 c-font-line-through c-font-red">@if(isset($row['old_price']) and $row['old_price'] > $row['price'])<span class="currency">{{ $row['old_price'] }}</span><span class="vnd"></span>@endif</span>
							</p>
						</div>
						<div class="btn-group btn-group-justified" role="group">
							<div class="btn-group c-border-top" role="group">
								<a href="{{ url('/') }}/{{ $row['slug'] }}" class="btn btn-lg c-btn-white c-btn-uppercase c-btn-square c-font-grey-3 c-font-white-hover c-bg-red-2-hover c-btn-product">Xem thêm</a>
							</div>
							<div class="btn-group c-border-left c-border-top" role="group">
								<a href="{{ url('/') }}/{{ $row['slug'] }}" class="btn btn-lg c-btn-white c-btn-uppercase c-btn-square c-font-grey-3 c-font-white-hover c-bg-red-2-hover c-btn-product">Mua</a>
							</div>
						</div>
					</div>
				</div>
				@endforeach
			@endif
		
		</div>
		<div class="row">
			<div class="col-md-12 text-center">
				<div class="btn-group c-border-top" role="group">
				<a href="https://allysfast.com/listtypepostbyidcate/6/product" class="btn btn-lg c-btn-white-transparent c-btn-uppercase c-btn-square c-font-grey-3 c-font-white-hover c-bg-red-2-hover c-btn-product">Xem thêm</a>
			</div>
			</div>
		</div>
	</div>
</div><!-- END: CONTENT/SHOPS/SHOP-2-3 -->