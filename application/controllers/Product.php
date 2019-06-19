<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Product extends PIS_Controller {
  public function __construct()
  {
    parent::__construct();
    $this->load->model('Mod_product','product');
    $this->load->model('Mod_category','category');
    $this->load->model('Mod_comment','comment');
    $this->load->model('Mod_review','review');
    $this->load->model('Mod_wishlist','wishlist');
  }

  public function detail()
  {
    $data['codepage'] = "product-detail";
    $slug 	                = $this->uri->segment(2);
    $data['product']        = $this->product->getProductBySlug($slug)->row_array();
    $data['ct']             = $this->category->getCategoryByid($data['product']['id_category'])->row_array();
    $data['variant']        = $this->product->getVariantByProduct($data['product']['id'])->result_array();
    $data['img_product']    = $this->product->getImgProduct($data['product']['id'])->result_array();
    $data['recent_product'] = $this->product->getRecentProduct($data['product']['id_category'])->result_array();
    $data['comment_product']= $this->comment->getCommentByProduct($data['product']['id'])->result_array();
    $data['comment_reply']  = $this->comment->getReplyCommentByProduct($data['product']['id'])->result_array();
    $data['img_product']    = $this->product->getImgsProduct($data['product']['id'])->result_array();
    $data['review_product'] = $this->review->getReviewByProduct($data['product']['id'])->result_array();
    $data['rating']         = $this->review->getAvgRatting($data['product']['id'])->row_array();
    $data['total_rating']   = $this->review->countRatingByProduct($data['product']['id']);
    $this->template->front_views('site/front/product-detail',$data);
  }

  public function topsell(){
    $data['codepage'] = "topsell";
    $this->template->front_views('site/front/product-topsell',$data);
  }
  public function wishlist(){
    if ($_POST['type']=="remove") {
      $id_wishlist=$_POST['id_wishlist'];
      $result=$this->wishlist->remove_wishlist($id_wishlist);
    } else if($_POST['type']=="add" ){
      $id_user=$_SESSION['id_user'];
      $id_product=$_POST['id_product'];
      $result=$this->wishlist->add_wishlist($id_user,$id_product);
    }
    echo json_encode($result);
  }
  
}

/* End of file Product.php */
