<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Setting extends PIS_Controller {

  public function index()
  {
    $data['codepage'] = "back_setting";
    $data['page_title'] 	= 'Produk';
    $this->template->back_views('site/back/setting',$data);
  }
  public function slider(){
    $data['codepage'] = "back_slider";
    $data['page_title'] 	= 'Produk';
    $this->template->back_views('site/back/settingSlider',$data);
  }
  public function addSlider(){
    $data['codepage'] = "back_addProduct";
    $data['page_title'] 	= 'Slider';
    $this->template->back_views('site/back/addSlider',$data);
  }
  public function storeSlider(){
    $data['codepage'] = "back_addProduct";
    $data['page_title'] 	= 'Slider';
    $this->template->back_views('site/back/addSlider',$data);
  }
  public function other(){
    $data['codepage'] = "back_setting";
    $data['page_title'] 	= 'Produk';
    $this->template->back_views('site/back/settingOther',$data);
  }
  public function setHome(){
    $data['codepage'] = "back_setting";
    $data['page_title'] 	= 'Produk';
    $this->template->back_views('site/back/settingHome',$data);
  }

}

/* End of file Setting.php */
