<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends PIS_Controller {

  public function index()
  {
    $data['codepage'] = "back_index";
    $this->template->back_views('site/back/dashboard',$data);
  }

}

/* End of file Dashboard.php */
