<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_system extends CI_Model {

  protected $site             = 'em_sites';
  protected $site_address     = 'em_site_addresses';
  protected $site_conf        = 'em_site_confs';
  protected $site_img_default = 'em_site_img_defaults';
  protected $site_bank        = 'em_site_banks';
  protected $site_payment     = 'em_site_payments';
  public function getData()
  {
    $this->db->select($this->site.'.*,'.$this->site_address.'.*');
    $this->db->from($this->site);
    $this->db->join($this->site_address, $this->site_address.'.id = '.$this->site.'.id');
    $this->db->order_by($this->site.'.id', 'desc');
    $this->db->limit(1); 
    return $this->db->get();
  }
  public function getConf(){
    $this->db->select('*');
    $this->db->from($this->site_conf);
    $this->db->order_by('id', 'desc');
    $this->db->limit(1); 
    return $this->db->get();
  }
  public function getDefaultImage(){
    return $this->db->get($this->site_img_default, 1);
  }
  public function getPayment(){
    $this->db->where('status', 1);
    $this->db->where('deleted_at', null);
    return $this->db->get($this->site_payment);   
  }

}

/* End of file Mod_system.php */
