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

      <link href="{{ asset('dashboard/production/css/custom.css?v=0.4.2') }}" rel="stylesheet">

      <!-- bootstrap-daterangepicker -->

      <link href="{{ asset('dashboard/vendors/bootstrap-daterangepicker/daterangepicker.css') }}" rel="stylesheet">

      <!-- bootstrap-datetimepicker -->

      <link href="{{ asset('dashboard/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css') }}" rel="stylesheet">

@stop

@section('content')
<?php if(isset($rs_orderproduct)) {
    $unit_price = 0;
    $subtotal = 0;
  } ?>
   <div class="col-md-12 col-sm-12 col-xs-12">

                <div class="x_panel">

                  <div class="x_title">
                    @if(isset($_idstore))
                      {{ $_idstore }}
                    @endif
                    @if(isset($sel_idstore))
                      {{ $sel_idstore }}
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
                  
                  <div class="x_content">
                    <p class="text-muted font-13 m-b-30"></p>
                    {{-- <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive nowrap" cellspacing="0" width="100%"> --}}
                    <table id="datatable-responsive" class="table table-striped table-bordered dt-responsive" cellspacing="0" width="100%">
                      <thead>
                          <tr>
                              <th>Hình ảnh</th>
                              <th>Mô Tả</th>   
                              <th>Đơn giá</th>
                              <th>Số Lượng</th>
                              <th>Thành giá</th>
                              <th>Trạng thái</th>  
                           </tr>
                       </thead>                    
                          <tbody>
                            @if(isset($rs_orderproduct))
                              @foreach($rs_orderproduct as $row)
                                    <?php $parentidorder = $row['idorder']; ?>
                                    <tr>                     
                                      <td style="text-align: center;"><a href="{{ action('teamilk\ProductController@show',$row['idproduct']) }}"><img width="100%" class="thumb" src="{{ asset($row['urlfile']) }}"></a></td>
                                      <td style="max-width:300px;">
                                        <p>{!! $row['short_desc'] !!}</p>
                                      </td>
                                      <td style="text-align: right;"><span class="currency">{{ $row['price'] }}</span><span class="vnd"></span></td>
                                      <td style="text-align: right;">{{ $row['amount'] }}</td>
                                      <?php $unitprice_quality = $row['price']*$row['amount'] ; ?>
                                      <td style="text-align: right;"><span class="currency">{{ $unitprice_quality }}</span><span class="vnd"></span></td>
                                      <td align="center">
                                        <form method="post" class="delete_form" action="{{ url('admin/orderlist/moveto/'.$ordernumber.'/'.$_idstore) }}">
                                          {{csrf_field()}}
                                         {{-- <input type="hidden" name="_method" value="PATCH"> --}}
                                           {!! $str_select_store !!}
                                          <input type="hidden" name="idexp" value="{{ $row['idexp'] }}">
                                          <input type="hidden" name="idexp" value="{{ $row['idexp'] }}">
                                          <button type="submit" class="btn btn-default"><i class="fa fa-chevron-circle-right" aria-hidden="true"></i></button>
                                         </form>
                                      </td>    
                                    </tr>
                                  <?php $subtotal = $subtotal + $unitprice_quality; ?>
                              @endforeach
                            @endif                 
                      </tbody>
                      <tfoot>
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td style="text-align: left;">Tổng</td>
                          <td style="text-align: right;"><span class="currency">{{ $subtotal }}</span><span class="vnd"></span></td>
                          <td>-</td>    
                       </tr>
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td style="text-align: left;">Phí vận chuyển</td>
                          <td style="text-align: right;"><span class="currency">0000</span><span class="vnd"></span></td>
                          <td>-</td>    
                       </tr>
                        <tr>
                          <td></td>
                          <td></td>
                          <td></td>
                          <td style="text-align: left;">Tổng cộng</td>
                          <td style="text-align: right;"><span class="currency">{{ $subtotal }}</span><span class="vnd"></span></td>
                          <td></td>
                        </tr>
                      </tfoot> 
                  </table>
                  
          </div>

        </div>
        @if(isset($rs_customerorder))
        <table class="table table-striped table-bordered dt-responsive" cellspacing="0" width="100%">                            
            <tbody>
              @foreach($rs_customerorder as $customer)
                @if($customer['cus'] == 1)
                <tr><td>Thông tin khách hàng</td><td></td></tr>
                 <tr>
                    <td>Họ tên:</td><td>{{ $customer['lastname'] }} {{ $customer['middlename'] }} {{$customer['firstname']}}</td>
                  </tr>
                  <tr>                
                    <td>Điện thoại:</td><td>{{ $customer['mobile'] }}</td>
                  </tr>
                  <tr>
                    <td>Địa chỉ:</td><td>{{ $customer['address'].','.$customer['nameward'].','.$customer['namedist'].','.$customer['namecitytown'].','.$customer['nameprovince'].','.$customer['namecountry'] }}</td>
                  </tr>
                @endif
                @if($customer['cus'] > 1 and $customer['idrecipent'] > 0)
                <tr><td>Thông tin người nhận</td></tr>
                 <tr>
                    <td>Họ tên:</td><td>{{ $customer['lastname'] }} {{ $customer['middlename'] }} {{$customer['firstname']}}</td>
                  </tr>
                  <tr>                
                    <td>Điện thoại:</td><td>{{ $customer['mobile'] }}</td>
                  </tr>
                  <tr>
                    <td>Địa chỉ:</td><td>{{ $customer['address'].','.$customer['nameward'].','.$customer['namedist'].','.$customer['namecitytown'].','.$customer['nameprovince'].','.$customer['namecountry'] }}</td>
                  </tr>
                @endif
              @endforeach              
        </tbody>           
        </table>
        @endif
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

    {{-- <script src="{{ asset('dashboard/production/js/customer.js?v=0.6.4') }}"></script> --}}

@stop