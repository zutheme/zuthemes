@extends('admin.dashboard')
@section('other_styles')
   {{-- <link rel="stylesheet" type="text/css" href="{{ asset('bower_components/bootstrap3-wysihtml5-bower/dist/bootstrap3-wysihtml5.min.css') }}"></link> --}}
   <link href="{{ asset('dashboard/production/editor/editor.css') }}" type="text/css" rel="stylesheet"/>
   <link href="{{ asset('dashboard/production/css/editor.css?v=0.1.1') }}" rel="stylesheet">
  
     <!-- Custom Theme Style -->
    <link href="{{ asset('dashboard/build/css/custom.min.css') }}" rel="stylesheet">
    <link href="{{ asset('dashboard/production/css/custom.css?v=0.8.5') }}" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="{{ asset('dashboard/vendors/bootstrap-daterangepicker/daterangepicker.css') }}" rel="stylesheet">
    <!-- bootstrap-datetimepicker -->
    <link href="{{ asset('dashboard/vendors/bootstrap-datetimepicker/build/css/bootstrap-datetimepicker.css') }}" rel="stylesheet">
@stop
@section('content')
<?php 	$idimpcross = app('request')->input('idimpcross'); 
		$no_thumbnail = 'dashboard/production/images/no_photo.jpg';
		$idposttype = Request::segment(6);
		$idposttype = isset($idposttype) ? $idposttype : 3;

		?>
<div class="row">
	<div class="col-md-12 col-xs-12">
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
		@if(\Session::has('getlist'))
			<div class="alert alert-success">
				<p>{!! \Session::get('getlist') !!}</p>
			</div>
		@endif
	</div>
</div>
<script type="text/javascript">
  var _start_date_sl = '';
  var _end_date_sl = '';
</script>
<div class="row">
		<form class="frm_edit_post" method="post" action="{{ action('Admin\ProductsController@update',$idproduct) }}" onsubmit="return readytextarea()" enctype="multipart/form-data">
			{{ csrf_field() }}
			<input type="hidden" name="_method" value="PATCH">
			<input type="hidden" name="idimp" value="{{ $product[0]['idimp'] }}">
			<div class="col-md-9 col-xs-12">
			<div class="form-group">
				{{-- <button type="button" onclick="pasteHtmlAtCaret(test)" value="addlink">insert link</button> --}}
				<a class="btn btn-default btn-gallery" href="javascript:void(0)"><i class="fa fa-photo"></i> Media</a>
			</div>
			<div class="form-group">
				<input type="text" name="title" class="form-control" placeholder="Chủ đề" required value="{{ $product[0]['namepro'] }}" />
			</div>
			<div class="form-group">
				<input type="text" name="slug" class="form-control" placeholder="Slug" value="{{ $product[0]['slug'] }}">
			</div>
			<div class="form-group">
              <div class="x_panel">         
                <div class="x_content">
                  <div id="alerts"></div>
                   <input type="hidden" name="render" value="{{ $product[0]['description'] }}" />         
                   <input id="txtEditor" name="body" value="{{ $product[0]['description'] }}" />         
                   {{-- <textarea id="txtEditor" name="body"></textarea> --}}
                </div>
              </div>
			</div>
			 
	          <div class="form-group short_desc">
	            <label class="control-label col-md-3 col-sm-3 col-xs-12">Mô tả vắn tắt</label>
	            <div class="col-md-12">
	              <textarea name="short_desc" class="form-control" rows="3" cols="50" placeholder="Mô tả vắn tắt">{{ $product[0]['short_desc'] }}</textarea>
	            </div>
	          </div>
	           <div class="ln_solid"></div>
			<div class="form-group"> 
				<div class="col-lg-12">
					@if(isset($gallery)) 
						<script>
					    var item ='';
					    var list_gallery = [];
					    //console.log(list_gallery);
						</script> 
						<ul class="multi-file">
							@foreach($gallery as $row)
							<li class="item{{ $row['idfile'] }}">
								<input class="producthasfile" type="hidden" name="edit-gallery[]" value="0">	
					     		<a href="javascript:void(0);" onclick="performClickByClass(this);">Chỉnh sửa&nbsp;&nbsp;<i class="fa fa-paperclip" aria-hidden="true"></i>&nbsp;&nbsp;</a>
								<input onchange="editfile(event,this,'{{ $row['idproducthasfile'] }}');" type="file" style="display: none;" name="file_attach[]" class="file file_attach" accept=".xlsx,.xls,image/*,.doc, .docx,.ppt, .pptx,.txt,.pdf,.zip,.rar" />
								<label class="namefile"></label>
			                    <p><canvas class="my_canvas gallery" width="0px" height="0px"></canvas></p>
			                    <script> 
			                    	var item = '{{ asset($row['urlfile']) }}';
			                    	if(item) {
			                    		list_gallery.push(item); 
			                    	}
			                    </script>
			                    <p><a href="javascript:void(0);" class="btn bnt-default btn-trash" style="display: block;" onclick="trash_item('item{{ $row['idfile'] }}','{{ $row['idproducthasfile'] }}');"><i class="fa fa-trash" aria-hidden="true"></i></a></p>
			                    <p><img class="loading-trash" style="display:none;width:30px;" src="{{ asset('dashboard/production/images/loader.gif') }}"></p>
							</li>
							 @endforeach
						</ul>
					@endif
					<p><input type="button" style="display: block" class="btn btn-default btn-more-file" name="btn-more-file" value="Thêm file" /></p>
					 <div class="ln_solid"></div>
				</div>
			</div>
			
            
              <!--product relative with another product-->
               @foreach($rs_sel_impbyidpro as $item)
               <?php $class = ($item['idimp']==$idimpcross) ? "fade-row":"visable-row"; ?>
               		<div class="ln_solid"></div>
	            	<div class="row <?php echo $class; ?>">
					 <div class="col-sm-6 col-xs-6">	
				   	  <input type="hidden" name="l_cross_idimp[]" value="{{ $item['idimp'] }}">
				   	  <input class="cross_id_status_type" type="hidden" name="l_cross_id_status_type[]" value="{{ $item['id_status_type'] }}"> 
			          <div class="form-group">
			          	  <label class="control-label col-md-3 col-sm-3 col-xs-12">Giá theo:</label>
				          <div class="col-md-9 col-sm-9 col-xs-12">
					          <select name="l_cross_selidtype[]">
					          	<option value="0">-----</option>
					          	@foreach($sel_cross_type as $option)
					          	<option value="{{ $option['idcrosstype'] }}" {{ $option['idcrosstype'] == $item['idcrosstype'] ? 'selected="selected"' : '' }}>{{ $option['namecross']}}</option>
					          	@endforeach
					          </select>
					      </div>
			      	  </div>
			          
			          
		             <div class="form-group">
				          	<a class="remove-product-belong" href="javascript:void(0)" onclick="remove(this)"><i class="fa fa-trash"></i>&nbsp;Xóa</a>
				      	  </div>
			      	</div>
			          @if($item['idparentcross'] > 0 && $item['idparentcross'] != $idproduct)
			           <div class="col-sm-6 col-xs-6">
			          	<div class="form-group">         	
			          	<figure>
						  <img class="thumb" src="{{ asset($item['urlfile']) }}" alt="" style="width:100%">
						  <figcaption><a href="{{ action('Admin\PostsController@edit',$item['idparentcross']) }}" class="name-product">{{ $item['namepro'] }}</a>
						  	{{-- <p>{{ $item['short_desc'] }}</p> --}}
						  </figcaption>
						</figure>
		          		
		      	  		</div>
		      	  		</div>	      	  		
		      	  		@endif 
	              </div>

              @endforeach
              <!--end another product -->
              	<!--extend atribute-->
              <div class="ln_solid"></div>
              	<h5 class="tip">Sản phẩm liên quan</h5>
	          	<div class="cross-product">
		         @foreach($sel_cross_byidproduct as $row)	         		  
		          <div class="row">
		          	<div class="col-sm-9">
		          		<div class="form-group">
		          			<label>{{ $row['namepro'] }}</label>
		          		</div>
		          		<input type="hidden" name="l_cross_idimp[]" value="{{ $row['idimp'] }}">
      					<input class="cross_id_status_type" type="hidden" name="l_cross_id_status_type[]" value="{{ $row['id_status_type'] }}"> 
			          	<div class="form-group">
			          	  <label class="control-label col-md-3 col-sm-3 col-xs-12">Giá theo:</label>
				          <div class="col-md-9 col-sm-9 col-xs-12">
					          <select name="l_cross_selidtype[]">
					          	<option value="0">-----</option>
					          	@foreach($sel_cross_type as $option)
					          	<option value="{{ $option['idcrosstype'] }}" {{ $option['idcrosstype'] == $row['idcrosstype'] ? 'selected="selected"' : '' }}>{{ $option['namecross']}}</option>
					          	@endforeach
					          </select>
					      </div>
			      	  	</div>	       		
		                 <div class="form-group">
				            <label class="control-label col-md-3 col-sm-3 col-xs-12">Giá sale:</label>
				            <div class="col-md-9 col-sm-9 col-xs-12">
				              <input type="text" name="l_cross_price[]" class="form-controls" value="{{ $row['price'] }}" />
				            </div>
				          </div>
				          <div class="form-group">
				            <label class="control-label col-md-3 col-sm-3 col-xs-12">Số lượng sale:</label>
				            <div class="col-md-9 col-sm-9 col-xs-12">
				              <input type="text" name="l_cross_quality_sale[]" class="form-controls" value="{{ $row['quality_sale'] }}" />
				            </div>
				          </div>
				      	  <div class="row">
				      	  	<a class="btn btn-default btn-apply-date" href="javascript:void(0);" onclick="showdate(this);">Áp dụng ngày</a>
			          		<div class="apply-date" style="display:none">
					              <div class="col-md-6 col-sm-6 col-xs-12">
					              	<div class="form-group">
					              	   <label class="control-label col-md-4 col-sm-3 col-xs-12">Từ ngày:</label>
				                       <div class="col-md-8 col-sm-9 col-xs-12 input-group sel-control myDatepicker1">
				                            <input type="text" class="form-control _start_date" name="l_cross_start_date[]" value="{{ $row['fromdate'] }}">
				                            <span class="input-group-addon">
				                               <span class="glyphicon glyphicon-calendar"></span>
				                            </span>
				                        </div>
				                    </div>
					              </div>
					              <div class="col-md-6 col-sm-6 col-xs-12">
					              	<div class="form-group">
					              	 <label class="control-label col-md-4 col-sm-3 col-xs-12">Đến ngày:</label>
				                      <div class="col-md-8 col-sm-9 col-xs-12 input-group sel-control myDatepicker2">
				                        <input type="text" class="form-control _end_date" name="l_cross_end_date[]" value="{{ $row['todate'] }}">
				                        <span class="input-group-addon">
				                           <span class="glyphicon glyphicon-calendar"></span>
				                        </span>
				                        </div>
				                    </div>
					              </div>
					            </div>
				           </div>
				           <div class="form-group">
				          	<a href="{{ action('Admin\ProductsController@edit',[$row['idproduct'],'idimpcross' => $row['idimp']]) }}" class="info-number">Chỉnh sửa <i class="fa fa-pencil-square"></i></a>&nbsp;&nbsp;<a class="remove-product-belong" href="javascript:void(0)" onclick="remove(this)"><i class="fa fa-trash"></i>&nbsp;Xóa</a>
				      	  </div>
				    </div>
				    <div class="col-sm-3 text-center">
				    	<?php $thumbnail = $row['urlfile']; 
				    	if(!$thumbnail) { $thumbnail = $no_thumbnail; } ?>
				    	<a href="{{ action('Admin\ProductsController@edit',$row['idproduct']) }}"><img class="thumb-cross" src="{{ asset($thumbnail) }}" /></a>
				    </div>
				</div>
				<div class="ln_solid"></div>		
				  @endforeach
				</div>
				<a class="btn btn-primary edit-product-belong" href="javascript:void(0)" onclick="cate_products(this);"><i class="fa fa-edit"></i>&nbsp;Tạo mới quan hệ với sp khác</a>&nbsp;
				<span class="dropdown">
				    <button class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown">Tạo sp mới quan hệ với sp hiện tại
				    <span class="caret"></span></button>
				    <ul class="dropdown-menu">
				      @foreach($sel_cross_type as $row)
	                		<li><a href="{{ action('Admin\ProductsController@create',['idparent' => $idproduct,'idcrosstype' => $row['idcrosstype']] ) }}" class="btn btn-default btn-create-new">{{ $row['namecross'] }}</a></li>
						@endforeach 
				    </ul>
				  </span>
				
			</div>
			<div class="col-md-3 col-xs-12">
				<div class="form-group row">
	                <label class="col-lg-4 col-form-label" for="sel_idposttype">Kiểu post <span class="text-danger">*</span></label>
	                <div class="col-lg-8">
	                    <select class="form-control cus-drop" name="sel_idposttype" required >
	                    	<option value="">Chọn kiểu post</option>
	                    	@foreach($posttypes as $row)
	                    		<option value="{{ $row['idposttype'] }}" {{ $row['idposttype'] == $idposttype ? 'selected="selected"' : '' }}>{{ $row['nametype'] }}</option>
							@endforeach        
	                    </select>
	                </div>
	            </div>
	            <div class="form-group row">
	                <label class="col-lg-4 col-form-label" for="sel_idstatustype">Trạng thái <span class="text-danger">*</span></label>
	                <div class="col-lg-8">
	                    <select class="form-control cus-drop" name="sel_idstatustype" required >
	                    	<option value="">Chọn trạng thái</option>
	                    	@foreach($statustypes as $row)
	                    		 <option value="{{ $row['id_status_type'] }}" {{ $row['id_status_type'] == $product[0]['id_status_type'] ? 'selected="selected"' : '' }}>{{ $row['name_status_type'] }}</option>
							@endforeach        
	                    </select>
	                </div>
	            </div>
				<div class="form-group row">
	                <label class="col-lg-12 col-form-label" for="sel_idcategory">Chuyên mục chính<span class="text-danger">*</span></label>
	                <div class="col-lg-12">
	                    <select class="form-control cus-drop" name="sel_idcat_main" required>
	                    	<option value="0">--Tất cả--</option>
	                    	@foreach($categories as $row)
	                    		 <option value="{{ $row['idcategory'] }}">{{ $row['namecat'] }}</option>
							@endforeach        
	                    </select>
	                </div>
	            </div>
	            <div class="form-group row">
	            	<div class="col-lg-12">
	            		<div class="select_dynamic">
			            	@if(isset($str))
			            		{!! $str !!}
			            	@endif
		            	</div>
		            </div>
	            </div>
	            <script>var _url_thumbnail = '{{ asset($product[0]['url_thumbnail']) }}';</script>
	            <div class="form-group frm-image thumbnails">
                    <p><a href="javascript:void(0)" onclick="performClick('file1');"><i class="fa fa-camera-retro" aria-hidden="true"></i>&nbsp;&nbsp;&nbsp;Ảnh đại diện</a>
                    <input style="display:none" type="file" name="thumbnail" class="file" id="file1" accept="image/*"/></p>
                    <p><canvas id="canvas_thumbnail" width="0px" height="0px"></canvas></p>
				</div>	
	            <div class="form-group text-right">
					<input type="submit" class="btn btn-default btn-submit" name="btn-submit" value="Xác nhận" />
				</div>
			 </div> 
		</form>
		
</div>
<div class="modal-media-form">
  <div class="modal-media">
    <!-- Modal content -->
    <div class="modal-content-media">
      <span class="close">&times;</span>
      	<form class="frm-media">
		  <div class="input-group-media">
			<a href="javascript:void(0);" onclick="performClickByClass(this);"><i class="fa fa-photo"></i>&nbsp;&nbsp;Chọn tập tin&nbsp;&nbsp;</a>
			<input onchange="changefile(event,this);" type="file" style="display: none;" name="file_attach[]" class="file file_attach" accept=".xlsx,.xls,image/*,.doc, .docx,.ppt, .pptx,.txt,.pdf,.zip,.rar" />
			<label class="namefile"></label>
            <p><canvas id="my_canvas_media" class="my_canvas" width="500px" height="500px"></canvas></p>
		  </div>
		  <div class="input-group-media area-btn"><a class="btn btn-default btn-insert-picture">Chèn vào bài viết</a></div>
		  <div class="input-group-media">
		  	<p><img class="loading" style="display:none;width:30px;" src="{{ asset('dashboard/production/images/loader.gif') }}"></p>
		  	<span class="result"></span>  	
		  </div>	 
		</form>	  	
    </div>
  </div>
</div>
<div class="modal-cross-form">
  <div class="modal-cross">
    <!-- Modal content -->
    <div class="modal-content-cross">
      <span class="close">&times;</span>
      	<form class="frm-cross form-horizontal form-label-left" method="post" action="{{ action('Admin\ProductsController@crossproduct',$idproduct) }}">
      	  {{ csrf_field() }}
		  <div class="cross-product">
		  	  <div class="form-group" style="display: none;">
		  	  	<div class="col-sm-12">
			  	  	<select class="form-control cus-drop" name="cross_sel_idposttype" required >
		                    	<option value="">Chọn kiểu post</option>
		                    	@foreach($posttypes as $row)
		                    		<option value="{{ $row['idposttype'] }}" {{ $row['nametype'] == 'product' ? 'selected="selected"' : '' }}>{{ $row['nametype'] }}</option>
								@endforeach        
		             </select>
		        </div>
		  	  </div>
		  	  <div class="row">
		  	   <div class="form-group">
		            <label class="col-sm-12 lbleft">Tên sản phẩm:</label>
		            <div class="col-sm-12">
		              <input type="text" name="cross_namepro" class="form-control" value="" />
		            </div>
		      </div>
		  	  <div class="form-group">
	            <label class="col-sm-12 lbleft">Mô tả:</label>
	            <div class="col-sm-12">
	              <textarea rows="2" name="cross_description" class="form-control" placeholder=""></textarea>
	            </div>
	          </div>       	  
	      	  <div class="form-group">
	            <label class="control-label col-md-3 col-sm-3 col-xs-12">Hình đại diện:</label>
	            <div class="col-md-9 col-sm-9 col-xs-12">
	              <input type="text" name="cross_id_thumbnail" class="form-controls" value="" />
	            </div>
	          </div>
	      	   </div>
	      	   <div class="row">
			  	  {{-- <div class="form-group">
		            <label class="control-label col-md-3 col-sm-3 col-xs-12">Giá nhập hàng:</label>
		            <div class="col-md-9 col-sm-9 col-xs-12">
		              <input type="hidden" name="price_import" class="form-controls" value="0" />
		            </div>
		          </div>  --}}
	          
		          <div class="form-group">
		            <label class="control-label col-md-3 col-sm-3 col-xs-12">Giá bán:</label>
		            <div class="col-md-9 col-sm-9 col-xs-12">
		              <input type="text" name="price" class="form-controls" value="" />
		            </div>
		          </div>
		          {{-- <div class="form-group">
		            <label class="control-label col-md-3 col-sm-3 col-xs-12">Số lượng:</label>
		            <div class="col-md-9 col-sm-9 col-xs-12">
		              <input type="hidden" name="amount" class="form-controls" value=""/>
		            </div>
		          </div> --}}
	          	</div>
	          </div>
	          <div class="form-group">
	          	<button type="submit" class="btn btn-primary btn-submit-cross">Xác nhận</button>
	          </div> 
		</form>	  	
    </div>
  </div>
</div>
<div class="modal-cate-form">
  <div class="modal-cate">
    <!-- Modal content -->
    <div class="modal-content-cate">
      <span class="close" onclick="close_cate();">&times;</span>
      	{{-- <form class="frm-cate" method="post" action="{{ action('Admin\ProductsController@makenewcrosstype',$idproduct) }}"> --}}
      	<form class="frm-cate" method="post" action="{{ action('Admin\ProductsController@makenewcrosstype',$idproduct) }}">
      		{{ csrf_field() }}
			<div class="form-group row">
			    <label class="col-sm-12 col-form-label" for="sel_idcategory">Chuyên mục chính<span class="text-danger">*</span></label>
			    <div class="col-sm-12">
			        <select class="form-control cus-drop" name="sel_idcat_main_edit" required>
			        	<option value="0">--Tất cả--</option>
			        	@foreach($categories as $row)
			        		 <option value="{{ $row['idcategory'] }}">{{ $row['namecat'] }}</option>
						@endforeach        
			        </select>
			    </div>
			</div>
			<div class="form-group row">
	        	<div class="col-lg-12">
	        		<div class="select_dynamic_edit">
		            	@if(isset($str))
		            		{!! $str !!}
		            	@endif
	            	</div>
	            </div>
	        </div>
	        <div class="form-group row">
	        	<div class="col-lg-12">
	        	<a class="btn btn-primary btn-search" href="javascript:void(0);">Tìm sản phẩm <i class="fa fa-search" aria-hidden="true"></i></a>
	        	<img class="loading" style="display:none;width:100%;height: auto;" src="{{ asset('dashboard/production/images/searching.gif') }}">
	        	</div>
	        </div>
	        <div class="form-group row">
	        	<div class="col-lg-12 result">
	        		<ul class="list-check-result"></ul>
	        	</div>
	        </div>
	        <div class="form-group row">
	        	<label class="control-label col-md-4 col-sm-6 col-xs-12">Giá sale:</label>
			     <div class="col-md-8 col-sm-6 col-xs-12">
	        		<input type="text" name="new_cross_price" required>
	        	</div>
	        </div>
	        <div class="form-group row">
	        	<label class="control-label col-md-4 col-sm-6 col-xs-12" required>Số lượng sale:</label>
			     <div class="col-md-8 col-sm-6 col-xs-12">
	        		<input type="text" name="new_cross_quality_sale">
	        	</div>
	        </div>
	        <div class="form-group row">
	          	  <label class="control-label col-md-4 col-sm-6 col-xs-12" required>Kiểu liên quan:</label>
		          <div class="col-md-8 col-sm-6 col-xs-12">
			          <select class="sel-cross" name="new_id_type_cross" required>
			          	<option value="0">-----</option>
			          	@foreach($sel_cross_type as $option)
			          	<option value="{{ $option['idcrosstype'] }}">{{ $option['namecross']}}</option>
			          	@endforeach
			          </select>
			      </div>	
	        </div>
	         <div class="form-group row">
	         	<div class="col-lg-12">
	        		<a class="btn btn-primary btn-create-new-relative" href="javascript:void(0)">Tạo liên quan mới</a>
	        	</div>
	         </div>
		</form>  	
    </div>
  </div>
</div>

<script>var _idproduct = '{{ $idproduct }}';</script>
@stop
@section('other_scripts')
	<script src="{{ asset('dashboard/vendors/moment/min/moment.min.js') }}"></script>
	<script src="{{ asset('dashboard/vendors/bootstrap-daterangepicker/daterangepicker.js') }}"></script>
    <!-- bootstrap-datetimepicker -->    
    <script src="{{ asset('dashboard/vendors/bootstrap-datetimepicker/build/js/bootstrap-datetimepicker.min.js') }}"></script>
	<script src="{{ asset('dashboard/production/js/process_images/capture_image.js?v=0.3.1') }}"></script>
  	<script src="{{ asset('dashboard/production/editor/editor.js?v=0.0.1') }}"></script>
  	<script src="{{ asset('dashboard/production/js/edit_post.js?v=0.1.0') }}"></script>
  	{{-- <script src="{{ asset('dashboard/production/js/edit_muti_select.js?v=0.1.9') }}"></script> --}}
  	<script src="{{ asset('dashboard/production/js/edit_update_category.js?v=0.0.3.6') }}"></script>	
  	{{-- <script src="{{ asset('dashboard/production/js/process_images/image_product.js.js?v=0.0.2') }}"></script> --}}
  	<script src="{{ asset('dashboard/production/js/uploadmultifile.js?v=0.8.8') }}"></script>
    <script src="{{ asset('dashboard/production/js/media-galerry.js?v=0.6.2') }}"></script>
     <!-- Custom Theme Scripts -->
    {{--  <script src="{{ asset('dashboard/production/js/cross_product.js?v=0.0.5') }}"></script> --}}
    {{-- <script src="{{ asset('dashboard/build/js/custom.min.js') }}"></script> --}}
    <script src="{{ asset('dashboard/build/js/custom.js') }}"></script>
    {{-- <script src="{{ asset('dashboard/production/js/custom.js?v=0.0.5') }}"></script> --}}
@stop