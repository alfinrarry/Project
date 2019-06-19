<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Address extends PIS_Controller {

    
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Mod_address','address');
    }
    
    public function userAddress(){
        $data['codepage']		= "profile_address";
        $data['page_title'] 	= 'Address';
        if($this->session->userdata('id')){ 
            $data['address']    = $this->address->getAddressByUser($_SESSION['id'])->result_array();
            $this->template->front_views('site/front/userAddress', $data);  
        }else{    
            redirect('Home');      
        }
    }
    public function newAddress()
    {
        $data['codepage']       = "profile_newaAddress";
        $data['page_title']     = "Add Address";
        if($this->session->userdata('id')){ 
            if(isset($_POST['submit'])){
                $data_address = array(
                    'id_user'           => $_SESSION['id'],
                    'title_address'     => $_POST['title_address'],
                    'name'              => $_POST['name'],
                    'phone'             => $_POST['phone'],
                    'id_province'       => $_POST['id_province'],
                    'id_city'           => $_POST['id_city'],
                    'id_subdistrict'    => $_POST['id_subdistrict'],
                    'province'          => $_POST['province'],
                    'city'              => $_POST['city'],
                    'subdistrict'       => $_POST['subdistrict'],
                    'zip_code'          => $_POST['zip_code'],
                    'complete_address'  => $_POST['complete_address'],
                    'primary'           => 0,
                    'created_at'        => date("Y-m-d h:i:s")                    
                );
                $ticket = $this->address->created($data_address);
            }else{
                $this->template->front_views('site/front/userAddress', $data);  
            }  
        }else{    
            redirect('Home');      
        }
        
    }

}

/* End of file Address.php */
