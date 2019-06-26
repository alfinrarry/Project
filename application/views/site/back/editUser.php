<!-- Container fluid  -->
<!-- ============================================================== -->
<div class="container-fluid" data-codepage="<?php echo $codepage ?>">
	<!-- ============================================================== -->
	<!-- Start Page Content -->
	<!-- ============================================================== -->
	<!-- Column rendering -->
  
  <?php $isEdit = $page_title == "Perbarui Produk"? true: false; ?>
 
	<form id="edit_user" method="post" action="<?php echo base_url('admin/user/editUser/'.$user['id'])?>" data-dir="" data-url="">
  <input type="hidden" class="form-control" name="id" id="id" required <?php  echo "value='".$user['id']."'"?>>
    <div class="row">
      <div class="col-lg-8">
        <div class="card">
          <div class="card-body">
            <div class="row">
           
              <!-- Product Name -->
              <div class="col-sm-12 col-md-8">
                <div class="form-group">
                  <label for="username" class="control-label col-form-label">Username<span
                      class="text-danger">*</span></label>
                  <input type="text" class="form-control" name="username" id="username" required <?php  echo "value='".$user['username']."'"?>>
                </div>
              </div>
              <!-- End Product Name -->
              
            
            
                       
             
              <!-- Product Sell Price -->
              <div class="col-sm-12 col-md-8">
                <div class="form-group">
                  <label for="fullname" class="control-label col-form-label">Name<span
                      class="text-danger">*</span></label>
                  <input type="text" class="form-control" name="fullname" id="fullname" required <?php  echo "value='".$user['fullname']."'"?>>
                </div>
              </div>
             
              <!-- End Satuan -->
                         
              <!-- Product Sell Price -->
              
              <div class="col-sm-12 col-md-8">
                <div class="form-group">
                  <label for="email" class="control-label col-form-label">Email<span
                      class="text-danger">*</span></label>
                  <input type="text" class="form-control" name="email" id="email" required <?php  echo "value='".$user['email']."'"?>>
                </div>
              </div>
              
              <!-- End product weight -->
           

            
						           
              <!-- Product Sell Price -->
              <div class="col-sm-12 col-md-8">
                <div class="form-group">
                  <label for="jabatan" class="control-label col-form-label">Jabatan<span
                      class="text-danger">*</span></label>
					 
				  <select name="id_role" class="form-control"  name="jabatan" id="id_role" required <?php  echo "value='".$user['id_role']."'"?>>
				  <?php foreach($role as $r):?>
                  		<option value="<?php echo $r['id'] ?>"><?php echo $r['name'] ?></option>
						  <?php endforeach ?>
				  </select>
				 
                </div>
              </div>
              
							<!-- End Product Description -->
	  				
                     
              <!-- Product Sell Price -->
              <div class="col-sm-12 col-md-8">
                <div class="form-group">
                  <label for="password" class="control-label col-form-label">Password<span
                      class="text-danger">*</span></label>
                  <input type="password " class="form-control" name="password" id="password" required <?php if($isEdit) echo "value='".$user['password']."'"?>>
                </div>
              </div>
              </div>
              
            <div class="row">
              <div class="col-md-12">
                <button type="submit" name="submit" class="btn btn-primary w-100">Simpan</button>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div><!-- end row -->
  
  </form>

	<!-- ============================================================== -->
	<!-- End PAge Content -->
	<!-- ============================================================== -->

<!-- ============================================================== -->
<!-- End Container fluid  -->