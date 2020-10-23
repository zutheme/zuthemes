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

      <link href="{{ asset('dashboard/production/css/custom.css?v=0.3.9.5') }}" rel="stylesheet">

      <!-- bootstrap-daterangepicker -->

      <link href="{{ asset('dashboard/vendors/bootstrap-daterangepicker/daterangepicker.css') }}" rel="stylesheet">

      <!-- bootstrap-datetimepicker -->

      <link href="{{ asset('dashboard/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css') }}" rel="stylesheet">

@stop



@section('content')

<?php //$lists = json_decode($list_selected, true);
      $_start_date_sl = session()->get('start_date');
      $_end_date_sl = session()->get('end_date');
      $_idcategory_sl = session()->get('idcategory');
      $_id_post_type_sl = session()->get('id_post_type');
      $_id_status_type_sl = session()->get('id_status_type');
      $_id_store = session()->get('idstore');
      $_idcategory = isset($_idcategory_sl) ? $_idcategory_sl : Request::segment(4);
      $_id_post_type = isset($_id_post_type_sl) ? $_id_post_type_sl : Request::segment(5);
      $_id_status_type = isset($_id_status_type_sl) ? $_id_status_type_sl : Request::segment(6);
      //$_sel_receive = $lists['_sel_receive'];
?>
<script type="text/javascript">

  var _start_date_sl = '<?php echo $_start_date_sl; ?>';

  var _end_date_sl = '<?php echo $_end_date_sl; ?>';

</script>

   <div class="col-md-12 col-sm-12 col-xs-12">

                <div class="x_panel">

                  <div class="x_title">

                    @if(isset($errors))

                      {{ $errors }}

                    @endif

                     @if($message = Session::get('error'))

                          <h2 class="card-subtitle">{{ $message }}</h2>

                     @endif

                    <ul class="nav navbar-right panel_toolbox">

                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>

                      </li>

                      <li class="dropdown">

                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>

                        {{-- <ul class="dropdown-menu" role="menu">

                          <li><a href="#">Settings 1</a>

                          </li>

                          <li><a href="#">Settings 2</a>

                          </li>

                        </ul>  --}}      

                      </li>

                      <li><a class="close-link"><i class="fa fa-close"></i></a>

                      </li>

                    </ul>

                    <div class="clearfix"></div>

                  </div>

                  <div class="x_title">

                   {{-- <form method="post" action="{{ url('/admin/products/listproductsbydate/'.$_idcategory.'/'.$_id_post_type.'/'.$_id_status_type) }}"> --}}
                   
                   <form method="post" action="{{  url('/admin/listproduct') }}">
                      {{ csrf_field() }}
                      <input type="hidden" name="filter" value="1">
                      <div class="col-sm-2">

                        <div class="form-group">

                            <div class="input-group sel-control" id="myDatepicker1">

                                <input type="text" class="form-control _start_date" name="_start_date">

                                <span class="input-group-addon">

                                   <span class="glyphicon glyphicon-calendar"></span>

                                </span>

                            </div>

                        </div>

                      </div>

                      <div class="col-sm-2">

                        <div class="form-group">

                            <div class="input-group sel-control" id="myDatepicker2">

                                <input type="text" class="form-control _end_date" name="_end_date">

                                <span class="input-group-addon">

                                   <span class="glyphicon glyphicon-calendar"></span>

                                </span>

                            </div>

                        </div>

                      </div>
                      <div class="col-sm-2 text-center">
                        <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-12">Chuyên mục</label>
                        <div class="col-md-9 col-sm-9 col-xs-12">
                          <div class="form-group row">
                            
                              <select class="form-control cus-drop" name="sel_idcat_main" required>
                                <option value="0">--Tất cả--</option>
                                @foreach($categories as $row)
                                   <option value="{{ $row['idcategory'] }}">{{ $row['namecat'] }}</option>
                                @endforeach        
                              </select>
                           
                            <div class="select_dynamic">
                              @if(isset($str))
                                {!! $str !!}
                              @endif
                            </div>
                        </div>
                        </div>
                      </div>
                      </div>
                      <div class="col-sm-2">
                        <div class="form-group">
                          <label class="control-label col-md-3 col-sm-3 col-xs-12">Kiểu post</label>
                          <div class="col-md-9 col-sm-9 col-xs-12">
                            @if(isset($post_types))
                              <select class="form-control sel-control" name="sel_id_post_type" required="true">

                                <option value="0" {{ $_id_post_type_sl == 0 ? 'selected="selected"' : '' }}>Tất cả</option>

                                @foreach($post_types as $row)

                                  <option value="{{ $row['idposttype'] }}" {{ $row['idposttype'] == $_id_post_type_sl ? 'selected="selected"' : '' }}>{{ $row['nametype'] }}</option>

                                @endforeach

                              </select> 

                            @endif
                          </div>
                        </div>
                      </div> 
                      <div class="col-sm-2 text-center">
                       
                      </div>
                       <div class="col-sm-2 text-right">
                         <input type="submit" class="btn btn-default btn-filter-date" name="filter-date" value="Áp dụng" />&nbsp;&nbsp;
                        <a class="btn btn-default btn-primary" href="{{ URL::route('admin.product.create') }}">Tạo mới</a>
                      </div>
                    </form>
                    <div class="clearfix"></div>
                  </div>

                  <div class="x_content">

                    <p class="text-muted font-13 m-b-30"></p>

                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%">

                  <thead>

                      <tr>
                          <td>ID</td>
                          <th>Ngày</th>
                          <th>Tên sản phẩm</th>
                          <th>Giá</th>
                          <th>Số lượng</th>
                          <th>Người đăng</th>
                          <th>Chuyên mục</th>
                          <th>Hình ảnh</th>
                          <th>-</th>

                       </tr>

                   </thead>

                   <tfoot>

                    <tr>
                          <th>ID</th>
                          <th>Ngày</th>
                          <th>Tên sản phẩm</th>
                          <th>Giá</th>
                          <th>Số lượng</th>
                          <th>Người đăng</th>
                          <th>Chuyên mục</th>
                          <th>Hình ảnh</th>
                          <th>-</th>

                       </tr>

                  </tfoot>

                  <tbody>
                    @foreach($products as $row)
                    <tr>
                      <td>{{ $row['idproduct'] }}</td>
                      <td>{{ $row['created_at'] }}</td>
                      <td class="title">{{ $row['namepro'] }}</td>
                      <td><span class="currency">{{ $row['price'] }}</span></td>
                      <td>{{ $row['amount'] }}</td>
                      <td>{{ $row['author'] }}</td>
                      <td>{{ $row['listcat'] }}</td>
                      @if(!isset($row['urlfile']))
                        <td><img class="thumb" src="{{ asset('assets-tea/images/no_photo.jpg') }}"></td>
                      @endif
                      @if(isset($row['urlfile']))
                        <td><img class="thumb" src="{{ asset($row['urlfile']) }}"></td>
                      @endif
                      <td class="btn-control-action">
                        <input type="hidden" name="idpost_row" value="{{ $row['idproduct'] }}">
                        <a href="{{ action('Admin\ProductsController@edit',$row['idproduct']) }}" class="info-number"><i class="fa fa-pencil-square"></i></a>
                      </td>    
                    </tr>
                    @endforeach                

                  </tbody>

              </table>

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

    <script src="{{ asset('dashboard/vendors/moment/min/moment.min.js') }}"></script>

    <script src="{{ asset('dashboard/vendors/bootstrap-daterangepicker/daterangepicker.js') }}"></script>

    <!-- bootstrap-datetimepicker -->    

    <script src="{{ asset('dashboard/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js') }}"></script>

      <!-- Custom Theme Scripts -->

    {{-- <script src="{{ asset('dashboard/build/js/custom.min.js') }}"></script> --}}

    <script src="{{ asset('dashboard/build/js/custom.js?v=0.0.3') }}"></script>

    {{-- <script src="{{ asset('dashboard/production/js/custom.js?v=0.0.2') }}"></script> --}}

    <script src="{{ asset('dashboard/production/js/customer.js?v=0.6.4') }}"></script>
    <script src="{{ asset('dashboard/production/js/filter_select_category.js?v=0.0.4') }}"></script>  
@stop