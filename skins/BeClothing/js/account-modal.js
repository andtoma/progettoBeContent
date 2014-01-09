$(document).ready(function() {
	/*when the user update the cart the update will success just in case there is enough items desired in the store
	 *  for achieve this I've made ajax sync with async : false
	 * */
	$('.validate_quantity').on('click', function() {
		var result;
		
		$.ajax({
			async : false,
			url : "get_item_quantity.php",
			type : "post",
			data : {
				id : $(this).closest('tr').find($('[name="id"]')).val(),
				quantity : $(this).closest('tr').find($('[name="quantity"]')).val(),
				colour : $(this).closest('tr').find($('[name="colour"]')).val(),
				size : $(this).closest('tr').find($('[name="size"]')).val()
			},
			success : function(responce) {
				result = responce;
			}
		});
		if (result==-1) {
			return true;
		} else {
			$(".title").html("Warning");
			$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;The quantity you request is not available");
			$("#mymodal").modal("show");
			$('#cart_form').trigger('reset');
			return false;
		}
	});

	/*update of the user personal details via ajax*/
	$('#edit_userinfo_form').on('submit', function(e) {

		e.preventDefault();

		$.ajax({
			url : "update_user.php",
			type : "post",
			data : $('#edit_userinfo_form').serialize() + "&act=1",
			success : function(responce) {
				$(".title").html("Success");
				$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;Your profile has been successfully updated");
				$("#mymodal").modal("show");
			}
		});
	});

	/*update of the password via ajax*/
	$('#password_form').on('submit', function(e) {

		e.preventDefault();

		if ($('[name="psw1"]').val() != $('[name="psw2"]').val()) {
			$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;Passwords must match!");
			$("#mymodal").modal("show");
			$('#password_form').trigger('reset');
		} else {
			$.ajax({
				url : "update_user.php",
				type : "post",
				data : {
					id : $('[name="id"]').val(),
					psw : $('[name="psw1"]').val(),
					act : 2
				},
				success : function(responce) {
					$(".title").html("Success");
					$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;Password has been successfully changed");
					$("#mymodal").modal("show");
					$('#password_form').trigger('reset');
				}
			});
		}
	});

	/*update of the user address via ajax*/

	$('#edit_address_form').on('submit', function(e) {

		e.preventDefault();

		$.ajax({
			url : "update_user.php",
			type : "post",
			data : $('#edit_address_form').serialize() + "&act=3",
			success : function(responce) {
				$(".title").html("Success");
				$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;Your profile has been successfully updated");
				$("#mymodal").modal("show");
			}
		});
	});

	$('.tracking').on('click', function(e) {
		$("#shoppingcart").modal("hide");
		$(".title").html("Tracking info");
		$(".text-modal").css("color", "black");
		$(".text-modal").html("Order tracking number is: " + (new Date).getTime() + " <br/> Track your shipment by clicking <a href='http://www.ups.com/content/en/en/index.jsx'>here</a>.");
		$("#mymodal").modal("show");
		return false;

	});

});

