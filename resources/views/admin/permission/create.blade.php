@extends('admin.dashboard')
@section('other_styles')
    <!-- Custom Theme Style -->
    <link href="{{ asset('dashboard/build/css/custom.min.css') }}" rel="stylesheet">
    <link href="{{ asset('dashboard/production/css/custom.css?v=0.1.3') }}" rel="stylesheet">  
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
		<form class="frm_create_permission" method="post" action="{{url('admin/permission')}}">
			{{ csrf_field() }}
			<div class="form-group">
				<input type="text" name="name" class="form-control" placeholder="Tên quyền">
			</div>
			<div class="form-group">
				<textarea name="description" rows="4" cols="100" class="form-control" placeholder="Mô tả..."></textarea>
			</div>
			<div class="form-group"> 
            	<select class="select2_single form-control" name="idpermcommand">
            		<option value="0">Chọn lệnh thực thi ...</option>
                	@foreach($perm_commands as $row)
                      <option value="{{ $row['idpercommand'] }}">{{ $row['command'] }}</option>
					@endforeach 
				 </select>                                         
            </div>
            <div class="form-group">
            	<select class="form-control type-category" name="selidcategory" required="true">
            		<option value="">Chuyên mục</option>
            		@foreach($categorytypes as $row)
            			<option value="{{ $row['idcattype'] }}">{{ $row['catnametype'] }}</option>
					@endforeach        
	         	</select>
	        </div>
			<div class="form-group">
	            <div class="catebyidcatetype">     
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
    <script src="{{ asset('dashboard/production/js/select-typecate.js?v=0.0.0.5') }}"></script>
@stop