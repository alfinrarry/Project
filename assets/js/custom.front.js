var codepage = $(".section").attr('data-codepage');
console.log(codepage);
if (codepage == "category") {
  $('.wishlist').on('click', function() {
  var _url = $(this).attr('data-url');
  var id_wishlist=$(this).attr('data-id');
  var id_product=$(this).attr('data-product');
  var type_wishlist=$(this).attr('data-wishlist');
  var _this = $(this);
  console.log('tes');
    $.ajax({
      method: "POST",
      url: _url,
      data: {
        id_wishlist: id_wishlist,
        id_product:id_product,
        type:type_wishlist
      },
      success: function(data) {
        console.log(data);
        if (type_wishlist=="add") {
          var json=jQuery.parseJSON(data);
          console.log(json,'json');
          _this.addClass("active");
          _this.attr('data-id',json.id_wishlist);
          _this.attr('data-wishlist','remove');
        } else if (type_wishlist=="remove") {
          _this.removeClass("active");
          _this.removeAttr('data-id');
          _this.attr('data-wishlist','add');
        }
      }
    });
  });
  //end wishlist
} else if(codepage == "profile_order"){
  // List Transaction
  // List Transaction
	var trx = $('#listOrder').DataTable({
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
} else if(codepage == "profile_ticket"){
  // List Ticket
	var ticket = $('#listTicket').DataTable({
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
		ticket.responsive.recalc();
	});
} else if(codepage == "profile_address"){
  // List Transaction
	var txt = $('#listAddress').DataTable({
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
		txt.responsive.recalc();
	});
}else if(codepage == "profile_wishlist"){ 
  // console.log(codepage);
  $('.wishlist').on('click', function() {
    var _url = $(this).attr('data-url');
    var id_wishlist=$(this).attr('data-id');
    var id_product=$(this).attr('data-product');
    var type_wishlist=$(this).attr('data-wishlist');
    var _this = $(this);
    console.log(type_wishlist);
      $.ajax({
        method: "POST",
        url: _url,
        data: {
          id_wishlist: id_wishlist,
          id_product:id_product,
          type:type_wishlist
        },
        success: function(data) {
          console.log(data);
          if (type_wishlist=="add") {
            var json=jQuery.parseJSON(data);
            console.log(json,'json');
            _this.addClass("wishlist product-cta__wishfull");
            _this.attr('data-id',json.id_wishlist);
            _this.attr('data-wishlist','remove');
          } else if (type_wishlist=="remove") {        
            _this.attr('class','wishlist product-cta__wishempty');
            _this.removeAttr('data-id');
            _this.attr('data-wishlist','add');
          }
        }
      });
    });
    //end wishlist
}else if(codepage == "profile_ticket_add"){ 
  $('.type_ticket').change(function(){
    var type_ticket=$(".type_ticket option:selected").val();
    console.log(type_ticket);
    if (type_ticket==1) {
      $('.invoice').show(500);
      $('.payment').hide(500);
      $('.upload').hide(500);
		} else if(type_ticket==2) {
			$('.invoice').hide(500);
      $('.payment').hide(500);
      $('.upload').hide(500);
		}else if(type_ticket==3) {
			$('.invoice').show(500);
      $('.payment').hide(500);
      $('.upload').show(500);
		}else if(type_ticket==4) {
			$('.invoice').show(500);
      $('.payment').show(500);
      $('.upload').show(500);
    }else if(type_ticket == 0){
      $('.invoice').hide(500);
      $('.payment').hide(500);
      $('.upload').hide(500);
    }
  });
}