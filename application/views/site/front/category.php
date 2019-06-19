  <!-- Page title -->
  <section class="pagetitle">
    <div class="container">
      <div class="pagetitle__img" style="background-image:url('<?php echo vendor_url('front/img/pagetitle.jpg'); ?>');">
        <h3 class="pagetitle__title"><?php echo $ct['name_category']?></h3>
        <h6 class="pagetitle__breadcrumb"><a href="#">Home</a> / <?php echo $ct['name_category']?></h6>
      </div>
    </div>
  </section>
  <!-- End Page title -->

  <!-- Modal Filter -->
  <div class="modal fade" id="modalFilter" tabindex="-1" role="dialog" aria-labelledby="modalFilter" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
      <div class="modal-content">
        <div class="modal-body">
          <form action="" class="row align-items-center">
            <div class="form-group col-md-12 mb-4">
              <label for="sorting-filter">Urutkan berdasarkan</label>
              <select class="form-control-sm w-100" id="sorting">
                <option value="popular">Popular</option>
                <option value="lowprice">Harga terendah</option>
                <option value="highprice">Harga tertinggi</option>
              </select>
            </div>

            <div class="form-group col-md-12 mb-4">
              <label for="price-filter">Rentang Harga</label>
              <input type="text" id="price-filter" name="price" value="0;100" />
            </div>
            <div class="form-group col-md-12 mb-4">
              <label for="rating-filter">Rating</label>
              <div class="rating-filter" id="rating-filter"></div>
            </div>
            <div class="col-md-12">
              <button class="btn btn-outline-danger w-100 mb-2" class="close" data-dismiss="modal" aria-label="Close">
                Batal
              </button>
              <button class="btn btn-primary w-100">Filter</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- End Modal Filter -->

  <!-- Content -->
  <section>
    <div class="container">
      <div class="row pt-3 pb-5 align-items-center">
        <div class="col-md-6">
          <p class="mb-0 d-inline-block"><?php echo $rows?> ditampilkan dari <?php echo $start.' - '.$end?></p>
        </div>
        <div class="col-md-6 text-right">
          <a href="#" data-toggle="modal" data-target="#modalFilter" class="mb-0 btn btn-sm btn-outline-primary">Filter</a>
        </div>
      </div>
      <div class="row">
        <?php foreach($product as $p):?>
        <!-- product list -->
        <div class="col-md-3 product-item">
          <div class="product-cta">
          <?php
          if (isset($p['id_wishlist'])) {
            if ($p['id_wishlist']!=0) {
              $class_wishlist="product-cta__wishfull";
              $class_wishlist_img = "front/img/icon-wishlist-full.svg";
              $data_wishlist=' data-product='.$p['id'].' data-id='.$p['id_wishlist'].' data-wishlist=remove'." data-url=".base_url('wishlist/user_wishlist');
            } else {
              $class_wishlist="product-cta__wishempty";
              $class_wishlist_img = "front/img/icon-wishlist-empty.svg";
              $data_wishlist=' data-product='.$p['id'].' data-wishlist=add'.' data-url='.base_url('Product/user_wishlist');
            }	
          } else {
            $class_wishlist="product-cta__wishempty";
            $class_wishlist_img = "front/img/icon-wishlist-empty.svg";
            $data_wishlist=' data-product='.$p['id'].' data-wishlist=add'.' data-url='.base_url('Product/user_wishlist');
          }

          if (isset($p['id_cart'])) {
            if ($p['id_cart']!=0) {
              $class_cart="active";
              $data_cart=' data-product='.$p['id'].' data-id='.$p['id_cart'].' data-cart=remove'." data-url=".base_url('cart/remove_cart');
            } else {
              $class_cart="";
              $data_cart=' data-product='.$p['id'].' data-cart=add'.' data-url='.base_url('cart/add_cart');
            }	
          } else {
            $class_cart="";
            $data_cart=' data-product='.$p['id'].' data-cart=add'.' data-url='.base_url('cart/add_cart');
          }

          $now = strtotime('Y-m-d H:i:s');
          $expire =  strtotime('Y-m-d H:i:s',strtotime('+24 hour',strtotime($p['created_at'])));?>
          <?php if(count_variant_product($p['id'])>0 and @$_SESSION['status']!="admin"):?>
            <a href="#" class="product-cta__cart "><img src="<?php echo vendor_url('front/img/icon-cart.svg'); ?>" class="img-fluid" /></a>
          <?php endif; ?>
          <?php if(@$_SESSION['status']!="admin"): ?>
            <a href="#" class="<?= $class_wishlist?>"><img src="<?php echo vendor_url($class_wishlist_img); ?>" class="img-fluid" /></a>
          <?php endif; ?>
          </div>
          <a href="<?= base_url('Product/'.$p['slug_product'])?>"><img src="<?= thumbImgProduct($p['id']) ?>" alt="Product" class="product-item__img img-fluid" /></a>
          <h5 class="product-item__title">
            <a href="<?= base_url('Product/'.$p['slug_product'])?>"><?php echo $p['title_product']?></a>
          </h5>
          <h5 class="product-item__price">Rp <?php echo rupiah($p['price'])?></h5>
        </div>
        <!-- end product list -->
        <?php endforeach;?>
      </div>
      <?php  echo @$paging ?>
    </div>
  </section>
  <!-- End Content -->