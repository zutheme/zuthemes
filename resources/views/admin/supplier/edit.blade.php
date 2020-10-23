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

		<h2>Chỉnh sửa</h2>

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

		<form method="post" action="{{ action('Admin\SupplierControler@update',$idsupplier) }}">

			{{ csrf_field() }}

			<input type="hidden" name="_method" value="PATCH">
			<div class="form-group">
				<input type="text" name="idsupplier" class="form-control" placeholder="Mã nhà cung cấp" value="{{ $suppliers->idsupplier }}">
			</div>
			<div class="form-group">
				<input type="text" name="sku_supplier" class="form-control" placeholder="Kí hiệu nhà cung cấp" value="{{ $suppliers->sku_supplier }}">
			</div>
			<div class="form-group">
				<input type="text" name="name_supp" class="form-control" placeholder="Tên nhà cung cấp" value="{{ $suppliers->name_supp }}">
			</div>
			<div class="form-group">
				<input type="text" name="address" class="form-control" placeholder="Địa chỉ" value="{{  $suppliers->address }}">
			</div>
			<div class="form-group">
				<input type="text" name="idcountry" class="form-control" placeholder="Quốc gia" value="{{  $suppliers->idcountry }}">
			</div>
			<div class="form-group">
				<input type="text" name="idprovince" class="form-control" placeholder="Bang/Tỉnh" value="{{  $suppliers->idprovince }}">
			</div>
			<div class="form-group">
				<input type="text" name="idcitytown" class="form-control" placeholder="Thành phố/Thị trấn" value="{{  $suppliers->idcitytown }}">
			</div>
			<div class="form-group">
				<input type="text" name="iddistrict" class="form-control" placeholder="Quận/Huyện" value="{{  $suppliers->iddistrict }}">
			</div>
			<div class="form-group">
				<input type="text" name="idward" class="form-control" placeholder="Phường/xã" value="{{  $suppliers->idward }}">
			</div>
			<div class="form-group">
				<input type="text" name="phone" class="form-control" placeholder="Điện thoại" value="{{  $suppliers->phone }}">
			</div>
			<div class="form-group">
				<input type="text" name="website" class="form-control" placeholder="website" value="{{  $suppliers->website }}">
			</div>
			<div class="form-group">
				<input type="text" name="fax" class="form-control" placeholder="Fax" value="{{  $suppliers->fax }}">
			</div>
			<div class="form-group">
				<input type="text" name="email" class="form-control" placeholder="Email" value="{{  $suppliers->email }}">
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

    <script src="{{ asset('dashboard/production/js/custom.js?v=0.0.3') }}"></script>

    {{-- <script src="{{ asset('dashboard/production/js/create_mutiselect_department.js?v=0.0.7') }}"></script> --}}
   

@stop