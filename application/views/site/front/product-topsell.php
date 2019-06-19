  <!-- Page title -->
  <section class="pagetitle">
    <div class="container">
      <div class="pagetitle__img" style="background-image:url('<?php echo vendor_url('front/img/pagetitle.jpg'); ?>');">
        <h3 class="pagetitle__title">Suit</h3>
        <h6 class="pagetitle__breadcrumb"><a href="#">Home</a> / Suit</h6>
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
          <p class="mb-0 d-inline-block">8 ditampilkan dari 30</p>
        </div>
        <div class="col-md-6 text-right">
          <a href="#" data-toggle="modal" data-target="#modalFilter" class="mb-0 btn btn-sm btn-outline-primary">Filter</a>
        </div>
      </div>
      <div class="row">
        <!-- product list -->
        <div class="col-md-3 product-item">
          <div class="product-cta">
            <a href="#" class="product-cta__cart "><img src="<?php echo vendor_url('front/img/icon-cart.svg'); ?>" class="img-fluid" /></a>
            <a href="#" class="product-cta__wishempty"><img src="<?php echo vendor_url('front/img/icon-wishlist-empty.svg'); ?>" class="img-fluid" /></a>
            <!-- <a href="#" class="product-cta__wishfull"><img src="<?php echo vendor_url('front/img/icon-wishlist-full.svg'); ?>" class="img-fluid"></a> -->
          </div>
          <a href="product-detail.html"><img src="<?php echo vendor_url('front/img/product.jpg'); ?>" alt="Product" class="product-item__img img-fluid" /></a>
          <h5 class="product-item__title">
            <a href="product-detail.html">Jas Setelan Slimfit</a>
          </h5>
          <h5 class="product-item__price">Rp 850.000</h5>
        </div>
        <!-- end product list -->
        <!-- product list -->
        <div class="col-md-3 product-item">
          <div class="product-cta">
            <a href="#" class="product-cta__cart "><img src="<?php echo vendor_url('front/img/icon-cart.svg'); ?>" class="img-fluid" /></a>
            <a href="#" class="product-cta__wishempty"><img src="<?php echo vendor_url('front/img/icon-wishlist-empty.svg'); ?>" class="img-fluid" /></a>
            <!-- <a href="#" class="product-cta__wishfull"><img src="<?php echo vendor_url('front/img/icon-wishlist-full.svg'); ?>" class="img-fluid"></a> -->
          </div>
          <a href="product-detail.html"><img src="<?php echo vendor_url('front/img/product.jpg'); ?>" alt="Product" class="product-item__img img-fluid" /></a>
          <h5 class="product-item__title">
            <a href="product-detail.html">Jas Setelan Slimfit</a>
          </h5>
          <h5 class="product-item__price">Rp 850.000</h5>
        </div>
        <!-- end product list -->
        <!-- product list -->
        <div class="col-md-3 product-item">
          <div class="product-cta">
            <a href="#" class="product-cta__cart "><img src="<?php echo vendor_url('front/img/icon-cart.svg'); ?>" class="img-fluid" /></a>
            <a href="#" class="product-cta__wishempty"><img src="<?php echo vendor_url('front/img/icon-wishlist-empty.svg'); ?>" class="img-fluid" /></a>
            <!-- <a href="#" class="product-cta__wishfull"><img src="<?php echo vendor_url('front/img/icon-wishlist-full.svg'); ?>" class="img-fluid"></a> -->
          </div>
          <a href="product-detail.html"><img src="<?php echo vendor_url('front/img/product.jpg'); ?>" alt="Product" class="product-item__img img-fluid" /></a>
          <h5 class="product-item__title">
            <a href="product-detail.html">Jas Setelan Slimfit</a>
          </h5>
          <h5 class="product-item__price">Rp 850.000</h5>
        </div>
        <!-- end product list -->
        <!-- product list -->
        <div class="col-md-3 product-item">
          <div class="product-cta">
            <a href="#" class="product-cta__cart "><img src="<?php echo vendor_url('front/img/icon-cart.svg'); ?>" class="img-fluid" /></a>
            <a href="#" class="product-cta__wishempty"><img src="<?php echo vendor_url('front/img/icon-wishlist-empty.svg'); ?>" class="img-fluid" /></a>
            <!-- <a href="#" class="product-cta__wishfull"><img src="<?php echo vendor_url('front/img/icon-wishlist-full.svg'); ?>" class="img-fluid"></a> -->
          </div>
          <a href="product-detail.html"><img src="<?php echo vendor_url('front/img/product.jpg'); ?>" alt="Product" class="product-item__img img-fluid" /></a>
          <h5 class="product-item__title">
            <a href="product-detail.html">Jas Setelan Slimfit</a>
          </h5>
          <h5 class="product-item__price">Rp 850.000</h5>
        </div>
        <!-- end product list -->
        <!-- product list -->
        <div class="col-md-3 product-item">
          <div class="product-cta">
            <a href="#" class="product-cta__cart "><img src="<?php echo vendor_url('front/img/icon-cart.svg'); ?>" class="img-fluid" /></a>
            <a href="#" class="product-cta__wishempty"><img src="<?php echo vendor_url('front/img/icon-wishlist-empty.svg'); ?>" class="img-fluid" /></a>
            <!-- <a href="#" class="product-cta__wishfull"><img src="<?php echo vendor_url('front/img/icon-wishlist-full.svg'); ?>" class="img-fluid"></a> -->
          </div>
          <a href="product-detail.html"><img src="<?php echo vendor_url('front/img/product.jpg'); ?>" alt="Product" class="product-item__img img-fluid" /></a>
          <h5 class="product-item__title">
            <a href="product-detail.html">Jas Setelan Slimfit</a>
          </h5>
          <h5 class="product-item__price">Rp 850.000</h5>
        </div>
        <!-- end product list -->
        <!-- product list -->
        <div class="col-md-3 product-item">
          <div class="product-cta">
            <a href="#" class="product-cta__cart "><img src="<?php echo vendor_url('front/img/icon-cart.svg'); ?>" class="img-fluid" /></a>
            <a href="#" class="product-cta__wishempty"><img src="<?php echo vendor_url('front/img/icon-wishlist-empty.svg'); ?>" class="img-fluid" /></a>
            <!-- <a href="#" class="product-cta__wishfull"><img src="<?php echo vendor_url('front/img/icon-wishlist-full.svg'); ?>" class="img-fluid"></a> -->
          </div>
          <a href="product-detail.html"><img src="<?php echo vendor_url('front/img/product.jpg'); ?>" alt="Product" class="product-item__img img-fluid" /></a>
          <h5 class="product-item__title">
            <a href="product-detail.html">Jas Setelan Slimfit</a>
          </h5>
          <h5 class="product-item__price">Rp 850.000</h5>
        </div>
        <!-- end product list -->
        <!-- product list -->
        <div class="col-md-3 product-item">
          <div class="product-cta">
            <a href="#" class="product-cta__cart "><img src="<?php echo vendor_url('front/img/icon-cart.svg'); ?>" class="img-fluid" /></a>
            <a href="#" class="product-cta__wishempty"><img src="<?php echo vendor_url('front/img/icon-wishlist-empty.svg'); ?>" class="img-fluid" /></a>
            <!-- <a href="#" class="product-cta__wishfull"><img src="<?php echo vendor_url('front/img/icon-wishlist-full.svg'); ?>" class="img-fluid"></a> -->
          </div>
          <a href="product-detail.html"><img src="<?php echo vendor_url('front/img/product.jpg'); ?>" alt="Product" class="product-item__img img-fluid" /></a>
          <h5 class="product-item__title">
            <a href="product-detail.html">Jas Setelan Slimfit</a>
          </h5>
          <h5 class="product-item__price">Rp 850.000</h5>
        </div>
        <!-- end product list -->
        <!-- product list -->
        <div class="col-md-3 product-item">
          <div class="product-cta">
            <a href="#" class="product-cta__cart "><img src="<?php echo vendor_url('front/img/icon-cart.svg'); ?>" class="img-fluid" /></a>
            <a href="#" class="product-cta__wishempty"><img src="<?php echo vendor_url('front/img/icon-wishlist-empty.svg'); ?>" class="img-fluid" /></a>
            <!-- <a href="#" class="product-cta__wishfull"><img src="<?php echo vendor_url('front/img/icon-wishlist-full.svg'); ?>" class="img-fluid"></a> -->
          </div>
          <a href="product-detail.html"><img src="<?php echo vendor_url('front/img/product.jpg'); ?>" alt="Product" class="product-item__img img-fluid" /></a>
          <h5 class="product-item__title">
            <a href="product-detail.html">Jas Setelan Slimfit</a>
          </h5>
          <h5 class="product-item__price">Rp 850.000</h5>
        </div>
        <!-- end product list -->
      </div>

      <!-- pagination -->
      <ul class="pagination justify-content-center">
        <li class="page-item disabled">
          <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item active" aria-current="page">
          <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
        </li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item">
          <a class="page-link" href="#">Next</a>
        </li>
      </ul>
    </div>
  </section>
  <!-- End Content -->