var codepage = $(".container-fluid").attr('data-codepage');
if (codepage == "back_product") {
	// List Product
	var produk = $('#listProduct').DataTable({
		responsive: true,
		columnDefs: [{
			responsivePriority: 1,
			targets: 0
		},
		{
			responsivePriority: 3,
			targets: -3
		}
		]
	});
	$("a[data-toggle=\"tab\"]").on("shown.bs.tab", function (e) {
		produk.responsive.recalc();
	});
	
	// ban product
	$('#listProduct').on("click",'.ban-product',function () {
		var id = $(this).attr('data-id');
		var dir = $(this).attr('data-dir');
		var _url = dir + id;
		console.log("U", _url);

		swal({
			title: "Apakah Anda yakin untuk mem-ban produk ini?",
			text: "Produk yang telah di-ban tidak akan ditampilkan!",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Yes",
			cancelButtonText: "No",
			closeOnConfirm: false,
			closeOnCancel: false
		}, function (isConfirm) {
			if (isConfirm) {
				$.ajax({
					type: "POST",
					//data:{id:id},
					url: _url,
					//dataType: 'json',
					success: function (data) {
						swal({
							title: "Ban Produk Berhasil!",
							text: "Produk Berhasil Di-ban.",
							type: "success"
						},
							function () {
								location.reload();
							}
						);
					},
					error: function (data) {
						// console.log(data);
						swal("Error", "Server Error", "error");
					}
				})
			} else {
				swal("Cancelled", "", "error");
			}
		});
	});
	// end ban product
	// unban product
	$('#listProduct').on("click",'.unban-product',function () {
		var id = $(this).attr('data-id');
		var dir = $(this).attr('data-dir');
		var _url = dir + id;
		console.log("U", _url);

		swal({
			title: "Apakah Anda yakin untuk meng-unban produk ini?",
			text: "Produk yang telah di-unban akan ditampilkan kembali!",
			type: "info",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Yes",
			cancelButtonText: "No",
			closeOnConfirm: false,
			closeOnCancel: false
		}, function (isConfirm) {
			if (isConfirm) {
				$.ajax({
					type: "POST",
					//data:{id:id},
					url: _url,
					//dataType: 'json',
					success: function (data) {
						swal({
							title: "Unban Berhasil!",
							text: "Produk Berhasil Di-unban.",
							type: "success"
						},
							function () {
								location.reload();
							}
						);
					},
					error: function (data) {
						// console.log(data);
						swal("Error", "Server Error", "error");
					}
				})
			} else {
				swal("Cancelled", "", "error");
			}
		});
	});
	// end unban product

	// delete product
	$('#listProduct').on("click",'.del-product',function () {
		var id = $(this).attr('data-id');
		var dir = $(this).attr('data-dir');
		var _url = dir + id;
		swal({
			title: "Apakah Anda yakin untuk menghapus produk ini?",
			text: "Anda tidak akan dapat memulihkan produk ini!",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Yes",
			cancelButtonText: "No",
			closeOnConfirm: false,
			closeOnCancel: false
		}, function (isConfirm) {
			if (isConfirm) {
				$.ajax({
					type: "POST",
					//data:{id:id},
					url: _url,
					//dataType: 'json',
					success: function (data) {
						swal({
							title: "Hapus Berhasil!",
							text: "Data Berhasil Dihapus.",
							type: "success"
						},
							function () {
								location.reload();
							}
						);
					},
					error: function (data) {
						// console.log(data);
						swal("Error", "Server Error", "error");
					}
				})
			} else {
				swal("Cancelled", "", "error");
			}
		});
	});
	// end delete product
	
  // end List Produk
} else if(codepage == "back_transaction"){
  // List Transaction
	var trx = $('#listTransaction').DataTable({
		responsive: true,
		columnDefs: [{
			responsivePriority: 1,
			targets: 0
		},
		{
			responsivePriority: 3,
			targets: -3
		}
		]
	});
	$("a[data-toggle=\"tab\"]").on("shown.bs.tab", function (e) {
		trx.responsive.recalc();
	});
	
	$('#listTransaction').on("click",'.del-trans',function () {
		var id = $(this).attr('data-id');
		var dir = $(this).attr('data-dir');
		var _url = dir + id;
		console.log("U", _url);

		swal({
			title: "Apakah Anda yakin untuk menghapus transaksi ini?",
			text: "Transaksi yang telah dihapus tidak dapat dikembalikan!",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Yes",
			cancelButtonText: "No",
			closeOnConfirm: false,
			closeOnCancel: false
		}, function (isConfirm) {
			if (isConfirm) {
				$.ajax({
					type: "POST",
					//data:{id:id},
					url: _url,
					//dataType: 'json',
					success: function (data) {
						swal({
							title: "Hapus Transaksi Berhasil!",
							text: "Transaksi Berhasil Dihapus.",
							type: "success"
						},
							function () {
								location.reload();
							}
						);
					},
					error: function (data) {
						// console.log(data);
						swal("Error", "Server Error", "error");
					}
				})
			} else {
				swal("Cancelled", "", "error");
			}
		});
	});
	$('#listTransaction').on("click",'.approve-trans',function () {
		var id = $(this).attr('data-id');
		var dir = $(this).attr('data-dir');
		var _url = dir + id;
		console.log("U", _url);

		swal({
			title: "Apakah Anda yakin untuk menerima transaksi ini?",
			text: "Transaksi yang telah diterima!",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Yes",
			cancelButtonText: "No",
			closeOnConfirm: false,
			closeOnCancel: false
		}, function (isConfirm) {
			if (isConfirm) {
				$.ajax({
					type: "POST",
					//data:{id:id},
					url: _url,
					//dataType: 'json',
					success: function (data) {
						swal({
							title: "Transaksi Berhasil Diterima!",
							text: "Transaksi Berhasil Diterima.",
							type: "success"
						},
							function () {
								location.reload();
							}
						);
					},
					error: function (data) {
						// console.log(data);
						swal("Error", "Server Error", "error");
					}
				})
			} else {
				swal("Cancelled", "", "error");
			}
		});
	});
	$('#listTransaction').on("click",'.doapprove-trans',function () {
		var id = $(this).attr('data-id');
		var dir = $(this).attr('data-dir');
		var _url = dir + id;
		console.log("U", _url);

		swal({
			title: "Apakah Anda yakin untuk Membatalkan transaksi ini?",
			text: "Transaksi yang telah dibatalkan!",
			type: "warning",
			showCancelButton: true,
			confirmButtonColor: "#DD6B55",
			confirmButtonText: "Yes",
			cancelButtonText: "No",
			closeOnConfirm: false,
			closeOnCancel: false
		}, function (isConfirm) {
			if (isConfirm) {
				$.ajax({
					type: "POST",
					//data:{id:id},
					url: _url,
					//dataType: 'json',
					success: function (data) {
						swal({
							title: "Transaksi Berhasil dibatalkan!",
							text: "Transaksi Berhasil dibatalkan.",
							type: "success"
						},
							function () {
								location.reload();
							}
						);
					},
					error: function (data) {
						// console.log(data);
						swal("Error", "Server Error", "error");
					}
				})
			} else {
				swal("Cancelled", "", "error");
			}
		});
	});
  // end List Produk
} else if(codepage == "back_earning"){
  var earning = $('#listEarningMonth').DataTable({
		responsive: true,
		columnDefs: [{
			responsivePriority: 1,
			targets: 0
		},
		{
			responsivePriority: 3,
			targets: -3
		}
		]
	});
	$("a[data-toggle=\"tab\"]").on("shown.bs.tab", function (e) {
		earning.responsive.recalc();
	});
}else if(codepage == "back_slider"){
  // List Product
	var slider = $('#listSlider').DataTable({
		responsive: true,
		columnDefs: [{
			responsivePriority: 1,
			targets: 0
		},
		{
			responsivePriority: 2,
			targets: -2
		}
		]
	});
	$("a[data-toggle=\"tab\"]").on("shown.bs.tab", function (e) {
		slider.responsive.recalc();
	});
} else if(codepage == "back_addProduct"){
	var url_upload = $('#myDropzone').attr('data-url');
	$('#myDropzone').empty();
	Dropzone.autoDiscover = false;
	var product = new Dropzone(".dropzone", {
		url: url_upload,
		maxFilesize: 20,
		method: "post",
		acceptedFiles: "image/*",
		paramName: "userfile",
		parallelUploads:100,
		dictInvalidFileType: "Type file ini tidak dizinkan",
		addRemoveLinks: true,
		autoProcessQueue:true
	});

	//Event ketika Memulai mengupload
	product.on("sending", function (a, b, c) {
		c.append("token", $('#token').val());
		c.append("tokenB", $('#tokenB').val());
	});
	// bootstrap switch
	$(".bt-switch input[type='checkbox']").bootstrapSwitch();
	// End bootstrap switch
}else if(codepage == "back_editProduct"){
	var url_upload = $('#myDropzone').attr('data-url');
	$('#myDropzone').empty();
	Dropzone.autoDiscover = false;
	var product = new Dropzone(".dropzone", {
		url: url_upload,
		maxFilesize: 20,
		method: "post",
		acceptedFiles: "image/*",
		paramName: "userfile",
		parallelUploads:100,
		dictInvalidFileType: "Type file ini tidak dizinkan",
		addRemoveLinks: true,
		autoProcessQueue:true
	});

	//Event ketika Memulai mengupload
	product.on("sending", function (a, b, c) {
		c.append("token", $('#token').val());
		c.append("product", $('#product').val());
	});
	// bootstrap switch
	$(".bt-switch input[type='checkbox']").bootstrapSwitch();
	// End bootstrap switch
}else if(codepage == "back_transaction_detail"){
	$("#print").click(function() {
			var mode = 'iframe'; //popup
			var close = mode == "popup";
			var options = {
					mode: mode,
					popClose: close
			};
			$("div.printableArea").printArea(options);
	});
}