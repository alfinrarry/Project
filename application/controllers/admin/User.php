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
    $data['role']      = $this->user->getRole()->result_array();
    
    
   
    $this->template->back_views('site/back/listUser',$data);
  }
  public function formAddUser(){
    $data['codepage']     = "back_addProduct";
    $data['page_title'] 	= 'Add User Admin';
    $data['role']         = $this->user->getAllRole()->result_array();
    $this->template->back_views('site/back/addUser',$data);
  }
  public function addUser(){
    $data['codepage'] = "back_addProduct";
    $data['page_title'] 	= 'Add User Admin';
    if(isset($_POST['submit'])){
      if (isset($_POST['status']) == null ) {
        $status = 1;
      }else{
        $status = 0;

       
           }

      $firstname = $_POST ['firstname'];
      $lastname  = $_POST ['lastname'];
      $fullname  = $firstname." ".  $lastname;
      $data_user = array(
      
        'username'         => $_POST['username'] ,
        'fullname'         => $fullname ,
        'email'            => $_POST['email'],
        'password'         => $_POST['password'] ,
        'id_role'          => $_POST['id_role'] ,
        'created_at'       => date('Y-m-j H:i:s'),
      );
      $data = $this->user->addUser($data_user);
      
      
 //     $token 		    = array(
   //     'token'         => $_POST['token'],
   //     'token_backup'  => $_POST['tokenB']
  //    );
 /*     $data['imgtmp'] = $this->user->whereImgsTemp($token)->result_array();
			$x=0;
			foreach ($data['imgtmp'] as $key) {
				$data[$x]['img_path'] = $key['img_path'];
				$x++;
			}
			for($i=0; $i < $x; $i++){
				$gmb[$i]['img_path'] = $data[$i]['img_path'];
			}
			foreach ($gmb as $gmb) {
				$insert= array   (
          'img_path'       => $gmb['img_path'] ,
          'id'             => $data_user,
          'created_at'     => date('Y-m-j H:i:s'),
        );
				$this->product->addImg($insert);
  }
      $this->user->delTempImg($token);
      $this->session->set_flashdata('success_msg', 'Tambah User berhasil');
      redirect(base_url("Admin/addUser"));   
*/
}
redirect(base_url("Admin/User/listUser")); 

    

/* End of file User.php */
}

public function editUser($id) {
    $data['codepage']     = "back_addProduct";
    $data['page_title'] 	= 'Perbarui User';
    $data['user']         = $this->user->getUserById($id)->row_array();
    $data['role']         = $this->user->getAllRole()->result_array();
    // print_r($data);die();
    if(isset($_POST['submit'])){
    
      $data_user = array(
        'username'         => $_POST['username'] ,
        'fullname'         => $_POST['fullname'] ,
        'email'            => $_POST['email'],
        'password'         => $_POST['password'] ,
        'id_role'          => $_POST['id_role'] ,
        'created_at'       => date('Y-m-j H:i:s'),
      );
      $data = $this->user->editUser($_POST['id'],$data_user);   
      redirect(base_url("Admin/User/listUser"));  
      
    }
    $this->template->back_views('site/back/editUser',$data);   
  

}

public function del_user($id){
    $this->user->delUser($id);
    redirect(base_url("Admin/User/listUser")); 
}

/*public function imgUpload(){
  $dir = $_POST['token'];
  $config['upload_path']   = './assets/img/content/user/'.$dir.'/';
  $config['allowed_types'] = 'gif|jpg|png|ico';
  $this->load->library('upload',$config);      
  $path = '/img/content/user/'.$dir.'/';
  if (!is_dir('assets/img/content/user/'.$dir)) {
      mkdir('./assets/img/content/user/'.$dir, 0777, TRUE);
  }
  if($this->upload->do_upload('userfile')){
    $path.= $this->upload->data('file_name');
    $token		= $this->input->post('token');
    $tokenB   = $_POST['tokenB'];
    $date     = date("Y-m-d h:i:s");
    $this->db->insert('em_product_img_temps', array('img_path'=>$path, 'token'=> $token, 'token_backup'=> $tokenB, 'created_at'=>$date));
}*/

}
/*public function editImgUpload(){
  $dir = $_POST['token'];
  $config['upload_path']   = './assets/img/content/user/'.$dir.'/';
  $config['allowed_types'] = 'gif|jpg|png|ico';
  $this->load->library('upload',$config);      
  $path = '/img/content/user/'.$dir.'/';
  if (!is_dir('assets/img/content/user/'.$dir)) {
      mkdir('./assets/img/content/user/'.$dir, 0777, TRUE);
  }
  if($this->upload->do_upload('userfile')){
    $path.= $this->upload->data('file_name');
    $insert= array   (
      'img_path'       => $path ,
      'id'     => $_POST['id'],
      'created_at'     => date('Y-m-j H:i:s'),
    );
    $this->product->addImg($insert);
}*/









