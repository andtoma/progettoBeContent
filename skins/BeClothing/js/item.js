$(document).ready(function() {

	/*on page load if the item is out of stock I remove the buy form(leaving just the colour select)*/
	if ($(".item_availability").text() == "Out of Stock") {
		$("#item_size").hide();
		$("#quantity_buy").hide();
		$(".sizetext").hide();
	} else {
		$(".sizetext").show();
		$("#item_size").show();
		$("#quantity_buy").show();
	}

	/********************************
	 *
	 * ON CLICK ON LEFT THUMB IMAGE
	 *
	 *
	 ********************************/

	$(".item_image_button").click(function(e) {
		/*images source*/
		var src_center_image = $(".center_image").attr("src");
		var src_clicked_image = $(this).find("img").attr("src");

		/*selected image id*/
		var id_selected_image = $(this).val();

		/* center image id*/
		var id_center_image = $(".image_id").val();

		/*selected item  colour*/
		var selected_image_colour = "";
		//$(this).closest('div').find('.selected_image_colour').css('backgroundColor');

		$.ajax({
			async : false,
			url : "get_item_colour.php",
			type : "post",
			data : {
				id : $(this).val(),
				flag : 1
			},
			success : function(responce) {
				selected_image_colour = responce;
			}
		});

		/*center image colour*/
		var center_image_colour = "";

		/*with ajax I get it using center item id*/
		$.ajax({
			async : false,
			url : "get_item_colour.php",
			type : "post",
			data : {
				id : id_center_image,
				flag : 1
			},
			success : function(responce) {
				center_image_colour = responce;
			}
		});

		/*SWAP*/

		/*swap items images*/

		$(this).find("img").attr("src", src_center_image);

		$(".center_image").attr("src", src_clicked_image);

		/*swap items_images id*/
		$(this).val(id_center_image);

		$(".image_id").val(id_selected_image);

		/*update item thumb*/
		$(this).closest('div').find('.selected_image_colour').css('backgroundColor', center_image_colour);

		/*change colour select*/
		$.ajax({
			async : false,
			url : "get_selected_colour.php",
			type : "post",
			data : {
				image_sel : id_selected_image,
				item_id : $(".itemid").val(),
				flag : 1
			},
			success : function(responce) {
				$("#item_colour").html(responce);

			}
		});

		/*update available size*/
		$.ajax({
			async : false,
			url : "get_item_size.php",
			type : "post",
			data : {
				image_sel : id_selected_image,
				item_id : $(".itemid").val(),
				flag : 1
			},
			success : function(responce) {
				$("#item_size").html(responce);
			}
		});
		/*availability message*/
		/*I consider the size options*/
		if ($('#item_size option').length == 0) {
			var availability = "<p class='notAvailable'>Out of Stock</p>";
			$(".sizetext").hide();
			$("#item_size").hide();
			$("#quantity_buy").hide();

		} else {
			var availability = "<p class='available'>In Stock</p>";
			$(".sizetext").show();
			$("#item_size").show();
			$("#quantity_buy").show();

		}
		$(".item_availability").html(availability);
	});
	/************************************
	 *
	 * WHEN USER SELECT A COLOUR
	 *
	 *
	 ************************************/

	/*on change colour from select I update sizes*/
	$("#item_colour").change(function() {

		$.ajax({
			async : false,
			url : "get_item_size.php",
			type : "post",
			data : {
				col_sel : $(this).val(),
				item_id : $(".itemid").val(),
				flag : 2
			},
			success : function(responce) {
				$("#item_size").html(responce);
			}
		});
		/*availability message*/

		if ($('#item_size option').length == 0) {
			var availability = "<p class='notAvailable'>Out of Stock</p>";
			$(".sizetext").hide();
			$("#item_size").hide();
			$("#quantity_buy").hide();

		} else {
			var availability = "<p class='available'>In Stock</p>";
			$(".sizetext").show();
			$("#item_size").show();
			$("#quantity_buy").show();

		}

		$(".item_availability").html(availability);

		/*center image source*/
		var src_center_image = $(".center_image").attr("src");
		/* center image id*/
		var id_center_image = $(".image_id").val();
		/*selected item  colour*/
		var selected_image_colour = $("#item_colour").val();

		/*src selected image*/
		var src_clicked_image = "";
		//<----to get with ajax

		/*selected image id*/
		var id_selected_image = "";
		//<----to get with ajax

		$.ajax({
			async : false,
			url : "get_image_id_src.php",
			type : "post",
			data : {
				id : $(".itemid").val(),
				colour : selected_image_colour,
				flag : 1
			},
			success : function(responce) {
				var test = JSON.parse(responce);
				src_clicked_image = test['path'];
				id_selected_image = test['id'];
			}
		});
		/*center image colour*/
		var center_image_colour = "";

		/*with ajax I get it using center item id*/
		$.ajax({
			async : false,
			url : "get_item_colour.php",
			type : "post",
			data : {
				id : $(".image_id").val(),
				flag : 1
			},
			success : function(responce) {
				center_image_colour = responce;
			}
		});

		/*swap items images*/
		$(".item_image_button").each(function() {
			/*update left images*/
			if ($(this).find("img").attr("src") == src_clicked_image) {
				$(this).find("img").attr("src", src_center_image);
				$(this).closest('div').find('.selected_image_colour').css('backgroundColor', center_image_colour);
				$(this).val(id_center_image);
			}
		});

		$(this).closest('div').find('.selected_image_colour').css('backgroundColor');
		$(".center_image").attr("src", src_clicked_image);
		/*swap items_images id*/

		$(".image_id").val(id_selected_image);

	});
	/************************************
	 *
	 * WHEN USER PRESS Add to WishList
	 *
	 *
	 ************************************/

	$(".add_wishlist").click(function(e) {
		e.preventDefault();
		$.ajax({
			url : "add-wishlist.php",
			type : "post",
			data : {
				item : $(".itemid").val(),
				flag : 1
			},
			success : function(responce) {
				if (responce == 1) {
					$(".title").html("Success");
					$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;This item has been successfully added into your <a href='account.php?id=3'>Wishlist</a>.");
					$("#mymodal").modal("show");
				} else {
					$(".title").html("Error");
					$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;This item is already in your <a href='account.php?id=3'>wishlist</a>.");
					$("#mymodal").modal("show");
				}
			}
		});
	});

	/************************************
	 *
	 * WHEN USER PRESS BUY!
	 *
	 *
	 ************************************/

	$("#item_form").submit(function(e) {
		e.preventDefault();
		$.ajax({
			async : false,
			url : "get_item_quantity.php",
			type : "post",
			data : {
				id : $(".itemid").val(),
				colour : $("#item_colour").val(),
				size : $("#item_size").val(),
				quantity : $("#item_quantity").val(),
			},
			success : function(responce) {
				if (responce != -1) {
					$(".title").html("Error");
					$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;Quantity selected exceeds our availability.<br/> There are " + responce + " pieces in the magazine.");
					$("#item_quantity").val(responce);
					$("#mymodal").modal("show");

				} else {
					$.ajax({
						url : "add_cart-ajax.php",
						type : "post",
						data : {
							id : $(".itemid").val(),
							colour : $("#item_colour").val(),
							size : $("#item_size").val(),
							quantity : $("#item_quantity").val(),
						},
						success : function(responce) {
							$(".title").html("Success");
							$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;This item has been successfully added into your <a href='account.php?id=2'>Cart</a>.");
							$("#mymodal").modal("show");
							$("#item_quantity").val(1);

						}
					});
				}
			}
		});

		return false;

	});

	/*on click on size guide*/
	$("#size_guide").click(function(e) {
		e.stopPropagation();
		$(".title").html("Size Charts");
		$(".text-modal").html("<img class='sizeGuideModal' src='skins/BeClothing/img/sizeChart.jpg'width='550' >");
		$("#mymodal").modal("show");
		return false;

	});

	/*TWITTER*/
	! function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0], p = /^http:/.test(d.location) ? 'http' : 'https';
		if (!d.getElementById(id)) {
			js = d.createElement(s);
			js.id = id;
			js.src = p + '://platform.twitter.com/widgets.js';
			fjs.parentNode.insertBefore(js, fjs);
		}
	}(document, 'script', 'twitter-wjs');

	/*FACEBOOK*/
	( function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id))
				return;
			js = d.createElement(s);
			js.id = id;
			js.src = "//connect.facebook.net/en_EN/all.js#xfbml=1";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));

	/*********************************************
	 *
	 * WHEN USER  ADD/EDIT/DELETE A REVIEW
	 *
	 *
	 *********************************************/
	/*page url*/
	//	window.location.hash = 'something';

	//window.location.hash = 'something';
	//alert(window.location.hash);

	var url = window.location.href;
	/*if the url is single-item.php?id=..*/
	if (url.search('single-item.php') > 0) {
		var frag = window.location.href.split("#");
		/*if EXISTS and it's non empty*/
		if (!(frag.length == 1) && frag[1].length) {
			var hash = url.substring(url.indexOf('#') + 1);
			switch(hash) {
				case "addrev":
					$(".title").html("Thanks for you review!");
					$(".text-modal").html("Your review has been successfully added.");
					break;
				case "delrev":
					$(".title").html("Success");
					$(".text-modal").html("Selected review has been successfully removed.");
					break;
				case "editrev":
					$(".title").html("Success");
					$(".text-modal").html("Selected review has been successfully updated.");
					break;
			}
			$("#mymodal").modal("show");
			window.location.hash = "";
			/*click on reviews(default is description)*/
			$("#review_tab").click();
			/*page scroll*/
			var divPosition = $('#myTabContent').offset();
			$('html, body').animate({
				scrollTop : divPosition.top
			});
		}

	}
	/*if user is not logged/have not the permission to review I hide the review form*/
	$.post('isLoggedUser.php', function(result) {
		if (result == 0) {
			$("#review").hide();
		} else {
			$.post('canReviewUser.php', function(result) {
				if (result == 0) {
					$("#review").hide();
				}
			});
		}
	});

/*user click on "edit review"*/
	$(".editReview").hide();
	$(".edit_review_button").click(function(e) {
		e.preventDefault();

		/*hide the review and show the form preloaded*/
		$(this).closest('.cwell').find('.text_review').toggle();
		$(this).closest('.cwell').find('.editReview').toggle();
		var review = $(this).closest('.cwell').find('.text_review').text();
		$(this).closest('.cwell').find('.text_review_edit').val(review);

	});

});
