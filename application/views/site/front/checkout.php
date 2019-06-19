<!-- Page title -->
<section class="pagetitle">
		<div class="container">
			<div class="pagetitle__img" style="background-image:url('<?php echo vendor_url('front/img/pagetitle.jpg'); ?>');">
				<h3 class="pagetitle__title">Checkout</h3>
				<h6 class="pagetitle__breadcrumb">
					<a href="#">Home</a> / <a href="#"> Cart</a> / Checkout
				</h6>
			</div>
		</div>
	</section>
	<!-- End Page title -->

	<!-- Content -->
	<section class="mt-5">
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<h5>Ringkasan Pembelian</h5>
					<form>
						<div class="row">
							<div class="form-group col-md-6">
								<label for="front-name">Nama depan*</label>
								<input type="text" class="form-control" id="front-name" required />
							</div>
							<div class="form-group col-md-6">
								<label for="back-name">Nama Belakang*</label>
								<input type="text" class="form-control" id="back-name" required />
							</div>
							<div class="form-group col-md-6">
								<label for="email">Email</label>
								<input type="text" class="form-control" id="email" />
							</div>
							<div class="form-group col-md-6">
								<label for="phone">Telepon*</label>
								<input type="text" class="form-control" id="phone" required />
							</div>
							<div class="form-group col-md-12">
								<label for="address">Alamat*</label>
								<textarea class="form-control" id="address" required></textarea>
							</div>
							<div class="form-group col-md-6">
								<label for="city">Kota</label>
								<input type="text" class="form-control" id="city" />
							</div>
							<div class="form-group col-md-6">
								<label for="kecamatan">Kecamatan</label>
								<input type="text" class="form-control" id="kecamatan" />
							</div>
							<div class="form-group col-md-6">
								<label for="province">Provinsi</label>
								<input type="text" class="form-control" id="province" />
							</div>
							<div class="form-group col-md-6">
								<label for="postal">Kode Pos</label>
								<input type="text" class="form-control" id="postal" />
							</div>
						</div>
						<hr />
						<div class="row">
							<div class="form-group col-md-12">
								<label for="bank">Pilih Bank</label>
								<select class="form-control" id="bank">
									<option>BNI</option>
									<option>BRI</option>
									<option>Mandiri</option>
								</select>
							</div>
							<div class="form-group col-md-12">
								<label>Pilih Kurir</label>
								<div class="courier-box">
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="courier" id="courier1" value="jne" checked required>
										<label class="form-check-label" for="courier1"><img src="<?php echo vendor_url('front/img/courier-jne.jpg'); ?>" alt="JNE" class="img-fluid courier-box__img"></label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="courier" id="courier2" value="pos" required>
										<label class="form-check-label" for="courier2"><img src="<?php echo vendor_url('front/img/courier-pos.jpg'); ?>" alt="POS Indonesia"
											 class="img-fluid courier-box__img"></label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="courier" id="courier3" value="tiki" required>
										<label class="form-check-label" for="courier3"><img src="<?php echo vendor_url('front/img/courier-tiki.jpg'); ?>" alt="Tiki" class="img-fluid courier-box__img"></label>
									</div>
								</div>
								<div class="form-group courier-type">
									<label>Pilih jenis pengiriman</label>
									<div class="custom-radio mb-3">
										<input type="radio" required data-price="5000" id="customRadio1" name="courier_service" class="custom-control-input courier_service"
										 value="CTC">
										<label class="custom-control-label ml-2 mb-0" for="customRadio1">JNE City Courier</label> <span class="float-right cart-item__price">Rp
											5000</span>
										<small class="form-text text-muted mt-0">(1-2 hari)</small></div>
									<div class="custom-radio"><input type="radio" required data-price="7000" id="customRadio2" name="courier_service"
										 class="custom-control-input courier_service" value="CTCYES"><label class="custom-control-label ml-2 mb-0"
										 for="customRadio2">JNE City Courier</label> <span class="float-right cart-item__price">Rp
											7000</span>
										<small class="form-text text-muted mt-0">(1-1 hari)</small></div>
								</div>
							</div>
						</div>
					</form>
				</div>
				<div class="col-lg-4">
					<div class="sticky-top card-sticky">
						<div class="card">
							<div class="card-header">
								<h5>Ringkasan Pembelian</h5>
							</div>
							<div class="card-body">
								<div class="row cart-item summary-item align-items-center">
									<div class="col-3">
										<img src="<?php echo vendor_url('front/img/product.jpg'); ?>" alt="" class="cart-item__img img-fluid" />
									</div>
									<div class="col-6">
										<h6 class="cart-item__title">Jas Setelan Slimfit</h6>
										<h6 class="cart-item__price">Rp 850.000</h6>
									</div>
									<div class="col-3 text-right">
										<h6 class="mb-0">X2</h6>
									</div>
								</div>
								<div class="row cart-item summary-item align-items-center">
									<div class="col-3">
										<img src="<?php echo vendor_url('front/img/product.jpg'); ?>" alt="" class="cart-item__img img-fluid" />
									</div>
									<div class="col-6">
										<h6 class="cart-item__title">Jas Setelan Slimfit</h6>
										<h6 class="cart-item__price">Rp 850.000</h6>
									</div>
									<div class="col-3 text-right">
										<h6 class="mb-0">X2</h6>
									</div>
								</div>
								<table class="table summary-table-price text-right">
									<tr>
										<td>Subtotal</td>
										<td>Rp</td>
										<td>2.500.000</td>
									</tr>
									<tr>
										<td>Shipping</td>
										<td>Rp</td>
										<td>18.000</td>
									</tr>
									<tr>
										<td>Total</td>
										<td>Rp</td>
										<td>2.518.000</td>
									</tr>
								</table>
							</div>
						</div>
						<div class="text-center mt-4">
							<a href="transfer.html" class="btn btn-primary">Bayar Sekarang</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Content -->
