<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if (!function_exists('hash_password'))
{
  function hash_password($password) { 
    return password_hash($password, PASSWORD_BCRYPT); 
  } 
}
if ( ! function_exists('count_view_product')) {
	function count_view_product($id){
		$CI =& get_instance();
		$CI->load->model('Mod_product');
		$result = $CI->Mod_product->getView($id);
		return $result;
	}
}
if ( ! function_exists('count_variant_product')) {
	function count_variant_product($id){
		$CI =& get_instance();
		$CI->load->model('Mod_product');
    $result = $CI->Mod_product->getStock($id)->row_array();
    $query = $result['qty'];

		return $query;
	}
}
if ( ! function_exists('slug'))
{
	function slug($s) {

		$c = array (' ');
		$d = array ('-','/','\\',',','.','#',':',';','\'','"','[',']','{','}',')','(','|','`','~','!','@','%','$','^','&','*','=','?','+');
		$s = str_replace($d, '', $s); 
		$s = strtolower(str_replace($c, '-', $s));
		return $s;
	}
}
if ( ! function_exists('rupiah'))
{
	function rupiah($nilai, $pecahan = 0){
		return number_format($nilai, $pecahan, ',', '.');
	}
}
//helper tanggal 
if ( ! function_exists('tgl_indo'))
{
	function tgl_indo($tgl)
	{
		$tanggal = substr($tgl,8,2);
		$bulan = getBulan(substr($tgl,5,2));
		$tahun = substr($tgl,0,4);
		return $tanggal.' '.$bulan.' '.$tahun;   
	}
}
// bulan
if ( ! function_exists('bulan'))
{
	function getBulan($bln)
	{
		switch ($bln)
		{
			case 1: 
			return "Jan";
			break;
			case 2:
			return "Feb";
			break;
			case 3:
			return "Mar";
			break;
			case 4:
			return "Apr";
			break;
			case 5:
			return "Mei";
			break;
			case 6:
			return "Jun";
			break;
			case 7:
			return "Jul";
			break;
			case 8:
			return "Agu";
			break;
			case 9:
			return "Sep";
			break;
			case 10:
			return "Okt";
			break;
			case 11:
			return "Nov";
			break;
			case 12:
			return "Des";
			break;
		}
	}
}
if ( ! function_exists('getUser')) {
	function getUser($id){
		$CI =& get_instance();
		$CI->load->model('Mod_user');
		return $CI->Mod_user->getUser($id)->row_array();
	}
}
if(! function_exists('thumbImgProduct')){
	function thumbImgProduct($id){
		$CI =& get_instance();
		$CI->load->model('Mod_product');
		$result = $CI->Mod_product->getImageThumb($id)->row_array();		
		if (file_exists("assets/img/content/product/".$result['img_path']) and !empty($result['img_path'])) {
			$img = img_product($result['img_path']);
		}else{
			$CI->load->model('Mod_site');
			$result_site = $CI->Mod_site->getDefaultImage()->row_array();
			$img = img_product($result_site['img_product']);
		}
		return $img;
	}
}
if(! function_exists('imgProduct')){
	function imgProduct($libraries = null){
		if (file_exists("assets/img/content/product/"."$libraries") and !empty($libraries)) {
			$img = img_product($libraries);
		} else {
			$CI =& get_instance();
			$CI->load->model('Mod_site');
			$result_site = $CI->Mod_site->getDefaultImage()->row_array();
			$img = img_product($result_site['img_product']);
		}
		return $img;
	}
}
if(! function_exists('imgTicket')){
	function imgTicket($id){		
		$CI =& get_instance();
		$CI->load->model('Mod_ticket');
		$result = $CI->Mod_ticket->getFile($id)->result_array();	
		return $result;
	}
}

