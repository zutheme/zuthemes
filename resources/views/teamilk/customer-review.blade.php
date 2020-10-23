  <!-- BEGIN: CONTENT/TESTIMONIALS/TESTIMONIALS-6-1 -->
<div class="c-content-box c-size-md c-bg-grey-1">
    <div class="container">
        <div class="c-content-blog-post-card-1-slider" data-slider="owl">
            <div class="c-content-title-1">
                <h3 class="c-center c-font-uppercase c-font-bold">Khách hàng đánh giá</h3>
                <div class="c-line-center c-theme-bg"></div>
               {{--  <p class="c-center c-font-uppercase1">Lorem ipsum dolor sit amet et consectetuer adipiscing elit</p> --}}
            </div>
            <div class="owl-carousel owl-theme c-theme c-owl-nav-center" data-items="3" data-slide-speed="8000" data-rtl="false">
                @if(isset($testimonial))
                    @foreach($testimonial as $row)
                        <div class="item">
                            <div class="c-content-testimonial-3 c-option-default">
                                <div class="c-content">{!! $row['description'] !!}</div>
                                <div class="c-person">
                                    <img src="{{ asset($row['urlfile']) }}" class="img-responsive">
                                    <div class="c-person-detail c-font-uppercase">
                                        <h4 class="c-name">{{ $row['namepro'] }}</h4>
                                        <p class="c-position c-font-bold c-theme-font">{{ $row['short_desc'] }}</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                @endif
            </div>
        </div>
    </div>
</div>
<!-- END: CONTENT/TESTIMONIALS/TESTIMONIALS-6-1 -->