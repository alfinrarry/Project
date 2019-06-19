<!-- Container fluid  -->
<!-- ============================================================== -->
<div class="container-fluid" data-codepage="<?php echo $codepage ?>">
	<!-- ============================================================== -->
	<!-- Start Page Content -->
	<!-- ============================================================== -->
	<!-- Column rendering -->
  <?php $isEdit = $page_title == "Perbarui Produk"? true: false; ?>
	<form id="add_product" method="post" action="<?php if($isEdit) echo base_url('admin/Product/editProduct'); else echo base_url('admin/Product/addProduct');?>" data-dir="" data-url="">
    <div class="row">
      <div class="col-lg-12 ">
        <div class="card">
          <div class="card-body">
            <div class="row">

              <div class="col-md-12">
                <div class="form-group">
                  <label for="productpicture" class="control-label col-form-label">Judul</label>
                  <input type="textarea" class="form-control" name="productlink" id="productlink" >
                </div>
              

            <div class="row">
              <div class="col-md-12">
                <div class="form-group">
                  <label for="productpicture" class="control-label col-form-label">Upload Gambar</label>
                  <div id="myDropzone" class="dropzone" data-url="	<?php if($isEdit) echo base_url('admin/Product/editImgUpload'); else echo base_url('admin/Product/imgUpload');?>"> </div>
                </div>
              </div>
            </div>
            </div>
                <button type="submit" name="submit" class="btn btn-primary w-100">Simpan</button>
             
          </div>
        </div>
        </div>
        </div>
        </div>
            <!-- end row -->
    </form>
  
</div>