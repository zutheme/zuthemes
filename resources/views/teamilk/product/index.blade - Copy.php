@extends('teamilk.master')
@section('other_styles')

  <link href="{{ asset('assets-tea/css/custom-product.css?v=0.7.4') }}" rel="stylesheet" type="text/css">

@stop

@section('content')

		<!-- BEGIN: LAYOUT/BREADCRUMBS/BREADCRUMBS-2 -->

{{-- {{ app('request')->input('name') }} --}}

<?php

	$curent_idcategory = 0 ;

	$curent_idcategory = Request::segment(2);
	$curent_posttype = Request::segment(3);

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
        		echo '<li><a href="'.url('/').'/listtypepostbyidcate/'.$item['idcategory'].'/'.$item['catnametype'].'">'.$item['namecat'].'</a>';	
        	}
        }       

    } ?>

<div class="c-layout-breadcrumbs-1 c-subtitle c-fonts-uppercase c-fonts-bold c-bordered c-bordered-both">

	<div class="container">

		<div class="c-page-title c-pull-left">

			@if(isset($rs_lpro) and $rs_lpro[0]['_commit'] > 0)

			<ul class="c-page-breadcrumbs c-theme-nav c-pull-right c-fonts-regular">

			<?php breadcrumb($rs_cat_product,$curent_idcategory,'',0); ?>				

			</ul>

			@elseif(isset($rs_lpro) and $rs_lpro[0]['_commit'] < 1)

				<h5>Not permit</h5>

			@else
				<h5>Chưa có dữ liệu</h5>
			@endif

		</div>

		

	</div>
</div><!-- END: LAYOUT/BREADCRUMBS/BREADCRUMBS-2 -->

<div class="container">

<!--<div class="c-layout-sidebar-menu c-theme ">

	 {{-- @include('teamilk.product.sidebar-grid') --}}

</div>-->

<div class="c-layout-sidebar-content ">

@if(isset($rs_lpro) and $rs_lpro[0]['_commit'] > 0)
	@if($rs_lpro[0]['nametype']=='product')
		@include('teamilk.product.layout-product')
	@elseif($rs_lpro[0]['nametype']=='post')
		@include('teamilk.product.layout-post')
	@endif
	@if(isset($rs_lpro))

	<?php  

		$countpage = $rs_lpro[0]['count_page'];?>

		@if($countpage > 1)

		<?php $curent_page = Request::segment(3); ?>

		<ul class="c-content-pagination c-square c-theme pull-right">

			{{-- <li class="c-prev"><a href="#"><i class="fa fa-angle-left"></i></a></li> --}}

			@for($i=1; $i < ($countpage+1); $i++)

			<?php  $curent_class = ($curent_page == $i) ? 'class="c-active"':'';?>

			<li <?php echo $curent_class ?>><a href="{{ url('/') }}/listproductbypage/{{ $curent_idcategory }}/{{ $i }}">{{ $i }}</a></li>

			@endfor

			{{-- <li class="c-next"><a href="#"><i class="fa fa-angle-right"></i></a></li> --}}

		</ul>

		@endif

	@endif

<!-- END: PAGE CONTENT -->

@elseif(isset($rs_lpro) and $rs_lpro[0]['_commit'] < 0)

	<h4>Contact administator</h4>

@else
	<h4>Chưa có dữ liệu</h4>
@endif

	</div>

</div>

@stop



@section('other_scripts')

    {{-- <script src="{{ asset('dashboard/vendors/datatables.net/js/jquery.dataTables.min.js') }}"></script> --}}

@stop