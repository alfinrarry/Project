<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Cart extends PIS_Controller {

  public function index()
  {
    $data['codepage']		= "cart";    
    $this->template->front_views('site/front/cart', $data);
  }
  public function checkout(){
    $data['codepage']   = "checkout";
    $this->template->front_views('site/front/checkout',$data);
  }
  public function payment(){
    $data['codepage']   = "payment";
    $this->template->front_views('site/front/payment',$data);
  }
}

/* End of file Cart.php */
