<div class="container-fluid" data-codepage="<?php echo $codepage ?>">
<?php $isEdit = $page_title == "Perbarui Produk"? true: false; ?>
		<div class="row">
			<div class="col-12 card">
			<form id="add_user" method="post" action="<?php echo base_url('admin/user/addUser/')?>" data-dir="" data-url="">
			<div class="col-sm-12 col-md-8">
                <div class="form-group">
                  <label for="username" class="control-label col-form-label">Username<span
                      class="text-danger">*</span></label>
                  <input type="text" class="form-control" name="username" id="username" required <?php if($isEdit) echo "value='".$user['username']."'"?>>
                </div>
              </div>
			  <div class="col-sm-12 col-md-8">
                <div class="form-group">
                  <label for="firstname" class="control-label col-form-label">Firstname<span
                      class="text-danger">*</span></label>
                  <input type="text" class="form-control" name="firstname" id="firstname" required <?php if($isEdit) echo "value='".$user['firstname']."'"?>>
                </div>
              </div>
			  <div class="col-sm-12 col-md-8">
                <div class="form-group">
                  <label for="lastname" class="control-label col-form-label">Lastname<span
                      class="text-danger">*</span></label>
                  <input type="text" class="form-control" name="lastname" id="lastname" required <?php if($isEdit) echo "value='".$user['lastname']."'"?>>
                </div>
              </div>
			  <div class="col-sm-12 col-md-8">
                <div class="form-group">
                  <label for="email" class="control-label col-form-label">Email<span
                      class="text-danger">*</span></label>
                  <input type="text" class="form-control" name="email" id="email" required <?php if($isEdit) echo "value='".$user['email']."'"?>>
                
			     <label id="format-invalid" style="display:none;" class="errorreg " for="email">Email yang anda
							masukkan tidak valid</label>
				 <label id="alamat_email-invalid" style="display:none;" class="errorreg" for="alamat_email">Email yang anda
							masukkan sudah terdaftar</label>
				 <label id="alamat_email-valid" style="display:none;" class="success" for="alamat_email">Email yang anda
							masukkan valid</label>
				</div>
              </div>
			
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
			
			
			<div class="col-sm-12 col-md-8">
                <div class="form-group">
                  <label for="password" class="control-label col-form-label">Password<span
                      class="text-danger">*</span></label>
                  <input type="password" class="form-control" name="password" id="password" required <?php if($isEdit) echo "value='".$user['password']."'"?>>
                </div>
              </div>
                  
					<div class="form-group text-right">
						<button class="btn btn-danger btn-sm waves-effect waves-light" type="submit" name="submit"><span
								class="btn-label"><i class="fas fa-save"></i></span> Simpan</button>
					</div>
				</form>
			</div>
			
			
