<div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
	<?php $str_dashboard = session()->get('sidebar-admin'); ?>
    @if(isset($str_dashboard))
      <?php echo $str_dashboard; ?>
    @endif
</div>