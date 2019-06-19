<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_user extends CI_Model {

  protected $user 		       = 'em_users';
  protected $userDetail 	   = 'em_user_details';
  protected $useradmin       = 'em_useradmins';
  protected $useradminDetail = 'em_useradmin_details';

  public function logged_id(){ 
    return $this->session->userdata('id'); 
  } 
  //fungsi check login 
  public function check_login($data_user){ 
    $this->db->where("(username='".$data_user['email']."' OR email='".$data_user['email']."')"); 
    $query = $this->db->get($this->user); 
    if ($query->num_rows() == 1) { 
      $hash = $query->row('password'); 
      if (password_verify($data_user['password'],$hash)){ 
        return $query->result(); 
      } else { 
        $this->session->set_flashdata('fail_msg_password', 'Password Salah');
      } 
    } else { 
      $this->session->set_flashdata('fail_msg_account', 'Account Tidak tersedia');
    } 
  } 
  public function create_user($data_user) {
       $this->db->insert($this->user, $data_user); 
       return $this->db->insert_id();
  }
  public function create_user_detail($data_detail){
    return $this->db->insert('em_user_details', $data_detail); 
  } 
  public  function checkEmail($email){
    $this->db->where('email',$email);
    return  $this->db->get($this->user);
  }

  // admin
  public function checkLoginAdmin($data_user){ 
    $this->db->where("(username='".$data_user['email']."' OR email='".$data_user['email']."')"); 
    $query = $this->db->get($this->useradmin); 
    if ($query->num_rows() == 1) { 
      $hash = $query->row('password'); 
      if (password_verify($data_user['password'],$hash)){ 
        return $query->result(); 
      } else { 
        $this->session->set_flashdata('fail_msg_password', 'Password Salah');
      } 
    } else { 
      $this->session->set_flashdata('fail_msg_account', 'Account Tidak tersedia');
    } 
  }
  public function getUser($id){
    $this->db->select($this->user.'.*,'.$this->userDetail.'.*');
    $this->db->from($this->user);
    $this->db->join($this->userDetail, $this->userDetail.'.id_user = '.$this->user.'.id');
    $this->db->where($this->user.'.id',$id);
    return $this->db->get();
  }
}

/* End of file Mod_user.php */
