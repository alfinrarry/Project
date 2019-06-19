<!-- Container fluid  -->
<!-- ============================================================== -->
<div class="container-fluid" data-codepage="<?php echo $codepage ?>">
	<!-- ============================================================== -->
	<!-- Start Page Content -->
	<!-- ============================================================== -->
	<!-- Column rendering -->
  <?php $isEdit = $page_title == "Perbarui Produk"? true: false; ?>
	<form id="edit_product" method="post" action="<?php echo base_url('admin/product/editProduct/'.$pr['id'])?>" data-dir="" data-url="">
 
    <div class="row">
      <div class="col-lg-8">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <!-- Product Name -->
              <div class="col-sm-12 col-md-8">
                <div class="form-group">
                  <label for="productname" class="control-label col-form-label">Nama produk<span
                      class="text-danger">*</span></label>
                  <input type="text" class="form-control" name="title_product" id="title_product" required <?php if($isEdit) echo "value='".$pr['title_product']."'"?>>
                </div>
              </div>
              <!-- End Product Name -->
              <!-- Category -->
              <div class="col-sm-12 col-md-4">
                <div class="form-group">
                  <label class="control-label col-form-label" for="productcategory">Kategori<span
                      class="text-danger">*</span></label>
                  <select class="custom-select form-control" id="category" name="category" required>
                    <?php foreach($category as $ca):?>
                   
                      <option value="<?php echo $ca['id'];?>" <?php if($isEdit && $ca['id'] == $pr['id']) echo " selected";?> ><?php echo $ca['name_category']?></option>
                 
                    <?php endforeach;?>
                  </select>
                </div>
              </div>
              <!-- End Category -->
            </div>
            <div class="row">            
              <!-- Product Sell Price -->
              <div class="col-sm-12 col-md-6">
                <div class="form-group">
                <input type="hidden" class="form-control" name="id" id="id" value="<?= $pr['id']?>" >
                  <label for="productsellprice" class="control-label col-form-label">Harga<span
                      class="text-danger">*</span></label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">Rp</span>
                    </div>
                  
                    <input type="number" class="form-control" name="price" id="price" value="<?= $pr['price']?>" required>
                   
                  </div>
                </div>
              </div>
              <!-- End Product Sell Price -->
              <!-- Satuan -->
              <div class="col-sm-4 col-md-2">
                <div class="form-group">
                  <label class="control-label col-form-label" for="productcategory">Satuan<span
                      class="text-danger">*</span></label>
                  <select name="measurement" class="custom-select form-control">
                    <?php foreach($measurement as $s){
										if($s['type']==""){ ?>
											<option value="<?php echo $s['id'] ?>" <?php if($codepage=="back_editProduct"){if($s['id']==$pr['id']){echo "selected";}} ?>><?php echo $s['title']; ?></option>
										<?php }
											} ?>
										<optgroup label="Berat">
											<?php foreach($measurement as $s){
												if($s['type']=="berat"){ ?>
														<option value="<?php echo $s['id'] ?>" <?php if($codepage=="back_editProduct"){if($s['id']==$pr['id']){echo "selected";}} ?>><?php echo $s['title']; ?></option>
												<?php }
													} ?>
										</optgroup>
										<optgroup label="Volume">
											<?php foreach($measurement as $s){
												if($s['type']=="Volume"){ ?>
														<option value="<?php echo $s['id'] ?>" <?php if($codepage=="back_editProduct"){if($s['id']==$pr['id']){echo "selected";}} ?>><?php echo $s['title']; ?></option>
												<?php }
													} ?>
										</optgroup>
										<optgroup label="Panjang">
											<?php foreach($measurement as $s){
												if($s['type']=="Panjang"){ ?>
														<option value="<?php echo $s['id'] ?>" <?php if($codepage=="back_editProduct"){if($s['id']==$pr['id']){echo "selected";}} ?>><?php echo $s['title']; ?></option>
												<?php }
													} ?>
										</optgroup>
                  </select>
                </div>
              </div>
              <!-- End Satuan -->
              <!-- Product Weight -->
              <div class="col-sm-6 col-md-4">
                <div class="form-group">
                  <label class="control-label col-form-label" for="productweight">Berat<span
                      class="text-danger">*</span></label>
                  <div class="input-group">
                    <input type="number" class="form-control" name="weight" value="<?= $pr['weight']?>">
                    <div class="input-group-prepend">
                      <span class="input-group-text">Gram</span>
                    </div>
                  </div>
                </div>
              </div>
              <!-- End product weight -->
            </div>

            <div class="row">
							<!-- Product Description -->
							<div class="col-sm-12">
								<div class="form-group">
									<label for="productdescription" class="control-label col-form-label">Deskripsi barang</label>
									<textarea name="description" id="description" class="summernote"  data-url="">
									<?php if($isEdit) echo $pr['description']?>
									</textarea>
								</div>
							</div>
							<!-- End Product Description -->
	  				</div>
            <div class="row">            
              <!-- Product lenght -->
              <div class="col-sm-6 col-md-4">
                <div class="form-group">
                  <label for="productsellprice" class="control-label col-form-label">Length<span
                      class="text-danger">*</span></label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">Length</span>
                    </div>
                    <input type="number" class="form-control" name="length" id="length" value="<?= $pr['length']?>">
                  </div>
                </div>
              </div>
              <!-- End Product lenght -->
              <!-- Product width -->
              <div class="col-sm-6 col-md-4">
                <div class="form-group">
                  <label for="productsellprice" class="control-label col-form-label">Width<span
                      class="text-danger">*</span></label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">Width</span>
                    </div>
                    <input type="number" class="form-control" name="width" value="<?= $pr['width']?>" id="width">
                  </div>
                </div>
              </div>
              <!-- End Product width -->
              <!-- Product height -->
              <div class="col-sm-6 col-md-4">
                <div class="form-group">
                  <label for="productsellprice" class="control-label col-form-label">Height<span
                      class="text-danger">*</span></label>
                  <div class="input-group">
                    <div class="input-group-prepend">
                      <span class="input-group-text">height</span>
                    </div>
                    <input type="number" class="form-control" name="height" id="height" value="<?= $pr['height']?>">
                  </div>
                </div>
              </div>
              <!-- End product height -->
              <div class="col-md-12">
                  <h4 class="card-title">Variasi Product</h4>
                  <div id="product_variation" class="m-t-20"></div>                  
                  <?php foreach ($vr as $vr):?>
                  <div class="row m-t-20">
                    <div class="col-sm-4">
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text">Variasi</span>
                        </div>
                        <input type="text" class="form-control" name="variation[]" value="<?= $vr['variation']?>" id="variation">
                      </div>
                    </div>
                    <div class="col-sm-3">
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text">Stok</span>
                        </div>
                        <input type="number" class="form-control" name="qty[]" value="<?= $vr['qty']?>" id="qty">
                      </div>
                    </div>
                    <div class="col-sm-3">
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text">Ukuran</span>
                        </div>
                        <input type="text" class="form-control" name="size[]" value="<?= $vr['size']?>" id="size">
                      </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <button class="btn btn-danger" type="button" onclick="remove_product_variation();"> <i class="fa fa-minus"></i> </button>
                            <!-- <button class="btn btn-success" type="button" onclick="product_variation();"><i class="fas fa-plus"></i></button> -->
                        </div>
                    </div>
                  </div>                  
                  <?php endforeach;?>
                  <div class="row m-t-20">
                    <div class="col-sm-4">
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text">Variasi</span>
                        </div>
                        <input type="text" class="form-control" name="variation[]" id="variation">
                      </div>
                    </div>
                    <div class="col-sm-3">
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text">Stok</span>
                        </div>
                        <input type="number" class="form-control" name="qty[]" id="qty">
                      </div>
                    </div>
                    <div class="col-sm-3">
                      <div class="input-group">
                        <div class="input-group-prepend">
                          <span class="input-group-text">Ukuran</span>
                        </div>
                        <input type="text" class="form-control" name="size[]" id="size">
                      </div>
                    </div>
                    <div class="col-sm-2">
                        <div class="form-group">
                            <button class="btn btn-success" type="button" onclick="product_variation();"><i class="fas fa-plus"></i></button>
                        </div>
                    </div>
                  </div>
              </div>
            </div>

            

          </div>
        </div>
      </div>

      <div class="col-lg-4">
        <div class="card">
          <div class="card-body">
            <div class="row">
              <div class="col-md-12">
                <div class="form-group bt-switch">
                  <label for="status" class="control-label col-form-label">Status Produk</label>
                  <input name="status" value="0" type="checkbox" data-on-color="warning" data-off-color="success"
                    data-on-text="Draft" data-off-text="Publish" class="form-control">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="productpicture" class="control-label col-form-label">Link Video produk</label>
                  <input type="textarea" class="form-control" name="productlink" id="productlink" >
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="productpicture" class="control-label col-form-label">Upload Gambar</label>
                  <div id="myDropzone" class="dropzone" data-url="	<?php if($isEdit) echo base_url('admin/Product/editImgUpload'); else echo base_url('admin/Product/imgUpload');?>"></div>
                </div>
              </div>
            </div>
            <!-- token -->
            <input name="token" id="token" value="<?php echo mt_rand()?>" hidden>
            <?php if ($isEdit):?>
               <input name="product" id="product" value="<?= $pr['id']?>" hidden>
            <?php else:?>
              <input name="tokenB" id="tokenB" value="<?php echo mt_rand()?>" hidden>
            <?php endif;?>
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
</div>
<!-- ============================================================== -->
<!-- End Container fluid  -->