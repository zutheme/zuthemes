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

		<form method="post" action="{{ action('Admin\AduserController@update',$id) }}">

			{{ csrf_field() }}

			<input type="hidden" name="_method" value="PATCH">

			<div class="form-group">

				<input type="password" name="password" class="form-control" placeholder="Mật khẩu">

			</div>

			<div class="form-group">

				<input type="password" name="c_password" class="form-control" placeholder="Nhập lại mật khẩu">

			</div>

			<div class="form-group">

				<input type="submit" class="btn btn-default btn-submit" name="btn-submit" value="Thay đổi" />

			</div>

		</form>

		{{-- <script type="text/javascript">

		var list_sel_empdepart = [];

		var i = 0;

		</script>

		@foreach($l_empdepart_seleted as $row)

		<script type="text/javascript">

			 list_sel_empdepart[i] = {iddepart_employee:'{{$row['iddepart_employee']}}',iddepart:'{{ $row['iddepart'] }}'};

			i = i + 1;

		</script>

		@endforeach --}}

		<form method="post" action="{{action('Admin\AduserController@update',$id)}}">

			{{ csrf_field() }}

			<input type="hidden" name="_method" value="PATCH">

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

    <script src="{{ asset('dashboard/production/js/custom.js?v=0.0.3') }}"></script>

    {{-- <script src="{{ asset('dashboard/production/js/create_mutiselect_department.js?v=0.0.7') }}"></script> --}}
    <script src="{{ asset('dashboard/production/js/select-cate-by-type.js?v=0.0.0.9') }}"></script>
    {{-- <script src="{{ asset('dashboard/production/js/edit_user_depart.js?v=0.0.7') }}"></script> --}}

@stop