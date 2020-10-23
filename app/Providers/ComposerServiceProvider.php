<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use Illuminate\Support\Facades\Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
//use Auth; 
use Validator;
use Illuminate\Support\MessageBag;
use Illuminate\Support\Facades\DB;
use Illuminate\Routing\UrlGenerator;
// use App\Http\Controllers\ControllerName;
class ComposerServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap services.
     *
     * @return void
     */
    //private $main_menu = '';
    public function boot()
    {
        View::composer(array('teamilk.master'), function ($view) {
            $idmenu = 1;
            $qr_menu = DB::select('call ListItemCateByIdMenuProcedure(?)',array($idmenu));
            $rs_menu = json_decode(json_encode($qr_menu), true); 
            $view->with(compact('rs_menu'));
        });
    }

    /**
     * Register services.
     *
     * @return void
     */
    public function register(){
        //
    }
  
   
}
