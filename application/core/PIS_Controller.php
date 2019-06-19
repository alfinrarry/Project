<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class PIS_Controller extends CI_Controller {

  public function __construct()
    {
        parent::__construct();        
        $this->load->model('Mod_notification','notification');
        $this->load->model('Mod_system','system');        
        $this->load->model('Mod_category','category');
        //load category
        $data['system']   = $this->system->getData()->row_array();
        $data['category'] = $this->category->getCategoryAll()->result_array();
        
        $this->load->vars($data);
    }
    public function api(){
      $data  = "https://api.wildanmukafi.com/v1";
      return $data;
    }
    public function send_notification_member($data){
      $insert=$this->notification->addNotif($data);
    }
    public function site_page_conf(){
      $data   = $this->system->getCOnf()->row_array();
      return $data;
    }
    public function getPayments(){
      $data = $this->system->getPayment()->result_array();
      return $data;
    }
     

}

/* End of file Pis_controller.php */
