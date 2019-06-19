<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Transaction extends PIS_Controller {
  
  public function __construct()
  {
    parent::__construct();
    $this->load->model('Mod_transaction','transaction');
    
  }
  

  public function index()
  {
   $data['codepage']  = "back_transaction";
   $data['page_title'] 	= 'Produk';
   $data['transaction'] = $this->transaction->listTransaction()->result_array();
  //  print_r($data['transaction']);die();
   $this->template->back_views('site/back/transactionList',$data); 
  }
  public function  detail($invoice_code){
    $data['codepage']     = "back_transaction_detail";
    $data['page_title'] 	= 'Produk';
    $data['transaction']  = $this->transaction->getDetail($invoice_code)->row_array();
    $data['product']      = $this->transaction->getProductByInvoice($data['transaction']['id'])->result_array();
    $this->template->back_views('site/back/transactionDetail',$data); 
  }
  public function updateReceipt(){
    if(isset($_POST['submit'])){
      $invoice = $this->transaction->getDetail($_POST['invoice'])->row_array();
      $data = array(
          'receipt' => $_POST['receipt'],
          'status'=> 2,
          'expired_receipt'=> date('Y-m-d H:i:s',strtotime('+168 hour',strtotime(date("Y-m-d H:i:s"))))
      );
      $this->transaction->updateReceipt($data,$_POST['invoice']);
      $data=array(
        'id_user'   => $invoice['id_user'],
        'desc'      => "Nomor Resi untuk invoice ".$invoice['invoice_code']." telah tersedia.(".$_POST['receipt'].")",
        'id_invoice'=> $invoice['id'],
        'created_at'=> date("Y-m-d h:i:s"),
        'status'    =>0,
      );
      $this->send_notification_member($data);
      redirect('admin/Transaction/detail/'.$_POST['invoice'],'refresh');
    } 
  }
  public function fail(){
    $data['codepage']    = "back_transaction";
    $data['page_title']  = 'Daftar Transaksi Gagal';
    $data['transaction'] = $this->transaction->listFailTransaction()->result_array();
    $this->template->back_views('site/back/transactionList',$data); 
  }
  public function  del_transaction($id){
    $this->transaction->delTrans($id);
  }
  public function approve($id){
    $this->transaction->approve($id);
  }
  public function doApprove($id){
    $this->transaction->doapprove($id);
  }
  public function earning()
  {
    $data['codepage'] = "back_earning";
    $data['page_title'] 	= 'Produk';
    $data['earning']        = $this->transaction->getEarningByMonth()->result_array();
    $data['totProduct']     = $this->transaction->getTotProduct()->result_array();
    $data['totSell']        = $this->transaction->getTotSell()->result_array();

    $bp = 0; $sp = 0;
    foreach($data['earning'] as $e)
    {
        $bp += $e['qty'] * $e['price'];
    }
    $data['totProfit']      = $bp;
    $data['allearning']        = $this->transaction->getAllEarning()->result_array();
    $abp = 0; $asp = 0;
    foreach($data['allearning'] as $ae)
    {
        $abp += $ae['qty'] * $ae['price'];
    }
    $data['totAllProfit']      = $abp;
    $this->template->back_views('site/back/earningList',$data);
  }

}

/* End of file Transaction.php */
