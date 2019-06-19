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
    $data['codepage'] = "login";
    if($this->user->logged_id()){ 
      base_url('auth'); 
    } else { 
      $this->form_validation->set_rules('email', 'E-mail', 'required'); 
      $this->form_validation->set_rules('password', 'Password', 'required'); //jika session belum terdaftar 
      if ($this->form_validation->run() == false) {
        base_url('auth'); 
      } else { 
        $data_user = array(
          'email'     => $_POST['email'],
          'password'  => $_POST['password']
        );
        $checking = $this->user->check_login($data_user); 
        if ($checking == true) { 
          foreach ($checking as $apps) {
              $session_data = array( 
               'id'         => $apps->id,
               'username'   => $apps->username,
               'email'      => $apps->email, 
               'fullname'   => $apps->fullname,
               'status'     => 'user'
              ); 
              $this->session->set_userdata($session_data); 
              redirect(base_url('Home'));
          } 
        } else { 
          redirect(base_url('auth'));
        } 
      } 
    } 
    $this->template->front_views('site/front/login',$data);
  }
  public function register(){    
    $data['codepage']		= "login";
    if(isset($_POST['submit'])){
      $this->form_validation->set_rules('fullname', 'Full Name', 'trim|required|min_length[3]');
      $this->form_validation->set_rules('email', 'E-mail', 'trim|required|is_unique[em_users.email]', array(
        'is_unique' => 'This username already exists. Please choose another one.'
      ));
      $this->form_validation->set_rules('password', 'Password', 'trim|required|min_length[8]');
      $this->form_validation->set_rules('conf_pass', 'Confirm Password', 'trim|required|min_length[8]|matches[password]' , array(
        'matches' => 'Password does not match.'
      ));
      if ($this->form_validation->run() == false) { 
        $this->template->front_views('site/front/login', $data); 
      } else {
        $data_user = array( 
          'email'      => $_POST['email'], 
          'username'   => $_POST['username'],
          'password'   => hash_password($_POST['password']),
          'id_role'    => 1,
          'created_at' => date('Y-m-j H:i:s'), 
        ); 
        $check_email = $this->user->checkEmail($_POST['email'])->num_rows();
        if ($check_email == 0) {  
          $user = $this->user->create_user($data_user);
          if (!$user){ 
            redirect('register');
          } else {
            $data_detail = array (
              'id_user' => $user, 
              'fullname'   => $_POST['fullname'], 
              'phone'   => $_POST['phone']
            );
            $this->user->create_user_detail($data_detail);
            $this->session->set_flashdata('success_msg_register', 'Daftar Berhasil Silahkan cek email untuk aktivasi');
            $this->template->front_views('site/front/login', $data); 
          } 
        }else {
          $this->session->set_flashdata('fail_msg_register', 'Email sudah terdaftar');
          $this->template->front_views('site/front/login', $data);
        }
      }
    }else{
      $this->session->set_flashdata('fail_msg_register', 'Gagal Mendaftar');
      $this->template->front_views('site/front/login', $data);
    } 
  }

  public function logout(){
    $this->session->sess_destroy();    
    redirect(base_url('auth'));
  }
  public function userProfile(){
    $data['codepage']		= "profile";
    if($this->user->logged_id()){ 
      $data['user']         = $this->user->getUser($_SESSION['id'])->row_array();
      $this->template->front_views('site/front/profile', $data);  
    }else{    
      redirect('Home');      
    }
  }
}

/* End of file User.php */
