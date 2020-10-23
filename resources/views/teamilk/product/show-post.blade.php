<!-- BEGIN: PAGE CONTENT -->
<!-- BEGIN: CONTENT/SHOPS/SHOP-PRODUCT-TAB-1 -->
<div class="c-content-box c-size-md c-no-padding">
	<div class="c-shop-product-tab-1" role="tabpanel">
		<div class="tab-content">
			<div role="tabpanel" class="tab-pane fade in active" id="tab-1"> 
				<div class="c-product-desc c-center">
					<div class="container">
						<div class="row">
							<div class="col-sm-12 text-left show-post">
								{!! $product[0]['description'] !!}
							</div>
						</div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
</div><!-- END: CONTENT/SHOPS/SHOP-PRODUCT-TAB-1 -->
<!-- BEGIN: combo -->
<?php $idcrosstype = 0; ?>
@if(isset($sel_cross_byidproduct) && count($sel_cross_byidproduct) > 0 )
	@foreach($sel_cross_byidproduct as $item)
		@if($item['idcrosstype'] > $idcrosstype)
			<?php $idcrosstype = $item['idcrosstype']; ?>
				<div class="c-content-box c-size-md c-overflow-hide c-bs-grid-small-space">
					<div class="container">
						<div class="c-content-title-4">
							<h3 class="c-font-uppercase c-center c-font-bold c-line-strike"><span class="c-bg-white">{{ $item['namecross'] }}</span></h3>
						</div>
						<div class="row">
							<div data-slider="owl">
								<div class="owl-carousel owl-theme c-theme owl-small-space c-owl-nav-center" data-rtl="false" data-items="4" data-slide-speed="8000">
										@foreach($sel_cross_byidproduct as $row)
											@if($row['idcrosstype']==$idcrosstype)
											<div class="item">
												<div class="c-content-product-2 c-bg-white c-border">
													<div class="c-content-overlay">
														{{-- @if($row['price_sale_origin'])<div class="c-label c-bg-red c-font-uppercase c-font-white c-font-13 c-font-bold">Khuyến mãi</div>@endif --}}		
														<div class="c-overlay-wrapper">
															<div class="c-overlay-content">
																<a href="{{ action('teamilk\ProductController@show',$row['idproduct']) }}" class="btn btn-md c-btn-grey-1 c-btn-uppercase c-btn-bold c-btn-border-1x c-btn-square">Xem giá gốc</a>
															</div>
														</div>
														<div class="c-bg-img-center-contain c-overlay-object" data-height="height" style="height: 270px; background-image: url({{ asset($row['urlfile']) }}"></div>
													</div>
													<div class="c-info">
														<p class="c-title c-font-18 c-font-slim">{{ $row['namepro'] }}</p>
														<p class="c-price c-font-16 c-font-slim"><span class="currency">{{ $row['price']}}</span><span class="vnd"></span> &nbsp;
															<span class="c-font-16 c-font-slim">x{{ $row['quality_sale'] }}(buổi)</span>
															{{-- <span class="c-font-16 c-font-line-through c-font-red">@if($row['price_sale_origin'])<span class="currency">{{ $row['price_sale_origin'] }}</span><span class="vnd"></span>@endif</span> --}}
														</p>
													</div>
													<div class="btn-group btn-group-justified" role="group">
														<div class="btn-group c-border-top" role="group">
															<a href="javascript:void(0)" class="btn btn-lg c-btn-white c-btn-uppercase c-btn-square c-font-grey-3 c-font-white-hover c-bg-red-2-hover c-btn-product">Thích</a>
														</div>
														<div class="btn-group c-border-left c-border-top" role="group">
															<a href="{{ action('teamilk\ProductController@show',$row['idproduct']) }}" class="btn btn-lg c-btn-white c-btn-uppercase c-btn-square c-font-grey-3 c-font-white-hover c-bg-red-2-hover c-btn-product">Mua</a>
														</div>
													</div>
												</div>
											</div>
											@endif
										@endforeach
								</div>
							</div>
						</div>
					</div>
				</div>
		@endif
	@endforeach
@endif
@section('other_scripts')

    {{-- <script src="{{ asset('dashboard/vendors/datatables.net/js/jquery.dataTables.min.js') }}"></script> --}}
    <script src="{{ asset('assets-tea/js/custom-post.js?v=0.0.8') }}" type="text/javascript"></script>
@stop