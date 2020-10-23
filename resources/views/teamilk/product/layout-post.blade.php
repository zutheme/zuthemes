<!-- BEGIN: PAGE CONTENT -->

	<!-- BEGIN: CONTENT/SHOPS/SHOP-RESULT-FILTER-1 -->

	<!--<div class="c-shop-result-filter-1 clearfix form-inline">-->

		{{-- <div class="c-filter">

			<label class="control-label c-font-16">Trang:</label>

			<select class="form-control c-square c-theme c-input">

				<option value="#?limit=24" selected="selected">24

				<option value="#?limit=25">25

				<option value="#?limit=50">50

				<option value="#?limit=75">75

				<option value="#?limit=100" selected="">100

			</select>

		</div> --}}

		{{-- <div class="c-filter">

			<label class="control-label c-font-16">Sort&nbsp;By:</label>

			<select class="form-control c-square c-theme c-input">

				<option value="#?sort=p.sort_order&amp;order=ASC" selected="selected">Default

				<option value="#?sort=pd.name&amp;order=ASC">Name (A - Z)

				<option value="#?sort=pd.name&amp;order=DESC">Name (Z - A)

				<option value="#?sort=p.price&amp;order=ASC">Price (Low &gt; High)

				<option value="#?sort=p.price&amp;order=DESC" selected="">Price (High &gt; Low)

				<option value="#?sort=rating&amp;order=DESC">Rating (Highest)

				<option value="#?sort=rating&amp;order=ASC">Rating (Lowest)

				<option value="#?sort=p.model&amp;order=ASC">Model (A - Z)

				<option value="#?sort=p.model&amp;order=DESC">Model (Z - A)

			</select>

		</div> --}}

	<!--</div>-->

	<!-- END: CONTENT/SHOPS/SHOP-RESULT-FILTER-1 -->



<div class="c-margin-t-20"></div>



<!-- BEGIN: CONTENT/SHOPS/SHOP-2-7 -->

<div class="c-bs-grid-small-space">
	@if(isset($rs_lpro))
	<?php $count = 0; ?>
	@foreach($rs_lpro as $row)
		@if($count%4 == 0) <div class="row"> @endif	
			<div class="col-md-3 col-sm-6 col-xs-6 c-margin-b-20">

				<div class="c-content-product-2 c-bg-white c-border">

					<div class="c-content-overlay">

						<div class="c-overlay-wrapper">

							<div class="c-overlay-content">

								<a href="{{ url('/') }}/{{ $row['slug'] }}" class="btn btn-md c-btn-grey-1 c-btn-uppercase c-btn-bold c-btn-border-1x c-btn-square">Khám phá</a>

							</div>

						</div>

						<div class="c-bg-img-center-contain c-overlay-object img-post" data-height="height" style="height: 230px; background-image: url({{ asset($row['urlfile']) }})"></div>

					</div>

					<div class="c-info">

						<p class="c-title c-font-16 c-font-slim render">{{ $row['namepro'] }}</p>

					</div>

					<div class="btn-group btn-group-justified" role="group">

						<div class="btn-group c-border-top" role="group">
							
							<a href="{{ url('/') }}/{{ $row['slug'] }}" class="btn btn-sm c-btn-white c-btn-uppercase c-btn-square c-font-grey-3 c-font-white-hover c-bg-red-2-hover c-btn-product">Xem thêm</a>

						</div>


					</div>

				</div>

			</div>

		<?php $count++; ?>

		@if($count%4 == 0) </div> @endif

		@endforeach	

	@endif	



</div><!-- END: CONTENT/SHOPS/SHOP-2-7 -->



<div class="c-margin-t-20"></div>