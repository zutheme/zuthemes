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

   <div class="col-md-12 col-sm-12 col-xs-12 text-center">

        <div>

        <h5>Login success</h5>

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