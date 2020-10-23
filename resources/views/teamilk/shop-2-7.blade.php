<div class="c-content-box c-size-md c-bg-white">

	<div class="container">

		<div class="c-content-title-1">

			<h3 class="c-center c-font-uppercase c-font-bold">Máy nước nóng lạnh</h3>

			<div class="c-line-center"></div>

		</div>

		<!-- BEGIN: CONTENT/SHOPS/SHOP-2-7 -->

		<div class="c-bs-grid-small-space">

			@if(isset($product_nl))

					<?php $count = 0; ?>

					@foreach($product_nl as $row)
						@if($count%4 == 0) <div class="row"> @endif				

							<div class="col-md-3 col-sm-6 col-xs-6 c-margin-b-20">

								<div class="c-content-product-2 c-bg-white c-border">

									<div class="c-content-overlay">

										<div class="c-overlay-wrapper">

											<div class="c-overlay-content">

												<a href="{{ url('/') }}/{{ $row['slug'] }}" class="btn btn-md c-btn-grey-1 c-btn-uppercase c-btn-bold c-btn-border-1x c-btn-square">Khám phá</a>

											</div>

										</div>

										<div class="c-bg-img-center-contain c-overlay-object custom-item" data-height="height" style="background-image: url({{ asset($row['urlfile']) }});"></div>

									</div>

									<div class="c-info">

										<p class="c-title render c-font-16 c-font-slim">{{ $row['namepro'] }}</p>

										<p class="c-price c-font-16 c-font-slim render-price"><span class="currency">{{ $row['price'] }}</span><span class="vnd"></span> &nbsp;

											@if(isset($row['old_price']) and $row['old_price'] > $row['price'] )<span class="c-font-16 c-font-line-through c-font-red"><span class="currency">{{ $row['old_price'] }}</span><span class="vnd"></span></span>@endif

										</p>

									</div>

									<div class="btn-group btn-group-justified" role="group">

										<div class="btn-group c-border-top" role="group">

											<a href="{{ url('/') }}/{{ $row['slug'] }}" class="btn btn-sm c-btn-white c-btn-uppercase c-btn-square c-font-grey-3 c-font-white-hover c-bg-red-2-hover c-btn-product">Xem thêm</a>

										</div>

										<div class="btn-group c-border-left c-border-top" role="group">

											<a href="{{ url('/') }}/{{ $row['slug'] }}" class="btn btn-sm c-btn-white c-btn-uppercase c-btn-square c-font-grey-3 c-font-white-hover c-bg-red-2-hover c-btn-product">Mua</a>

										</div>

									</div>

								</div>

							</div>

							<?php $count++; ?>

							@if($count%4 == 0) </div> @endif

					@endforeach

				@endif

		</div><!-- END: CONTENT/SHOPS/SHOP-2-7 -->
		<div class="row">
			<div class="col-md-12 text-center">
				<div class="btn-group c-border-top" role="group">
				<a href="https://allysfast.com/listtypepostbyidcate/33/product" class="btn btn-lg c-btn-white-transparent c-btn-uppercase c-btn-square c-font-grey-3 c-font-white-hover c-bg-red-2-hover c-btn-product">Xem thêm</a>
			</div>
			</div>
		</div>
	</div>

</div>