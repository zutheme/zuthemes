@extends('teamilk.master')

@section('other_styles')

   {{-- <link href="{{ asset('dashboard/vendors/datatables.net-bs/css/dataTables.bootstrap.min.css') }}" rel="stylesheet"> --}}

@stop

@section('content')

@if(isset($error))

{{ $error }}

@endif
{{-- @include('teamilk.feature') --}}
@include('teamilk.slider3')
{{-- @include('teamilk.service') --}}
{{-- @include('teamilk.shop-banner')  --}}
@include('teamilk.popular')

@include('teamilk.shop-2-2')
@include('teamilk.popular-thung')
{{-- @include('teamilk.shop-1-5')  --}}

{{-- @include('teamilk.grid-3')  --}}

 {{-- @include('teamilk.shop-4-1') --}}

@include('teamilk.shop-2-7')
@include('teamilk.popular-may-loc')
@include('teamilk.shop-linh-kien')
{{-- @include('teamilk.shop-3-1')  --}}

{{--  @include('teamilk.shop-6-1')  --}}
{{-- @include('teamilk.event') --}}
{{-- @include('teamilk.promo-1-2') --}}
 {{-- @include('teamilk.request')  --}}
{{--  @include('teamilk.testimonial')  --}}
@include('teamilk.customer-review') 
@include('teamilk.partner') 
@stop

@section('other_scripts')

   {{-- <script src="{{ asset('assets-tea/custom/order.js?v=0.0.6') }}" type="text/javascript"></script> --}}

@stop