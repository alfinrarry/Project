<section class="section" data-codepage="<?php echo $codepage ?>">
<?php if ($codepage == "profile_address"):?>
    <div class="container">
      <div class="row">
        <?php include('sidebar.php');?>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h3 class="h2"><?= $page_title?></h3>
            <div class="btn-toolbar mb-2 mb-md-0">
              <a href="<?= base_url('Address/newAddress')?>"><button class="btn btn-sm btn-outline-secondary">
              <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
              Add Address
              </button></a>
            </div>
          </div>
          
          <div class="table-responsive">
            <table id="listAddress" class="table table-striped" style="width:100%">
              <thead>
                <tr>
                  <th></th>
                  <th width="90%">Title</th>
                  <th>Aksi</th>
                </tr>
              </thead>
              <tbody>
              <?php 
              $no = 1;
              foreach ($address as $add):?>
                <tr>
                  <td>
                    <?= $no?> </td>
                  <td>
                    <small class="date">
                    <svg xmlns="http://www.w3.org/2000/svg" width="13" height="13" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-clock"><circle cx="12" cy="12" r="10"></circle><polyline points="12 6 12 12 16 14"></polyline></svg> 
                    <?php echo tgl_indo($add['created_at'])." ".substr($add['created_at'], 10, 6)?> WIB
                    </small><br>
                    <?= ucwords($add['title_address'])?>
                  </td>
                  <td>
                    <a href="<?php echo base_url('admin/Transaction/detail/'.$add['id'])?>"><button type="button" class="btn btn-info btn-circle btn-sm">
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
<?php elseif($codepage == "profile_newaAddress"):?>
    <div class="container">
      <div class="row">
        <?php include('sidebar.php');?>
        <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-4">
          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
            <h3 class="h2"><?= $page_title?></h3>
          </div>
          <!-- kosong -->
        </main>
      </div>
    </div>
<?php endif;?>
<section>