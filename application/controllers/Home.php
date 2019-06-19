<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends PIS_Controller {

  public function index()
  {
    $data['codepage']		= "home";
    // print_r($_SESSION);die();
    // print_r( $this->curl->simple_get($this->api().'/product'));
    // die();
    $this->template->front_views('site/front/home', $data);
  }
}

/* End of file Home.php */