@extends('admin.dashboard')
@section('other_styles')
     <!-- Custom Theme Style -->
    <link href="{{ asset('dashboard/build/css/custom.min.css') }}" rel="stylesheet">
    <link href="{{ asset('dashboard/production/css/custom.css?v=0.1.2') }}" rel="stylesheet">
@stop
<?php $_namecattype = Request::segment(4);
$_namecattype = isset($_namecattype) ? Request::segment(4) : 'product'; ?>
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
		<form class="frm_create_category" method="post" action="{{ url('admin/category/storeby/'.$_namecattype) }}">
			{{ csrf_field() }}
			<div class="form-group row">
				<label class="col-lg-4 col-form-label" for="parent">Tên chuyên mục <span class="text-danger">*</span></label>
                <div class="col-lg-8">
					<input type="text" name="namecat" class="form-control" placeholder="Tên chuyên mục">
				</div>
			</div>
			
			<div class="form-group row">
                <label class="col-lg-4 col-form-label" for="sel_idparent">Chuyên mục <span class="text-danger">*</span></label>
                <div class="col-lg-8">
                    <select class="form-control cus-drop" name="sel_idparent">
                    	<option value="0">Thuộc chuyên mục</option>
                    	@foreach($categories as $row)
                    		 <option value="{{ $row['idcategory'] }}">{{ $row['namecat'] }}</option>
						@endforeach        
                    </select>
                </div>
            </div>
			<div class="form-group row">
                <label class="col-lg-4 col-form-label" for="sel_idcattype">Kiểu chuyên mục <span class="text-danger">*</span></label>
                <div class="col-lg-8">
                    <select class="form-control cus-drop" name="sel_idcattype">
                    	<option value="">Kiểu chuyên mục</option>
                    	@foreach($categorytypes as $row)
                    		 <option value="{{ $row['idcattype'] }}" {{ $row['catnametype'] == $_namecattype ? 'selected="selected"' : '' }}>{{ $row['catnametype'] }}</option>
						@endforeach        
                    </select>
                </div>
            </div>
            <div class="form-group row">
				<label class="col-lg-4 col-form-label" for="parent">Tên chuyên mục <span class="text-danger">*</span></label>
                <div class="col-lg-8">
					<input type="text" name="pathroute" class="form-control" placeholder="Route">
				</div>
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