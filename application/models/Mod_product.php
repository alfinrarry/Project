
<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Mod_product extends CI_Model {

  protected $product             = 'em_products';
  protected $product_img         = 'em_product_imgs';
  protected $product_measurement = 'em_product_measurements';
  protected $product_variant     = 'em_product_variations';
  protected $product_view        = 'em_product_views';
  protected $product_wishlist    = 'em_product_wishlists';
  protected $product_review      = 'em_product_reviews';
  protected $product_img_temp    = 'em_product_img_temps';
  protected $cart                = 'em_carts';

  public function getListProduct(){
    $this->db->select('*');
    $this->db->from($this->product);
    $this->db->where('status', 1);
    $this->db->where('deleted_at',null);
    $this->db->order_by('created_at', 'desc');        
    return $this->db->get();
  }
  public function getListDraftProduct(){
    $this->db->select('*');
    $this->db->from($this->product);
    $this->db->where('status', 0);
    $this->db->where('deleted_at',null);
    $this->db->order_by('updated_at', 'desc');        
    return $this->db->get();
  }
  public function getView($id){
    $this->db->where('id_product', $id);
    $this->db->from($this->product_view);
    return $this->db->count_all_results();
  }
  public function getStock($id){
    $this->db->select_sum('qty');
    $this->db->from($this->product_variant);
    $this->db->where('id_product',$id );
    return $this->db->get();
  }
  //softdelete Product
  public function editProduct ($id = 0,$data = 0)
  {
    $this->db->set($data);
    $this->db->where('id', $id);
    $this->db->update($this->product);
  }
  public function addProduct($data)
  {
    $this->db->insert($this->product, $data);
    return $this->db->insert_id();
  }
  // Search IMg by token
  public function whereImgsTemp($token){
    $this->db->where('token',$token['token']);
    $this->db->where('token_backup',$token['token_backup']);
    return  $this->db->get($this->product_img_temp);
  }
  // End Search img by token
  public function addImg($insert){
    $this->db->insert($this->product_img, $insert);
  }
  // Deleted Imgs temporary
  public function delTempImg($token)
  {
    $this->db->where('token', $token['token']);
    $this->db->where('token_backup', $token['token_backup']);      
    $this->db->delete($this->product_img_temp);   
  }
  // end Delete img temporary
  //get measurement
  public function getMeasurement()
  {
      return $this->db->get($this->product_measurement);
  }
  // end measurement
  // product Variation
  public function getVariation()
  {
      return $this->db->get($this->product_variant);
  }
  public function addVariation($variation){
    
    return $this->db->insert_batch($this->product_variant, $variation);
  }
  // End Product Variation
  // get Product By id
  public function getProductbyId($id)
  {
      $this->db->select('*');
      $this->db->where('id', $id);
      $this->db->from($this->product); 
      return $this->db->get();
  }
  // end Get Product By id
  // get Variant by id_product
  public function getVariantByProduct($id){
    $this->db->select('*');
    $this->db->where('id_product', $id);
    $this->db->from($this->product_variant); 
    return $this->db->get();
  }
  // end Get variant by id_product
  // get img by id_product
  public function getImgByProduct($id){
    $this->db->select('*');
    $this->db->where('id_product', $id);
    $this->db->from($this->product_img); 
    return $this->db->get();
  }
  // end get img by id_product
  public function countProdukByCategory($id_category){
    $this->db->where(array('deleted_at' => null, 'status' => 1));
    $this->db->where('id_category', $id_category);
    $this->db->from($this->product);
    return $this->db->count_all_results();
  }
  public function getProductByCategory($id_category,$number,$offset){
    if(isset($_SESSION['id'])){
        return $this->db->query
        ("select p.*,(select id from $this->product_wishlist w where w.id_product = p.id and w.id_user=".$_SESSION['id'].") as id_wishlist,
         (select id from $this->cart c where c.id_product = p.id and c.id_user=".$_SESSION['id'].") as id_cart
          from $this->product p where p.id_category=$id_category 
          order by created_at desc limit $number offset $offset"); 
    } else {
        $this->db->select('*');
        $this->db->where(array('deleted_at' => null, 'status' => 1, 'id_category' => $id_category));
        return $this->db->get($this->product,$number,$offset);
    }
  }
  public function getImageThumb($id){
    $this->db->where('id_product', $id);
    $this->db->from($this->product_img);
    $this->db->order_by('id', 'ASC');
    $this->db->limit(1);
    return $this->db->get();
  }
  public function getProductBySlug($slug){
    $this->db->where('slug_product', $slug);
    return $this->db->get($this->product);
  }
  public function getImgProduct($id){
    $this->db->where('id_product', $id);
    $this->db->from($this->product_img);
    $this->db->order_by('id', 'ASC');
    return $this->db->get();
  }
  public function getRecentProduct($id_category){
    if(isset($_SESSION['id'])){
      return $this->db->query
      ("select p.*,(select id from $this->product_wishlist w where w.id_product = p.id and w.id_user=".$_SESSION['id'].") as id_wishlist,
       (select id from $this->cart c where c.id_product = p.id and c.id_user=".$_SESSION['id'].") as id_cart
        from $this->product p where p.id_category=$id_category and p.deleted_at is null LIMIT 4"); 
    } else {
        $this->db->where(array('deleted_at' => null, 'status' => 1, 'id_category' => $id_category));
        $this->db->order_by('id', 'RANDOM');
        return $this->db->get($this->product,4);
    }
  }
  public function getImgsProduct($id){
    $this->db->where('id_product', $id);
    $this->db->from($this->product_img);
    $this->db->order_by('id', 'ASC');
    return $this->db->get();
  }
}

/* End of file Mod_product.php */
