@extends('admin.dashboard')



@section('other_styles')



     <!-- Custom Theme Style -->



    <link href="{{ asset('dashboard/build/css/custom.min.css') }}" rel="stylesheet">



    <link href="{{ asset('dashboard/production/css/custom.css?v=0.1.2') }}" rel="stylesheet">



    <link href="{{ asset('dashboard/production/css/editor.css?v=0.0.7') }}" rel="stylesheet">



@stop



@section('content')



<div class="row">



	<div class="col-sm-6">



		<h2>Thêm mới</h2>



		@if(count($errors) > 0)



		<div class="alert alert-danger">



			<ul>



				@foreach($errors->all() as $error)



					<li>{{ $error }}</li>



				@endforeach



			</ul>



		</div>



		@endif



		@if(\Session::has('success'))



			<div class="alert alert-success">



				<p>{{ \Session::get('success') }}</p>



			</div>



		@endif



		<form class="frm_create_role" method="post" action="{{url('admin/supplier')}}">
			{{ csrf_field() }}
			<div class="form-group">
				<input type="text" name="idsupplier" class="form-control" placeholder="Mã nhà cung cấp">
			</div>
			<div class="form-group">
				<input type="text" name="sku_supplier" class="form-control" placeholder="Kí hiệu nhà cung cấp">
			</div>
			<div class="form-group">
				<input type="text" name="name_supp" class="form-control" placeholder="Tên nhà cung cấp">
			</div>
			<div class="form-group">
				<input type="text" name="address" class="form-control" placeholder="Địa chỉ">
			</div>
			<div class="form-group">
				<input type="text" name="idcountry" class="form-control" placeholder="Quốc gia">
			</div>
			<div class="form-group">
				<input type="text" name="idprovince" class="form-control" placeholder="Bang/Tỉnh">
			</div>
			<div class="form-group">
				<input type="text" name="idcitytown" class="form-control" placeholder="Thành phố/Thị trấn">
			</div>
			<div class="form-group">
				<input type="text" name="iddistrict" class="form-control" placeholder="Quận/Huyện">
			</div>
			<div class="form-group">
				<input type="text" name="idward" class="form-control" placeholder="Phường/xã">
			</div>
			<div class="form-group">
				<input type="text" name="phone" class="form-control" placeholder="Điện thoại">
			</div>
			<div class="form-group">
				<input type="text" name="website" class="form-control" placeholder="website">
			</div>
			<div class="form-group">
				<input type="text" name="fax" class="form-control" placeholder="Fax">
			</div>
			<div class="form-group">
				<input type="text" name="email" class="form-control" placeholder="Email">
			</div>		 
			<div class="form-group">
				<input type="submit" class="btn btn-default btn-submit" name="btn-submit" value="Xác nhận" />
			</div>
		</form>



	</div>



</div>



@stop



@section('other_scripts')



    {{-- <script src="{{ asset('dashboard/build/js/custom.min.js') }}"></script> --}}



    <script src="{{ asset('dashboard/build/js/custom.js') }}"></script>



    <script src="{{ asset('dashboard/production/js/custom.js?v=0.0.2') }}"></script>



  {{--   <script src="{{ asset('dashboard/production/js/create_mutiselect_department.js?v=0.1.0') }}"></script> --}}

	<script src="{{ asset('dashboard/production/js/select-cate-by-type.js?v=0.0.0.8') }}"></script>

@stop



