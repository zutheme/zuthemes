@extends('admin.dashboard')

@section('other_styles')
   <!-- Datatables -->
      <link href="{{ asset('dashboard/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css') }}" rel="stylesheet">
      <link href="{{ asset('dashboard/vendors/datatables.net-buttons-bs/css/buttons.bootstrap.min.css') }}" rel="stylesheet">
      <link href="{{ asset('dashboard/vendors/datatables.net-fixedheader-bs/css/fixedHeader.bootstrap.min.css') }}" rel="stylesheet">
      <link href="{{ asset('dashboard/vendors/datatables.net-responsive-bs/css/responsive.bootstrap.min.css') }}" rel="stylesheet">
      <link href="{{ asset('dashboard/vendors/datatables.net-scroller-bs/css/scroller.bootstrap.min.css') }}" rel="stylesheet">
    
     <!-- Custom Theme Style -->
    <link href="{{ asset('dashboard/build/css/custom.min.css') }}" rel="stylesheet">
    <link href="{{ asset('dashboard/production/css/custom.css?v=0.1.2') }}" rel="stylesheet">
@stop

@section('content')
   <div class="row">
   	<div class="x_content">
	        <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                <div align="right">
						<a class="btn btn-default btn-primary" href="{{ URL::route('admin.supplier.create') }}">Thêm mới</a>
					</div>
                  <div class="x_title">
                     @if($message = Session::get('success'))
			        	<h2 class="card-subtitle">{{ $message }}</h2>
					@endif               
                  </div>
                  <div class="x_content">
                   <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">
                      <thead>
	                    <tr>
                          <th>ID</th>
                          <th>Mã NCC</th>
                          <th>Kí hiệu NCC</th>
                          <th>Tên NCC</th>
                          <th>address</th>
                          <th>idcountry</th>
                          <th>idprovince</th>
                          <th>idcitytown</th>
                          <th>iddistrict</th>
                          <th>idward</th>
                          <th>phone</th>
                          <th>website</th>
                          <th>fax</th>
                          <th>email</th>
                          <th>-</th>
                          <th>-</th>
                      </tr>
	                </thead>
	                <tfoot>
	                    <tr>
                          <th>ID</th>
	                        <th>Mã NCC</th>
                          <th>Kí hiệu NCC</th>
                          <th>Tên NCC</th>
                          <th>address</th>
                          <th>idcountry</th>
                          <th>idprovince</th>
                          <th>idcitytown</th>
                          <th>iddistrict</th>
                          <th>idward</th>
                          <th>phone</th>
                          <th>website</th>
                          <th>fax</th>
                          <th>email</th>
                          <th>-</th>
                          <th>-</th>
	                    </tr>
	                </tfoot>
	                <tbody>
              	    @foreach($suppliers as $row)
                    <tr>
                      <td>{{ $row['idsupp'] }}</td>
                      <td>{{ $row['idsupplier'] }}</td>
                      <td>{{ $row['sku_supplier'] }}</td>
                      <td>{{ $row['name_supp'] }}</td>
                      <td>{{ $row['address'] }}</td>
                      <td>{{ $row['idcountry'] }}</td>
                      <td>{{ $row['idprovince'] }}</td>
                      <td>{{ $row['idcitytown'] }}</td>
                      <td>{{ $row['iddistrict'] }}</td>
                      <td>{{ $row['idward'] }}</td> 
                      <td>{{ $row['phone'] }}</td> 
                      <td>{{ $row['website'] }}</td>
                      <td>{{ $row['fax'] }}</td> 
                      <td>{{ $row['email'] }}</td>           
                      <td class="btn-control"><a class="btn btn-primary btn-edit" href="{{ action('Admin\SupplierControler@edit',$row['idsupp']) }}"><i class="fa fa-edit"></i></a></td>
                      <td class="btn-control">
                           <form method="post" class="delete_form" action="{{action('Admin\SupplierControler@destroy', $row['idsupp'])}}">
                            {{csrf_field()}}
                            <input type="hidden" name="_method" value="DELETE" />
                            <button type="submit" class="btn btn-danger btn-delete"><i class="fa fa-trash" aria-hidden="true"></i></button>
                           </form>
                      </td>
                    </tr>
                @endforeach            
	                </tbody>
                </table>
              </div>
            </div>
          </div>
	</div>
</div>

@stop
@section('other_scripts')
  
   <!-- Datatables -->
    <script src="{{ asset('dashboard/vendors/datatables.net/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/datatables.net-bs/js/dataTables.bootstrap.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/datatables.net-buttons/js/dataTables.buttons.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/datatables.net-buttons-bs/js/buttons.bootstrap.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/datatables.net-buttons/js/buttons.flash.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/datatables.net-buttons/js/buttons.html5.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/datatables.net-buttons/js/buttons.print.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/datatables.net-fixedheader/js/dataTables.fixedHeader.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/datatables.net-keytable/js/dataTables.keyTable.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/datatables.net-responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/datatables.net-responsive-bs/js/responsive.bootstrap.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/datatables.net-scroller/js/dataTables.scroller.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/jszip/dist/jszip.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/pdfmake/build/pdfmake.min.js') }}"></script>
    <script src="{{ asset('dashboard/vendors/pdfmake/build/vfs_fonts.js') }}"></script>
      <!-- Custom Theme Scripts -->
    {{-- <script src="{{ asset('dashboard/build/js/custom.min.js') }}"></script> --}}
    <script src="{{ asset('dashboard/build/js/custom.js') }}"></script>
    <script src="{{ asset('dashboard/production/js/custom.js?v=0.0.2') }}"></script>
@stop