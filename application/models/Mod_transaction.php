<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_transaction extends CI_Model {

  protected $transaction          = 'em_transactions';
  protected $transaction_detail   = 'em_transaction_details';
  protected $transaction_user     = 'em_transaction_users';
  protected $transaction_address  = 'em_transaction_addresses';
  protected $user                 = 'em_users';
  protected $product              = 'em_products';
  protected $product_variant      = 'em_product_variations';

  public function listTransaction(){
    $this->db->select($this->transaction.'.*,'.$this->user.'.id,'.$this->user.'.fullname');
    $this->db->from($this->transaction);
    $this->db->join($this->user, $this->user.'.id = '.$this->transaction.'.id_user');    
    $this->db->where($this->transaction.'.deleted_at ', null);
    $this->db->where($this->transaction.'.status !=',-2);
    $this->db->or_where($this->transaction.'.status !=',-1);
    return $this->db->get();
  }
  public function listFailTransaction(){
    $this->db->select($this->transaction.'.*,'.$this->user.'.*');
    $this->db->from($this->transaction);
    $this->db->join($this->user, $this->user.'.id = '.$this->transaction.'.id_user');
    $this->db->where($this->transaction.'.status',-2);
    $this->db->or_where($this->transaction.'.status',-1);
    return $this->db->get();
  }
  public function getDetail($invoice_code){
    $this->db->select($this->transaction.'.*,'.$this->transaction_address.'.*,'.$this->transaction_user.'.*,'.$this->user.'.*');
    $this->db->from($this->transaction);
    $this->db->join($this->user, $this->user.'.id = '.$this->transaction.'.id_user');
    $this->db->join($this->transaction_address, $this->transaction_address.'.id_transaction = '.$this->transaction.'.id');
    $this->db->join($this->transaction_user, $this->transaction_user.'.id_transaction = '.$this->transaction.'.id');
    $this->db->where($this->transaction.'.invoice_code',$invoice_code);
    return $this->db->get();
  }
  public function getProductByInvoice($id_transaction){
    $this->db->select($this->transaction_detail.'.*,'.$this->product.'.id,'.$this->product.'.title_product,'.$this->product_variant.'.id_product,'.$this->product_variant.'.variation,'.$this->product_variant.'.size,');
    $this->db->from($this->transaction_detail);
    $this->db->join($this->product, $this->product.'.id = '.$this->transaction_detail.'.id_product');
    $this->db->join($this->product_variant, $this->product_variant.'.id = '.$this->transaction_detail.'.id_variant');
    $this->db->where($this->transaction_detail.'.id_transaction',$id_transaction);
    return $this->db->get();
  }
  public function updateReceipt($data,$invoice_code){
    $this->db->set($data);
    $this->db->where('invoice_code', $invoice_code);
    $this->db->where('deleted_at', null);
    $this->db->update($this->transaction);
  }
  public function delTrans($id){
    $this->db->set('deleted_at',date("Y-m-d h:i:s"));
    $this->db->where('id', $id);
    $this->db->update($this->transaction);
  }
  public function approve($id){
    $this->db->set('status',1);
    $this->db->where('id', $id);
    $this->db->update($this->transaction);
  }
  public function doapprove($id){
    $this->db->set('status',-1);
    $this->db->where('id', $id);
    $this->db->update($this->transaction);
  }


  // pesugihan
  public function getEarningByMonth()
  {
      $this->db->select($this->transaction_detail.'.*, '.$this->product.'.id, '.$this->product.'.price, '.$this->product.'.title_product, '.$this->transaction.'.id,'.$this->transaction.'.created_at');
      $this->db->from($this->transaction_detail);
      $this->db->join($this->product, $this->product.'.id = '.$this->transaction_detail.'.id_product');      
      $this->db->join($this->transaction, $this->transaction.'.id = '.$this->transaction_detail.'.id_transaction');
      $this->db->where($this->transaction.'.status', 3);
      $this->db->where('MONTH('.$this->transaction.'.created_at)', date('n')); 
      $this->db->where('YEAR('.$this->transaction.'.created_at)', date('Y'));   
      return $this->db->get();
  }   
  // end pesugihan
  // total produk terjual
  public function getTotProduct()
  {
      $this->db->select_sum($this->transaction_detail.'.qty');
      $this->db->from($this->transaction_detail);
      $this->db->join($this->transaction, $this->transaction.'.id = '.$this->transaction_detail.'.id_transaction');
      $this->db->where($this->transaction.'.status', 3);
      $this->db->where('MONTH('.$this->transaction.'.created_at)', date('n')); 
      $this->db->where('YEAR('.$this->transaction.'.created_at)', date('Y'));   
      return $this->db->get();
  }        
  // total produk terjual
  // total produk terjual
  public function getTotSell()
  {
      $this->db->select_sum($this->transaction_detail.'.total_price');
      $this->db->from($this->transaction_detail);
      $this->db->join($this->transaction, $this->transaction.'.id = '.$this->transaction_detail.'.id_transaction');
      $this->db->where($this->transaction.'.status', 3);
      $this->db->where('MONTH('.$this->transaction.'.created_at)', date('n')); 
      $this->db->where('YEAR('.$this->transaction.'.created_at)', date('Y'));   
      return $this->db->get();
  }        
  // total produk terjual
  public function getAllEarning()
  {
      $this->db->select($this->transaction_detail.'.*, '.$this->product.'.id, '.$this->product.'.price, '.$this->product.'.title_product, '.$this->transaction.'.id, '.$this->transaction.'.created_at');
      $this->db->from($this->transaction_detail);
      $this->db->join($this->product, $this->product.'.id = '.$this->transaction_detail.'.id_product');
      $this->db->join($this->transaction, $this->transaction.'.id = '.$this->transaction_detail.'.id_transaction');
      $this->db->where($this->transaction.'.status', 3);
      return $this->db->get();
  }
  public function getOrderUsers($id_user){
    $this->db->select($this->transaction.'.*,'.$this->transaction_user.'.id,'.$this->transaction_user.'.name');
    $this->db->from($this->transaction);
    $this->db->join($this->transaction_user, $this->transaction_user.'.id_transaction = '.$this->transaction.'.id');    
    $this->db->where($this->transaction.'.deleted_at ', null);
    $this->db->where($this->transaction.'.id_user',$id_user);
    return $this->db->get();
  } 
}

/* End of file Mod_transaction.php */
