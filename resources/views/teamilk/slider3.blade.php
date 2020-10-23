<div class="container-fuild"> 
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      @if(isset($slider))
            <?php $count = 0; $active = "active"; ?>
            @foreach($slider as $row)
              <?php if($count > 0) {
                  $active = "";
              } ?>
              <div class="item {{ $active }}">
                <img src="{{ asset( $row['urlfile'] ) }}" alt="{{ $row['namepro'] }}" style="width:100%;">
              </div>
               <?php $count++; ?>
            @endforeach
          @endif
     </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>