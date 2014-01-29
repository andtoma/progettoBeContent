$(document).ready(function() {
	
	$(".sidebar a").click(function(){
		$(".pagination").hide();
		
	});
	
	$("#quickshop-form").submit(function(e) {
		var islogged ;

		/*check if user is logged in*/
		var islogged;
		$.ajax({
			async : false,
			url : "isLoggedUser.php",
			success : function(responce) {
				islogged = responce;
			}
		});

		if (islogged == 0) {
			$("#quickshop").modal("hide");
			$(".title").html("Error!");
			$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;Please <a href='login.php'>Login</a> or <a href='register.php'>Sign In</a>.");
			$("#mymodal").modal("show");

			return false;
		}
	});
	

	$(".open-AddBookDialog").click(function() {

		/*I get the name with an ajax call*/
		var itemid = $(this).data('id');
		$("#id").val($(this).data('id'));

		$.ajax({
			url : "quickshop_ajax.php",
			type : "post",
			data : {
				id : itemid,
				type : "name"
			},
			success : function(responce) {
				$("#name").val(responce);
			}
		});

		/*I get the colours available for the item selected*/

		$.ajax({
			url : "quickshop_ajax.php",
			type : "post",
			data : {
				id : itemid,
				type : "colour"
			},
			success : function(responce) {
				/*
				 * no colours in the database--->product is out of stock--->I load a form with just the email input and change the title
				 * */
				if (responce == "NULL") {
					/*I set the action with id=1*/
					$(".quickshop-form").attr('action', 'add_cart.php?id=1');

					$(".successForm").hide();
					$(".errorForm").show();
					$(".title").html("We're sorry, At the moment the item is out of stock.<br/> Enter your email and we'll happily send you an e-mail when it will be back in stock.");
					/*
					 * With this 2 statements I'm setting the visible input as required and the hidden as not required
					 * */
					$('.errorForm').prop('required', true);
					$('.successForm').prop('required', false);

					/*
					 *there is at least a colour so I load the form hiding the email input, responce contains the color list and with ".html" I put the option list in the select
					 * */
				} else {

					/*I set the action with id=1*/
					$(".quickshop-form").attr('action', 'add_cart.php?id=2');

					$(".successForm").show();
					$(".errorForm").hide();
					$(".title").html("Add to Cart");
					$("#colour").html(responce);
					$("#size").html("<option value='' disabled selected>Choose a colour first</option>");
					$("#quantity").html("<option value='' disabled selected>Choose the size first</option>");
					/*
					 * With this 2 statements I'm setting the visible input as required and the hidden as not required
					 * */
					$('.successForm').prop('required', true);
					$('.errorForm').prop('required', false);

				}
			}
		});

	});

	/*
	 *After having selected a colour with an ajax call I take the size available for the item and color selected
	 * */
	$("#colour").change(function() {
		$("#quantity").html("<option value='' disabled selected>Choose the size first</option>");
		$.ajax({
			url : "quickshop_ajax.php",
			type : "post",
			data : {
				id : $("#id").val(),
				colour : $(this).val(),
				type : "size"
			},
			success : function(responce) {
				$("#size").html(responce);
			}
		});
	});
	/*
	 *After having selected a size with an ajax call I take an option list [1,MAX] where max is the max number of items available for the selected  item ,color and size
	 * */
	$("#size").change(function() {
		$.ajax({
			url : "quickshop_ajax.php",
			type : "post",
			data : {
				id : $("#id").val(),
				colour : $("#colour").val(),
				size : $(this).val(),
				type : "quantity"
			},
			success : function(responce) {
				$("#quantity").html(responce);
			}
		});
	});

});
