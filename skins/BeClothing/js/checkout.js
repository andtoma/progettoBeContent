$(document).ready(function() {
	//set initial state.
	//$('#textbox1').val($(this).is(':checked'));

	$('#def_address').change(function() {
		var address = "";
		if ($(this).is(":checked")) {

			$.ajax({
				url : "get_address.php",
				type : "post",
				success : function(responce) {
					if (responce == "NULL") {
						$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;You have not set a default address.  Go in your account and set one.");
						$("#mymodal").modal("show");
						$('#def_address').attr('checked', false);
					} else {
						address = JSON.parse(responce);
						$('[name="address"]').val(address['address']);
						$('[name="country"]').val(address['country']);
						$('[name="state"]').val(address['state']);
						$('[name="city"]').val(address['city']);
						$('[name="address"]').val(address['address']);
						$('[name="zip_code"]').val(address['zip_code']);
					}
				}
			});

		} else {
			//$('#checkout_form').trigger('reset');
			$(".toReset").val("");
			$('[name="country"]').val("US");

		}
	});

	$('#select_PM').change(function() {
		if ($(this).val() == "Credit Card") {
			$('.CreditC').prop('required', true);
		} else {
			$('.CreditC').prop('required', false);
		}
	});

	$("#checkout_form").submit(function(e) {
		var result;
		$.ajax({
			async : false,
			url : "get-item-cart.php",
			type : "post",
			success : function(responce) {
				result = responce;
			}
		});
		if (result == "not empty") {
			return true;
		} else {
			$(".title").html("Error");
			$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;Your cart is empty!");
			$("#mymodal").modal("show");
			$('#checkout_form').trigger('reset');
			e.preventDefault();
			return false;
		}
	});

	/*when user press checkout*/

	$('.beforeCheckOut').on('click', function() {
		var total = $('#total').text();
		
		/*
		 * if cart is empty!!
		 * */
		
		if (total == "$0") {
			$("#shoppingcart").modal("hide");
			$(".title").html("Warning!");
			$(".text-modal").css("color", "red");
			$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;Your cart is empty!");
			$("#mymodal").modal("show");
			return false;
		} else {
			var availability;
			//will be take with ajax
			var all_is_ok = 1;
			//say if all is gone good
			var string = "";
			//string error
			/*check if the quantity in the cart is available in the store*/
			/*for each item in the cart I check if the quantity request is available*/
			$(".partial").each(function() {
				var id = $(this).closest('tr').find('.id').val();
				var name = $(this).closest('tr').find('.name').text();
				var colour = $(this).closest('tr').find('.colour').text();
				var size = $(this).closest('tr').find('.size').text();
				var quantity = $(this).closest('tr').find('.quantity').text();
				
				$.ajax({
					async : false,
					url : "get_item_quantity.php",
					type : "post",
					data : {
						id : id,
						colour : colour,
						size : size,
						quantity : quantity,
					},
					success : function(responce) {
						if (responce != -1) {
							/*if the responce is not -1 that indicates that there is availability
							 * it means that responce contains the availability
							 *  */
							all_is_ok = 0;
							string = string + "<br/>" + "<fieldset class='modal-resume'>" + name.toUpperCase() + "<br/> COLOUR: " + colour + " <br/>SIZE: " + size + " <br/>AVAILABLE: " + responce + " </fieldset>";
						}
					}
				});

			});
		
			if (all_is_ok == 1) {
				return true;
			} else {
				/*with a modal I give an error  and I propose to automatically update his/her cart*/
				$("#shoppingcart").modal("hide");
				$(".title").html("Warning!");
				$(".text-modal").css("color", "red");
				$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;Some quantities are not longer available:<div class='subtext-modal'></div>");
				$(".subtext-modal").html(string);
				$(".text-modal").append("<a href='update_quantities.php'>Click here</a> to automatically update your <a href='cart.php'>Cart</a>.");
				$("#mymodal").modal("show");
				return false;
			}
		}
	});
});
