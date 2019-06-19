<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_comment extends CI_Model {

  protected $comment    = 'em_product_comments';  
  protected $user       = 'em_users';
  protected $userDetail = 'em_user_details';  

  public function getCommentByProduct($id_product){
    $this->db->select($this->comment.'.*,'.$this->user.'.is_ban,'.$this->user.'.username,'.$this->userDetail.'.*');
    $this->db->from($this->comment);
    $this->db->join($this->userDetail, $this->userDetail.'.id_user = '.$this->comment.'.id_user');
    $this->db->join($this->user, $this->user.'.id = '.$this->comment.'.id_user');
    $this->db->where($this->comment.'.id_product',$id_product);
    $this->db->where($this->comment.'.parent',0);
    $this->db->where($this->user.'.is_ban',null);
    return $this->db->get();
  }
  public function getReplyCommentByProduct($id_product){
    $this->db->select($this->comment.'.*,'.$this->user.'.is_ban,'.$this->user.'.username,'.$this->userDetail.'.*');
    $this->db->from($this->comment);
    $this->db->join($this->userDetail, $this->userDetail.'.id_user = '.$this->comment.'.id_user');
    $this->db->join($this->user, $this->user.'.id = '.$this->comment.'.id_user');
    // $this->db->where($this->comment.'.id_product',$id_product);
    $this->db->where($this->comment.'.parent !=',0);
    $this->db->where($this->user.'.is_ban',null);
    return $this->db->get();
  }
}

/* End of file Mod_comment.php */
