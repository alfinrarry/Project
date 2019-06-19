<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class User extends PIS_Controller {
  
  public function __construct()
  {
    parent::__construct();
    $this->load->model('Mod_user','user');
  }
  

  public function index()
  {
    $data['codepage'] = "back_login";
    $data['page_title'] 	= 'Login';
    if($this->user->logged_id()){ 
      base_url('citizen'); 
    } else { 
      $this->form_validation->set_rules('email', 'E-mail', 'required'); 
      $this->form_validation->set_rules('password', 'Password', 'required'); //jika session belum terdaftar 
      if ($this->form_validation->run() == false) {
        base_url('citizen'); 
      } else { 
        $data_user = array(
          'email'     => $_POST['email'],
          'password'  => $_POST['password']
        );
        $checking = $this->user->checkLoginAdmin($data_user); 
        if ($checking == true) { 
          foreach ($checking as $apps) {
              $session_data = array( 
               'id'         => $apps->id,
               'username'   => $apps->username,
               'email'      => $apps->email, 
               'fullname'   => $apps->fullname,
               'status'     => 'admin'
              ); 
              $this->session->set_userdata($session_data); 
              redirect(base_url('admin/dashboard'));
          } 
        } else { 
          redirect(base_url('citizen'));
        } 
      } 
    } 
    $this->template->back_views('site/back/login',$data);
  }
  public function logout(){
    $this->session->sess_destroy();    
    redirect(base_url('citizen'));
  }
  public function listUser(){
    $data['codepage'] = "back_user";
    $data['page_title'] 	= 'List User Admin';
    $this->template->back_views('site/back/listUser',$data);
  }
  public function addUser(){
    $data['codepage'] = "back_addProduct";
    $data['page_title'] 	= 'Add User Admin';
    $this->template->back_views('site/back/addUser',$data);
  }

}

/* End of file User.php */
