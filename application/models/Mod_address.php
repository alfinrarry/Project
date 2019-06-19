<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_address extends CI_Model {

    protected $address          = 'em_user_addresses';
    protected $address_admin    = 'em_useradmin_addresses';
    protected $user             = 'em_user_details';
    protected $user_admin       = 'em_useradmin_detail';
    
    public function getAddressByUser($id_user){
        $this->db->where('id_user',$id_user);
        return $this->db->get($this->address);
    }
    public function created($data_address){
        $this->db->insert($this->address, $data_address);
        return $this->db->insert_id();
    }

}

/* End of file Mod_address.php */
