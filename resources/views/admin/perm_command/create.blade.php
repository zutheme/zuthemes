@extends('admin.dashboard')
@section('other_styles')
    <!-- Custom Theme Style -->
    <link href="{{ asset('dashboard/build/css/custom.min.css') }}" rel="stylesheet">
    <link href="{{ asset('dashboard/production/css/custom.css?v=0.1.2') }}" rel="stylesheet">  
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
		<form class="frm_create_permission" method="post" action="{{url('admin/perm_command')}}">
			{{ csrf_field() }}
			<div class="form-group">
				<input type="text" name="name" class="form-control" placeholder="Tên lệnh">
			</div>
			<div class="form-group">
				<textarea name="description" rows="4" cols="100" class="form-control" placeholder="Mô tả..."></textarea>
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
@stop