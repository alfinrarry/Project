<section class="section" data-codepage="<?php echo $codepage ?>">
<?php if ($codepage == "profile_order"):?>
    <div class="container">
      <div class="row">
        <?php include('sidebar.php');?>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h3 class="h2"><?= $page_title?></h3>
          </div>
          
          <div class="table-responsive">
            <table id="listOrder" class="table table-striped" style="width:100%">
              <thead>
                <tr>
                  <th></th>
                  <th width="75%">Invoice</th>
                  <th width="15%">Pembeli</th>
                  <th>Aksi</th>
                </tr>
              </thead>
              <tbody>
              <?php 
              $no = 1;
              foreach ($orders as $ods):?>
                <tr>
                  <td>
                    <?= $no?> </td>
                  <td>
                    <small class="date">
                    <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg> 
                    <?php echo tgl_indo($ods['created_at'])." ".substr($ods['created_at'], 10, 6)?> WIB
                    </small><br>
                    <?= $ods['invoice_code']?><br>
                    <?php if ($ods['status'] == -1):?>
										    <span class="label label-danger">Expired</span>
										<?php elseif($ods['status'] == -2):?>
                        <span class="label label-danger">Failed</span>
										<?php elseif($ods['status'] == 0):?>
                        <span class="label label-warning">Unpaid</span>
										<?php elseif($ods['status'] == 1):?>
                        <span class="label label-info">Paid</span>
										<?php elseif($ods['status'] == 2):?>
                        <span class="label label-primary">Deliver</span>
										<?php elseif($ods['status'] == 3):?>
                        <span class="label label-success">Success</span>
										<?php endif;?>
                  </td>
                  <td>
                    <?= ucwords($ods['name'])?> </td>
                  <td>
                    <a href="<?= base_url('User/'.getUser($_SESSION['id'])['username'].'/order/'.$ods['invoice_code'])?>"><button type="button" class="btn btn-info btn-circle btn-sm">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-arrow-right-circle"><circle cx="12" cy="12" r="10"></circle><polyline points="12 16 16 12 12 8"></polyline><line x1="8" y1="12" x2="16" y2="12"></line></svg>
                    </button></a>
                  </td>
                </tr>
              <?php  $no++; endforeach;?>
                </tfoot>
            </table>
					</div>
        </main>
      </div>
    </div>
<?php elseif ($codepage == "profile_order_detail"):?>
    <div class="container">
      <div class="row">
        <?php include('sidebar.php');?>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h3 class="h2"><?= $page_title?></h3>
          </div>
          
          
        </main>
      </div>
    </div>
<?php endif;?>
<section>