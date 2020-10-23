
<!-- BEGIN: CONTENT/SLIDERS/CLIENT-LOGOS-2 -->
<div class="c-content-box c-size-md c-bg-white">
	<div class="container">
		<!-- Begin: Testimonals 1 component -->
		<div class="c-content-client-logos-slider-1  c-bordered" data-slider="owl">
			<!-- Begin: Title 1 component -->
			<div class="c-content-title-1">
				<h3 class="c-center c-font-uppercase c-font-bold">Đối Tác</h3>
				<div class="c-line-center c-theme-bg"></div>
			</div>
			<!-- End-->

			<!-- Begin: Owlcarousel -->

			<div class="owl-carousel owl-theme c-theme owl-bordered1 c-owl-nav-center" data-items="6" data-desktop-items="4" data-desktop-small-items="3" data-tablet-items="3" data-mobile-small-items="2" data-slide-speed="5000" data-rtl="false">
				 @if(isset($partner))
                    @foreach($partner as $row)
	                    <div class="item">
					  		<a href="#"><img src="{{ asset($row['urlfile']) }}" alt=""></a>
					  	</div>
                    @endforeach
                @endif 	 
			</div>
	        <!-- End-->
	    </div>
	    <!-- End-->
	</div>
</div><!-- END: CONTENT/SLIDERS/CLIENT-LOGOS-2 -->
		<!-- END: PAGE CONTENT -->