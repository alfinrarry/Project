<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_review extends CI_Model {

  protected $review     = 'em_product_reviews';
  protected $user       = 'em_users';
  protected $userDetail = 'em_user_details';

  public function getReviewByProduct($id_product){
    $this->db->select($this->review.'.*,'.$this->user.'.id,'.$this->user.'.is_ban,'.$this->user.'.username,'.$this->userDetail.'.*');
    $this->db->from($this->review);    
    $this->db->join($this->userDetail, $this->userDetail.'.id_user = '.$this->review.'.id_user');
    $this->db->join($this->user, $this->user.'.id = '.$this->review.'.id_user');
    $this->db->where($this->review.'.id_product',$id_product);
    $this->db->where($this->user.'.is_ban',null);
    return $this->db->get();
  }
  public function getAvgRatting($id_product){
    $this->db->where('id_product', $id_product);			
		$this->db->select_avg('rating');
		return $this->db->get($this->review);
  }
  public function countRatingByProduct($id_product){
    $this->db->where('id_product', $id_product);
    $this->db->from($this->review);
		return $this->db->count_all_results(); 
  }

}

/* End of file Mod_review.php */
