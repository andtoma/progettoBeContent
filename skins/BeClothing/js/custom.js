$().ready(function() {

	var count = 0;
	$('.item_list_start').children().each(function() {
		count = count + 1;
	});
	if (count == 0) {
		$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
	}
});

$().ready(function() {
	$("#register_form").submit(function(e) {
		if (!$('#register_terms').is(':checked')) {
			$(".title").html("Warning");
			$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;Please read and accept our terms & conditions.");
			$("#mymodal").modal("show");

			return false;
		}
	});
});

/* Items Sidebar Tag Filters */
$().ready(function() {

	/* Remove all Tags Button */
	$('#removeAllTags').on('click', function() {
		$('#searchTagsContainer').parent().hide();
		$('#searchTagsContainer a').each(function() {
			$(this).trigger('click');
		});

		$.ajax({
			url : 'itemsFilter.php',
			data : {
				tag : '',
				brand : '',
				color : '',
				priceMin : '0',
				priceMax : '99',
				subcategories : ''
			},
			type : 'post'
		}).done(function(response) {

			if (response != '') {
				$('.item_list_start').html(response);
			} else {
				$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
			}
		});
		return false;
	});

	if ($('#searchTagsContainer').children().length == 0) {
		$('#searchTagsContainer').parent().css('display', 'none');
	}

	/* Men Sidebar click*/
	var men = 0;
	if ($('#MenTag').length > 0) {
		men = 1;
	}

	$('#leftSidebarMen').on('click', function() {
		if (!men) {
			$('#searchTagsContainer').parent().show();
			$('#searchTagsContainer').append(' <a id="MenTag" href="" class="main_Tag btn btn-primary btn-xs"><i class="icon-remove"></i> Men</a>');
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});

			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			men = 1;
		}

		$('#MenTag').click(function() {
			$(this).remove();
			if ($('#searchTagsContainer').children().length == 0) {
				$('#searchTagsContainer').parent().hide('slow');
			}
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});
			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			men = 0;
			return false;
		});

		return false;

	});
	$('#MenTag').click(function() {
		$(this).remove();
		if ($('#searchTagsContainer').children().length == 0) {
			$('#searchTagsContainer').parent().hide('slow');
		}
		men = 0;
		var tags = "";
		var brands = '';
		var colors = "";
		var sliderPriceMin = $('#showMin').val();
		var sliderPriceMax = $('#showMax').val();
		var slidePriceMin = sliderPriceMin.toString().split('.');
		var slidePriceMax = sliderPriceMax.toString().split('.');
		alert(slidePriceMin);
		alert(slidePriceMax);

		$('#searchTagsContainer a').each(function() {
			text = $(this).text();
			if ($(this).hasClass('brand_Tag')) {
				brands += "'" + text + "',";
			} else {
				if ($(this).hasClass('color_Tag')) {
					colors += "'" + text + "',";
				} else {
					tags = tags + ' ' + $(this).text();
				}
			}
		});
		$.ajax({
			url : 'itemsFilter.php',
			data : {
				tag : tags,
				brand : brands.substring(0, brands.length - 1),
				color : colors.substring(0, colors.length - 1),
				priceMin : sliderPriceMin,
				priceMax : sliderPriceMax
			},
			type : 'post'
		}).done(function(response) {
			if (response != '') {
				$('.item_list_start').html(response);
			} else {
				$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
			}
		});
		men = 0;
		return false;
	});

	var women = 0;
	if ($('#WomenTag').length > 0) {
		women = 1;
	}
	$('#leftSidebarWomen').on('click', function() {
		if (!women) {

			$('#searchTagsContainer').parent().show();
			$('#searchTagsContainer').append(' <a id="WomenTag" href="" class="main_Tag btn btn-women btn-xs"><i class="icon-remove"></i> Women</a>');
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";

						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});
			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			women = 1;
		}

		$('#WomenTag').click(function() {
			$(this).remove();
			if ($('#searchTagsContainer').children().length == 0) {
				$('#searchTagsContainer').parent().hide('slow');
			}
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});
			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			women = 0;
			return false;
		});

		return false;

	});
	$('#WomenTag').click(function() {
		$(this).remove();
		if ($('#searchTagsContainer').children().length == 0) {
			$('#searchTagsContainer').parent().hide('slow');
		}
		var tags = "";
		var brands = '';
		var colors = "";
		var sliderPriceMin = $('#showMin').val();
		var sliderPriceMax = $('#showMax').val();
		var slidePriceMin = sliderPriceMin.toString().split('.');
		var slidePriceMax = sliderPriceMax.toString().split('.');
		alert(slidePriceMin);
		alert(slidePriceMax);

		$('#searchTagsContainer a').each(function() {
			text = $(this).text();
			if ($(this).hasClass('brand_Tag')) {
				brands += "'" + text + "',";
			} else {
				if ($(this).hasClass('color_Tag')) {
					colors += "'" + text + "',";
				} else {
					tags = tags + ' ' + $(this).text();
				}
			}
		});
		$.ajax({
			url : 'itemsFilter.php',
			data : {
				tag : tags,
				brand : brands.substring(0, brands.length - 1),
				color : colors.substring(0, colors.length - 1),
				priceMin : sliderPriceMin,
				priceMax : sliderPriceMax
			},
			type : 'post'
		}).done(function(response) {
			if (response != '') {
				$('.item_list_start').html(response);
			} else {
				$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
			}
		});
		women = 0;
		return false;
	});

	var accessories = 0;
	if ($('#AccessoriesTag').length > 0) {
		accessories = 1;
	}
	$('#leftSidebarAccessories').on('click', function() {
		if (!accessories) {

			$('#searchTagsContainer').parent().show();
			$('#searchTagsContainer').append(' <a id="AccessoriesTag" href="" class="main_Tag btn btn-inverse btn-xs"><i class="icon-remove"></i> Accessories</a>');
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});
			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			accessories = 1;
		}

		$('#AccessoriesTag').click(function() {
			$(this).remove();
			if ($('#searchTagsContainer').children().length == 0) {
				$('#searchTagsContainer').parent().hide('slow');
			}
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});
			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			accessories = 0;
			return false;
		});

		return false;

	});
	$('#AccessoriesTag').click(function() {
		$(this).remove();
		if ($('#searchTagsContainer').children().length == 0) {
			$('#searchTagsContainer').parent().hide('slow');
		}
		var tags = "";
		var brands = '';
		var colors = "";
		var sliderPriceMin = $('#showMin').val();
		var sliderPriceMax = $('#showMax').val();
		var slidePriceMin = sliderPriceMin.toString().split('.');
		var slidePriceMax = sliderPriceMax.toString().split('.');
		var subcategories = "";

		$('#searchTagsContainer a').each(function() {
			text = $(this).text();
			if ($(this).hasClass('brand_Tag')) {
				brands += "'" + text + "',";
			} else {
				if ($(this).hasClass('color_Tag')) {
					colors += "'" + text + "',";
				} else {
					if ($(this).hasClass('Subcategories_Tag')) {
						subcategories += "'" + $(this).text() + "',";
					} else {
						tags = tags + ' ' + $(this).text();
					}
				}
			}
		});
		$.ajax({
			url : 'itemsFilter.php',
			data : {
				tag : tags,
				brand : brands.substring(0, brands.length - 1),
				color : colors.substring(0, colors.length - 1),
				priceMin : sliderPriceMin,
				priceMax : sliderPriceMax,
				subcategories : subcategories.substring(0, subcategories.length - 1)
			},
			type : 'post'
		}).done(function(response) {
			if (response != '') {
				$('.item_list_start').html(response);
			} else {
				$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
			}
		});
		accessories = 0;
		return false;
	});

	var sale = 0;
	if ($('#SaleTag').length > 0) {
		sale = 1;
	}
	$('#leftSidebarSale').on('click', function() {
		if (!sale) {
			/* Man Main Category not in Filter Tags*/
			$('#searchTagsContainer').parent().show();
			$('#searchTagsContainer').append(' <a id="SaleTag" href="" class="special_Tag btn btn-warning btn-xs"><i class="icon-remove"></i> On Sale</a>');
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});
			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			sale = 1;
		}

		$('#SaleTag').click(function() {
			$(this).remove();
			if ($('#searchTagsContainer').children().length == 0) {
				$('#searchTagsContainer').parent().hide('slow');
			}
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});
			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			sale = 0;
			return false;
		});

		return false;

	});
	$('#SaleTag').click(function() {

		$(this).remove();
		if ($('#searchTagsContainer').children().length == 0) {
			$('#searchTagsContainer').parent().hide('slow');
		}
		var tags = "";
		var brands = '';
		var colors = "";
		var sliderPriceMin = $('#showMin').val();
		var sliderPriceMax = $('#showMax').val();
		var slidePriceMin = sliderPriceMin.toString().split('.');
		var slidePriceMax = sliderPriceMax.toString().split('.');
		var subcategories = "";

		$('#searchTagsContainer a').each(function() {
			text = $(this).text();
			if ($(this).hasClass('brand_Tag')) {
				brands += "'" + text + "',";
			} else {
				if ($(this).hasClass('color_Tag')) {
					colors += "'" + text + "',";
				} else {
					if ($(this).hasClass('Subcategories_Tag')) {
						subcategories += "'" + $(this).text() + "',";
					} else {
						tags = tags + ' ' + $(this).text();
					}
				}
			}
		});
		$.ajax({
			url : 'itemsFilter.php',
			data : {
				tag : tags,
				brand : brands.substring(0, brands.length - 1),
				color : colors.substring(0, colors.length - 1),
				priceMin : sliderPriceMin,
				priceMax : sliderPriceMax,
				subcategories : subcategories.substring(0, subcategories.length - 1)
			},
			type : 'post'
		}).done(function(response) {
			if (response != '') {
				$('.item_list_start').html(response);
			} else {
				$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
			}
		});
		sale = 0;
		return false;
	});

	var newArrivals = 0;
	if ($('#NewArrivalsTag').length > 0) {
		newArrivals = 1;
	}
	$('#leftSidebarNewArrivals').on('click', function() {
		if (!newArrivals) {

			$('#searchTagsContainer').parent().show();
			$('#searchTagsContainer').append(' <a id="NewArrivalsTag" href="" class="special_Tag btn btn-success btn-xs"><i class="icon-remove"></i> New Arrivals</a>');
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});
			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			newArrivals = 1;
		}

		$('#NewArrivalsTag').click(function() {
			$(this).remove();
			alert($('#searchTagsContainer').children().length);
			if ($('#searchTagsContainer').children().length == 0) {
				$('#searchTagsContainer').parent().hide('slow');
			}
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});
			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			newArrivals = 0;
			return false;
		});

		return false;

	});
	$('#NewArrivalsTag').click(function() {

		$(this).remove();
		if ($('#searchTagsContainer').children().length == 0) {
			$('#searchTagsContainer').parent().hide('slow');
		}
		var tags = "";
		var brands = '';
		var colors = "";
		var sliderPriceMin = $('#showMin').val();
		var sliderPriceMax = $('#showMax').val();
		var slidePriceMin = sliderPriceMin.toString().split('.');
		var slidePriceMax = sliderPriceMax.toString().split('.');
		var subcategories = "";

		$('#searchTagsContainer a').each(function() {
			text = $(this).text();
			if ($(this).hasClass('brand_Tag')) {
				brands += "'" + text + "',";
			} else {
				if ($(this).hasClass('color_Tag')) {
					colors += "'" + text + "',";
				} else {
					if ($(this).hasClass('Subcategories_Tag')) {
						subcategories += "'" + $(this).text() + "',";
					} else {
						tags = tags + ' ' + $(this).text();
					}
				}
			}
		});
		$.ajax({
			url : 'itemsFilter.php',
			data : {
				tag : tags,
				brand : brands.substring(0, brands.length - 1),
				color : colors.substring(0, colors.length - 1),
				priceMin : sliderPriceMin,
				priceMax : sliderPriceMax,
				subcategories : subcategories.substring(0, subcategories.length - 1)
			},
			type : 'post'
		}).done(function(response) {
			if (response != '') {
				$('.item_list_start').html(response);
			} else {
				$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
			}
		});
		newArrivals = 0;
		return false;
	});

	var bestSellers = 0;
	if ($('#BestSellersTag').length > 0) {
		bestSellers = 1;
	}
	$('#leftSidebarBestSeller').on('click', function() {
		if (!bestSellers) {
			$('#searchTagsContainer').parent().show();
			/* Special New Arrivals Category not in Filter Tags*/
			$('#searchTagsContainer').append(' <a id="BestSellersTag" href="" class="special_Tag btn btn-danger btn-xs"><i class="icon-remove"></i> Best Sellers</a>');
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});
			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			bestSellers = 1;
		}

		$('#BestSellersTag').click(function() {
			$(this).remove();
			if ($('#searchTagsContainer').children().length == 0) {
				$('#searchTagsContainer').parent().hide('slow');
			}
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});
			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			bestSellers = 0;
			return false;
		});

		return false;

	});

	$('#BestSellersTag').click(function() {

		$(this).remove();
		var tags = "";
		var brands = '';
		var colors = "";
		var sliderPriceMin = $('#showMin').val();
		var sliderPriceMax = $('#showMax').val();
		var slidePriceMin = sliderPriceMin.toString().split('.');
		var slidePriceMax = sliderPriceMax.toString().split('.');
		var subcategories = "";

		$('#searchTagsContainer a').each(function() {
			text = $(this).text();
			if ($(this).hasClass('brand_Tag')) {
				brands += "'" + text + "',";
			} else {
				if ($(this).hasClass('color_Tag')) {
					colors += "'" + text + "',";
				} else {
					if ($(this).hasClass('Subcategories_Tag')) {
						subcategories += "'" + $(this).text() + "',";
					} else {
						tags = tags + ' ' + $(this).text();
					}
				}
			}
		});
		$.ajax({
			url : 'itemsFilter.php',
			data : {
				tag : tags,
				brand : brands.substring(0, brands.length - 1),
				color : colors.substring(0, colors.length - 1),
				priceMin : sliderPriceMin,
				priceMax : sliderPriceMax,
				subcategories : subcategories.substring(0, subcategories.length - 1)
			},
			type : 'post'
		}).done(function(response) {
			if (response != '') {
				$('.item_list_start').html(response);
			} else {
				$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
			}
		});
		bestSellers = 0;
		return false;
	});

	/* Brand Text Search and Items Filtering */
	$('input#brandSearch').on('keyup click mouseenter hover', function() {
		$.ajax({
			url : 'brandsFilter.php',
			data : {
				token : $(this).val()
			},
			type : 'post'
		}).done(function(match) {
			$('#brandList').html();
			if (match.length) {
				$('#brandList').html(match);
			}

			/* Tag above on list item click */
			$('li a.brand_list_item').on('click', function() {
				alert($(this).text());

				/* If not, make Tags Container visible */
				$('#searchTagsContainer').parent().show();
				var what = $(this).text();
				var not = 0;
				$('#searchTagsContainer a').each(function() {
					if ($(this).text() == what) {
						alert();
						not = 1;
					}
				});
				/* Add Brand Tag */
				if (!not) {
					$('#searchTagsContainer').append(' <a href="" class="brand_Tag btn btn-brand btn-xs"><i class="icon-remove"></i>' + $(this).text() + '</a>');
				}

				var tags = "";
				var brands = '';
				var colors = "";
				var sliderPriceMin = $('#showMin').val();
				var sliderPriceMax = $('#showMax').val();
				var slidePriceMin = sliderPriceMin.toString().split('.');
				var slidePriceMax = sliderPriceMax.toString().split('.');
				var subcategories = "";

				$('#searchTagsContainer a').each(function() {
					text = $(this).text();
					if ($(this).hasClass('brand_Tag')) {
						brands += "'" + text + "',";
					} else {
						if ($(this).hasClass('color_Tag')) {
							colors += "'" + text + "',";
						} else {
							if ($(this).hasClass('Subcategories_Tag')) {
								subcategories += "'" + $(this).text() + "',";
							} else {
								tags = tags + ' ' + $(this).text();
							}
						}
					}
				});
				$.ajax({
					url : 'itemsFilter.php',
					data : {
						tag : tags,
						brand : brands.substring(0, brands.length - 1),
						color : colors.substring(0, colors.length - 1),
						priceMin : sliderPriceMin,
						priceMax : sliderPriceMax,
						subcategories : subcategories.substring(0, subcategories.length - 1)
					},
					type : 'post'
				}).done(function(response) {
					if (response != '') {
						$('.item_list_start').html(response);
					} else {
						$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
					}
				});

				/* Hide from choosing list */
				$(this).hide();

				$('.brand_Tag').on('click', function() {

					alert($(this).text());
					$(this).remove();
					var tags = "";
					var brands = '';
					var colors = "";
					var sliderPriceMin = $('#showMin').val();
					var sliderPriceMax = $('#showMax').val();
					var slidePriceMin = sliderPriceMin.toString().split('.');
					var slidePriceMax = sliderPriceMax.toString().split('.');
					var subcategories = "";

					$('#searchTagsContainer a').each(function() {
						text = $(this).text();
						if ($(this).hasClass('brand_Tag')) {
							brands += "'" + text + "',";
						} else {
							if ($(this).hasClass('color_Tag')) {
								colors += "'" + text + "',";
							} else {
								if ($(this).hasClass('Subcategories_Tag')) {
									subcategories += "'" + $(this).text() + "',";
								} else {
									tags = tags + ' ' + $(this).text();
								}
							}
						}
					});
					$.ajax({
						url : 'itemsFilter.php',
						data : {
							tag : tags,
							brand : brands.substring(0, brands.length - 1),
							color : colors.substring(0, colors.length - 1),
							priceMin : sliderPriceMin,
							priceMax : sliderPriceMax,
							subcategories : subcategories.substring(0, subcategories.length - 1)
						},
						type : 'post'
					}).done(function(response) {
						if (response != '') {
							$('.item_list_start').html(response);
						} else {
							$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
						}
					});

					return false;
				});

				return false;
			});

		});

	});
	$('.brand_Tag').on('click', function() {

		alert($(this).text());
		$(this).remove();
		var tags = "";
		var brands = '';
		var colors = "";
		var sliderPriceMin = $('#showMin').val();
		var sliderPriceMax = $('#showMax').val();
		var slidePriceMin = sliderPriceMin.toString().split('.');
		var slidePriceMax = sliderPriceMax.toString().split('.');
		var subcategories = "";

		$('#searchTagsContainer a').each(function() {
			text = $(this).text();
			if ($(this).hasClass('brand_Tag')) {
				brands += "'" + text + "',";
			} else {
				if ($(this).hasClass('color_Tag')) {
					colors += "'" + text + "',";
				} else {
					if ($(this).hasClass('Subcategories_Tag')) {
						subcategories += "'" + $(this).text() + "',";
					} else {
						tags = tags + ' ' + $(this).text();
					}
				}
			}
		});
		$.ajax({
			url : 'itemsFilter.php',
			data : {
				tag : tags,
				brand : brands.substring(0, brands.length - 1),
				color : colors.substring(0, colors.length - 1),
				priceMin : sliderPriceMin,
				priceMax : sliderPriceMax,
				subcategories : subcategories.substring(0, subcategories.length - 1)
			},
			type : 'post'
		}).done(function(response) {
			if (response != '') {
				$('.item_list_start').html(response);
			} else {
				$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
			}
		});

		return false;
	});

	/* Color Picker Items Filter */
	$('p.color_filter').on('click', function() {
		/* If not, make Tags Container visible */
		$('#searchTagsContainer').parent().show();
		var what = $(this).attr('background-color');
		var not = 0;
		$('#searchTagsContainer a').each(function() {
			if ($(this).attr('color') == what) {
				alert();
				not = 1;
			}
		});
		/* Add Brand Tag */
		if (!not) {
			$('#searchTagsContainer').append(' <a href="" class="brand_Tag btn btn-colors btn-xs"><i class="icon-remove"></i>' + $(this).css('background-color') + '</a>');
		}
	});

});

$().ready(function() {
	$.ajax({
		url : 'coloursFilter.php',
		data : {
			picked : ''
		},
		type : 'post'
	}).done(function(result) {
		/* color container from database */
		$('.color-container').html(result);
		$('.color_filter').on('click', function() {
			$('#searchTagsContainer').parent().show();
			var what = $(this).attr('id');
			var not = 0;
			$('#searchTagsContainer a').each(function() {
				if ($(this).text() == what) {
					not = 1;
				}
			});
			/* Add Color Tag */
			if (!not) {
				if ($(this).attr('id') === 'Yellow') {
					$('#searchTagsContainer').append(' <a href="" class="color_Tag btn btn-warning btn-xs" style="background-color: ' + $(this).attr('id') + '; color: black; border: 1px solid black;"><i class="icon-remove"></i>' + $(this).attr('id') + '</a>');
				} else {
					if ($(this).attr('id') === 'White') {
						$('#searchTagsContainer').append(' <a href="" class="color_Tag btn btn-xs" style="background-color: ' + $(this).attr('id') + '; color: black; border: 1px solid black;"><i class="icon-remove"></i>' + $(this).attr('id') + '</a>');
					} else {
						$('#searchTagsContainer').append(' <a href="" class="color_Tag btn btn-colors btn-xs" style="background-color: ' + $(this).attr('id') + '"><i class="icon-remove"></i>' + $(this).attr('id') + '</a>');
					}
				}
				alert($(this).attr('background-color'));
				alert($(this).css('background-color'));
				alert($(this).attr('id'));
			}

			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});
			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});

			$('.color_Tag').on('click', function() {
				$(this).remove();
				var tags = "";
				var brands = '';
				var colors = "";
				var sliderPriceMin = $('#showMin').val();
				var sliderPriceMax = $('#showMax').val();
				var slidePriceMin = sliderPriceMin.toString().split('.');
				var slidePriceMax = sliderPriceMax.toString().split('.');
				var subcategories = "";

				$('#searchTagsContainer a').each(function() {
					text = $(this).text();
					if ($(this).hasClass('brand_Tag')) {
						brands += "'" + text + "',";
					} else {
						if ($(this).hasClass('color_Tag')) {
							colors += "'" + text + "',";
						} else {
							if ($(this).hasClass('Subcategories_Tag')) {
								subcategories += "'" + $(this).text() + "',";
							} else {
								tags = tags + ' ' + $(this).text();
							}
						}
					}
				});
				$.ajax({
					url : 'itemsFilter.php',
					data : {
						tag : tags,
						brand : brands.substring(0, brands.length - 1),
						color : colors.substring(0, colors.length - 1),
						priceMin : sliderPriceMin,
						priceMax : sliderPriceMax,
						subcategories : subcategories.substring(0, subcategories.length - 1)
					},
					type : 'post'
				}).done(function(response) {
					if (response != '') {
						$('.item_list_start').html(response);
					} else {
						$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
					}
				});
				return false;
			});
		});

	});

});

/* SubCategories */
$().ready(function() {
	$('li a.leftSideBarSubcategories').on('click', function() {

		$('#searchTagsContainer').parent().show();
		var what = $(this).text();
		alert(what);
		var not = 0;
		$('#searchTagsContainer a').each(function() {
			if ($(this).text() == what) {
				not = 1;
			}
		});
		/* Add Sub Tag */
		if (!not) {
			$('#searchTagsContainer').append(' <a href="" class="Subcategories_Tag btn btn-subcategories btn-xs"><i class="icon-remove"></i>' + what + '</a>');
		}

		var tags = "";
		var brands = '';
		var colors = "";
		var sliderPriceMin = $('#showMin').val();
		var sliderPriceMax = $('#showMax').val();
		var slidePriceMin = sliderPriceMin.toString().split('.');
		var slidePriceMax = sliderPriceMax.toString().split('.');
		var subcategories = "";

		$('#searchTagsContainer a').each(function() {
			text = $(this).text();
			if ($(this).hasClass('brand_Tag')) {
				brands += "'" + text + "',";
			} else {
				if ($(this).hasClass('color_Tag')) {
					colors += "'" + text + "',";
				} else {
					if ($(this).hasClass('Subcategories_Tag')) {
						subcategories += "'" + $(this).text() + "',";
					} else {
						tags = tags + ' ' + $(this).text();
					}
				}
			}
		});
		$.ajax({
			url : 'itemsFilter.php',
			data : {
				tag : tags,
				brand : brands.substring(0, brands.length - 1),
				color : colors.substring(0, colors.length - 1),
				priceMin : sliderPriceMin,
				priceMax : sliderPriceMax,
				subcategories : subcategories.substring(0, subcategories.length - 1)
			},
			type : 'post'
		}).done(function(response) {
			if (response != '') {
				$('.item_list_start').html(response);
			} else {
				$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
			}
		});
		/*End Done*/

		$('.Subcategories_Tag').on('click', function() {
			$(this).remove();
			var tags = "";
			var brands = '';
			var colors = "";
			var sliderPriceMin = $('#showMin').val();
			var sliderPriceMax = $('#showMax').val();
			var slidePriceMin = sliderPriceMin.toString().split('.');
			var slidePriceMax = sliderPriceMax.toString().split('.');
			var subcategories = "";

			$('#searchTagsContainer a').each(function() {
				text = $(this).text();
				if ($(this).hasClass('brand_Tag')) {
					brands += "'" + text + "',";
				} else {
					if ($(this).hasClass('color_Tag')) {
						colors += "'" + text + "',";
					} else {
						if ($(this).hasClass('Subcategories_Tag')) {
							subcategories += "'" + $(this).text() + "',";
						} else {
							tags = tags + ' ' + $(this).text();
						}
					}
				}
			});

			$.ajax({
				url : 'itemsFilter.php',
				data : {
					tag : tags,
					brand : brands.substring(0, brands.length - 1),
					color : colors.substring(0, colors.length - 1),
					priceMin : sliderPriceMin,
					priceMax : sliderPriceMax,
					subcategories : subcategories.substring(0, subcategories.length - 1)
				},
				type : 'post'
			}).done(function(response) {
				if (response != '') {
					$('.item_list_start').html(response);
				} else {
					$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
				}
			});
			return false;
		});
		return false;
	});
});

$('.Subcategories_Tag').on('click', function() {
	$(this).remove();
	if ($('#searchTagsContainer').children().length == 0) {
		$('#searchTagsContainer').parent().css('display', 'none');
	}
	var tags = "";
	var brands = '';
	var colors = "";
	var sliderPriceMin = $('#showMin').val();
	var sliderPriceMax = $('#showMax').val();
	var slidePriceMin = sliderPriceMin.toString().split('.');
	var slidePriceMax = sliderPriceMax.toString().split('.');
	var subcategories = "";

	$('#searchTagsContainer a').each(function() {
		text = $(this).text();
		if ($(this).hasClass('brand_Tag')) {
			brands += "'" + text + "',";
		} else {
			if ($(this).hasClass('color_Tag')) {
				colors += "'" + text + "',";
			} else {
				if ($(this).hasClass('Subcategories_Tag')) {
					subcategories += "'" + $(this).text() + "',";
				} else {
					tags = tags + ' ' + $(this).text();
				}
			}
		}
	});

	$.ajax({
		url : 'itemsFilter.php',
		data : {
			tag : tags,
			brand : brands.substring(0, brands.length - 1),
			color : colors.substring(0, colors.length - 1),
			priceMin : sliderPriceMin,
			priceMax : sliderPriceMax,
			subcategories : subcategories.substring(0, subcategories.length - 1)
		},
		type : 'post'
	}).done(function(response) {
		if (response != '') {
			$('.item_list_start').html(response);
		} else {
			$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
		}
	});
	return false;
});

/* Price Slider */
$().ready(function() {
	/* Init */
	$('.noUiSlider').noUiSlider({
		range : [0, 99],
		start : [0, 99],
		margin : 20,
		connect : true,
		step : 1,
		behaviour : "tap",
		serialization : {
			to : [$('#showMin'), $('#showMax')]

		}
	});

	/* Custom min-max handlers */
	$('.noUiSlider').closest('.cwell').css('padding-bottom', '40px');
	$('.noUi-handle-lower').html('<h6 class="noUiHandlerLabel">Min<i class="icon-arrow-left"></i><i class="icon-arrow-right"></i></h6>').css('text-align', 'center');
	$('.noUi-handle-upper').html('<h6 class="noUiHandlerLabel">Max<i class="icon-arrow-left"></i><i class="icon-arrow-right"></i></h6>').css('text-align', 'center');

	$('.noUi-handle-upper').on('click', function() {
		alert($('#showMax').val());
		var tags = "";
		var brands = '';
		var colors = "";
		var sliderPriceMin = $('#showMin').val();
		var sliderPriceMax = $('#showMax').val();
		var slidePriceMin = sliderPriceMin.toString().split('.');
		var slidePriceMax = sliderPriceMax.toString().split('.');
		var subcategories = "";

		$('#searchTagsContainer a').each(function() {
			text = $(this).text();
			if ($(this).hasClass('brand_Tag')) {
				brands += "'" + text + "',";
			} else {
				if ($(this).hasClass('color_Tag')) {
					colors += "'" + text + "',";
				} else {
					if ($(this).hasClass('Subcategories_Tag')) {
						subcategories += "'" + $(this).text() + "',";
					} else {
						tags = tags + ' ' + $(this).text();
					}
				}
			}
		});
		$.ajax({
			url : 'itemsFilter.php',
			data : {
				tag : tags,
				brand : brands.substring(0, brands.length - 1),
				color : colors.substring(0, colors.length - 1),
				priceMin : sliderPriceMin,
				priceMax : sliderPriceMax,
				subcategories : subcategories.substring(0, subcategories.length - 1)
			},
			type : 'post'
		}).done(function(response) {
			if (response != '') {
				$('.item_list_start').html(response);
			} else {
				$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
			}
		});
	});

	$('.noUi-handle-lower').on('click', function() {
		var tags = "";
		var brands = '';
		var colors = "";
		var sliderPriceMin = $('#showMin').val();
		var sliderPriceMax = $('#showMax').val();
		var slidePriceMin = sliderPriceMin.toString().split('.');
		var slidePriceMax = sliderPriceMax.toString().split('.');
		var subcategories = "";

		$('#searchTagsContainer a').each(function() {
			text = $(this).text();
			if ($(this).hasClass('brand_Tag')) {
				brands += "'" + text + "',";
			} else {
				if ($(this).hasClass('color_Tag')) {
					colors += "'" + text + "',";
				} else {
					if ($(this).hasClass('Subcategories_Tag')) {
						subcategories += "'" + $(this).text() + "',";
					} else {
						tags = tags + ' ' + $(this).text();
					}
				}
			}
		});
		$.ajax({
			url : 'itemsFilter.php',
			data : {
				tag : tags,
				brand : brands.substring(0, brands.length - 1),
				color : colors.substring(0, colors.length - 1),
				priceMin : sliderPriceMin,
				priceMax : sliderPriceMax,
				subcategories : subcategories.substring(0, subcategories.length - 1)
			},
			type : 'post'
		}).done(function(response) {
			if (response != '') {
				$('.item_list_start').html(response);
			} else {
				$('.item_list_start').html('<div class="cwell"><h1 class="itemsNotFoundHeader1">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para itemsNotFoundHeader2">Try to change your search tags above!</h2></div>');
			}
		});
	});

});

/* Search Blog Post ( Extensible for other) */
$().ready(function() {
	$('button.blog_search_button').on('click', function() {
		var search_text = $(this).closest('div').find('input').first().val();
		if (search_text == '') {
			$('div.blog div.col-md-9').html('<h1 style="text-align: center;">Empty Search String<span class="color">!!!</span></h1><h2 class="error-para" style="text-align: center;">Without any search criteria, it\'s like hunting a needle in an haystack!</h2><div class="link-list"><h5></h5><a href="#"></a><a href="#"></a><a href="#"></a></div>');
		} else {
			$.ajax({
				url : 'searchString.php',
				data : {
					what : search_text,
					where : 'blog_posts'
				},
				type : 'post'
			}).done(function(response) {
				if (response === "error") {
					$('div.blog div.col-md-9').html('<div class="cwell"><h1 style="text-align: center;">Sorry<span class="color">!!!</span> No Results Found<span class="color">!!!</span></h1><h2 class="error-para" style="text-align: center;">Try again typing what you\'re searching for in another way!</h2></div><div class="link-list"><h5></h5><a href="#"></a><a href="#"></a><a href="#"></a></div>');
				} else {
					new_response = response.replace(/&lt;/g, "<");
					new_response = new_response.replace(/&gt;/g, ">");
					new_response = new_response.replace(/&quot;/g, "\"");
					new_response = new_response.replace(/&amp;/g, "&");
					$('div.blog div.col-md-9').html(new_response);

				}
			});
		}

	});

});

/* Update/Delete Comment */
$().ready(function() {
	/* Edit Comment */

	$('li.cwell.comment form.editComment').hide();
	$('button.update_comment.btn').on('click', function() {
		$(this).closest('li.cwell.comment').find('form.editComment').first().toggle();
		$(this).closest('li.cwell.comment').find('p').first().toggle();
	});
	$('li.cwell.comment form.editComment button').on('click', function() {
		var test = $(this).closest('li.cwell.comment');
		$.ajax({
			url : 'updateComment.php',
			type : 'post',
			data : {
				id : $(this).val(),
				text : $(this).closest('form.editComment').find('textarea').first().val()
			}
		}).done(function(data) {
			if (data == 'ko') {
				alert('Sorry something gone wrong...Try later!')
			} else {
				test.find('p').text(test.find('form.editComment textarea').val());
				test.find('form.editComment').first().toggle();
				test.find('p').first().toggle();
			}
		});
	});

	/* Remove Comment */
	$('button.remove_comment.btn').on('click', function() {
		var test = $(this).closest('li.cwell.comment');
		$.ajax({
			url : 'removeComment.php',
			type : 'post',
			data : {
				id : "" + $(this).val() + ""
			}
		}).done(function(data) {
			if (data == 'ko') {
				alert('Sorry something gone wrong...Try later!')
			} else {
				test.remove();
			}
		});
	});

});

/* Single Blog Post Comments*/

$().ready(function() {
	$('.posts div.comments').hide();
	$('.posts div.respond').hide();
	if ($('.posts div.comments ul.comment-list').hasClass('visible')) {
		$('.posts div.comments').toggle('slow');
		/* ajax user logged test */
		$.post('isLoggedUser.php', function(result) {
			if (result == 1) {
				/* logged user can type comments */
				$('.posts div.respond').toggle('slow');
			}
		});
	}
	$('.meta .pull-right').on('click', function() {
		var comments = parseInt(($(this).text()).replace(' Comments', ''));
		if (comments !== 0) {
			$('.posts div.comments').toggle('slow');
		}
		/* ajax user logged test */
		$.post('isLoggedUser.php', function(result) {
			if (result == 1) {
				/* logged user can type comments */
				$('.posts div.respond').toggle('slow');
			}
		});
	});

});

/* Register Input Validation */
$().ready(function() {
	/* Email Address Regular Expression Validation */
	var email = new RegExp(/^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/);
	$('.emailValidation').on('blur', function() {
		if (!$(this).val().match(email)) {
			/* Wrong Address Format */
			$(this).css({
				'border' : '1px solid red',
				'box-shadow' : '0px 0px 2px red'
			});
			$(this).removeClass('validated');
		} else {
			/* Right Address Format */
			$(this).css({
				'border' : '1px solid green',
				'box-shadow' : '0px 0px 2px green'
			});
			$(this).addClass('validated');
		}
	});

	/* Username Regular Expression Validation*/
	var username = new RegExp(/^[a-zA-Z0-9._-]{2,45}$/);

	$('.usernameValidation').on('blur', function() {
		var value = $(this);
		$.ajax({
			url : "usernameValidation.php",
			type : "post",
			data : {
				username : $(this).val()
			}
		}).done(function(responce) {
			if (!value.val().match(username)) {
				/* Wrong Username Format */
				value.css({
					'border' : '1px solid red',
					'box-shadow' : '0px 0px 2px red'
				});
				value.removeClass('validated');
			} else {
				if (responce > 0) {
					/* Username already exists in Database */
					value.css({
						'border' : '1px solid red',
						'box-shadow' : '0px 0px 2px red'
					});
					value.removeClass('validated');
				} else {
					/* Right Username Format */
					value.css({
						'border' : '1px solid green',
						'box-shadow' : '0px 0px 2px green'
					});
					value.addClass('validated');
				}
			}
		});
	});

	/* Name and Surname Regular Expression Validation*/
	var name = new RegExp(/^[a-zA-Z]{2,45}$/);
	$('.nameValidation').on('blur', function() {
		if (!$(this).val().match(name)) {
			/* Wrong Name Format */
			$(this).css({
				'border' : '1px solid red',
				'box-shadow' : '0px 0px 2px red'
			});
			$(this).removeClass('validated');
		} else {
			/* Right Name Format */
			$(this).css({
				'border' : '1px solid green',
				'box-shadow' : '0px 0px 2px green'
			});
			$(this).addClass('validated');
		}
	});

	/* Password Regular Expression Validation */
	var password = new RegExp(/^[a-zA-Z0-9]{5,32}$/);
	$('.passwordValidation').on('blur', function() {
		if (!$(this).val().match(password)) {
			/* Wrong Password Format */
			$(this).css({
				'border' : '1px solid red',
				'box-shadow' : '0px 0px 2px red'
			});
			$(this).removeClass('validated');
		} else {
			/* Right Password Format */
			$(this).css({
				'border' : '1px solid green',
				'box-shadow' : '0px 0px 2px green'
			});
			$(this).addClass('validated');
		}
	});

	/* Password Repeating Validation */
	$('.repeatValidation').on('blur', function() {
		if ($(this).val() !== $('.passwordValidation').val()) {
			$(this).css({
				'border' : '1px solid red',
				'box-shadow' : '0px 0px 2px red'
			});
			$(this).removeClass('validated');
		} else {
			if ($(this).val() !== '') {
				/* Right Repeat Password Coincidence */
				$(this).css({
					'border' : '1px solid green',
					'box-shadow' : '0px 0px 2px green'
				});
				$(this).addClass('validated');
			} else {
				/* Password field is empty 	*/
				$(this).css({
					'border' : '1px solid red',
					'box-shadow' : '0px 0px 2px red'
				});
				$(this).removeClass('validated');
			}

		}
	});

	/* Birth Date Regular Expression Validation */
	var birthDate = new RegExp(/^(0[1-9]|1[012])[/](0[1-9]|[12][0-9]|3[01])[/](19|20)[0-9][0-9]$/);
	$('.birthDateValidation').on('blur', function() {
		var val = "";
		switch($('.month').filter('.active').text()) {
			case 'Jan':
				val += "01";
				break;
			case 'Feb':
				val += "02";
				break;
			case 'Mar':
				val += "03";
				break;
			case 'Apr':
				val += "04";
				break;
			case 'May':
				val += "05";
				break;
			case 'Jun':
				val += "06";
				break;
			case 'Jul':
				val += "07";
				break;
			case 'Aug':
				val += "08";
				break;
			case 'Sep':
				val += "09";
				break;
			case 'Oct':
				val += "10";
				break;
			case 'Nov':
				val += "11";
				break;
			case 'Dec':
				val += "12";
				break;
		}
		val += "/";
		switch($('.day').filter('.active').text()) {
			case '1':
				val += "0";
				val += $('.day').filter('.active').text();
				break;
			case '2':
				val += "0";
				val += $('.day').filter('.active').text();
				break;
			case '3':
				val += "0";
				val += $('.day').filter('.active').text();
				break;
			case '4':
				val += "0";
				val += $('.day').filter('.active').text();
				break;
			case '5':
				val += "0";
				val += $('.day').filter('.active').text();
				break;
			case '6':
				val += "0";
				val += $('.day').filter('.active').text();
				break;
			case '7':
				val += "0";
				val += $('.day').filter('.active').text();
				break;
			case '8':
				val += "0";
				val += $('.day').filter('.active').text();
				break;
			case '9':
				val += "0";
				val += $('.day').filter('.active').text();
				break;
			default:
				val += $('.day').filter('.active').text();
		}
		val += "/";
		val += $('.year').filter('.active').text();
		$(this).val(val);
		if (!$(this).val().match(birthDate)) {
			/* Wrong Birth Date Format */
			$(this).css({
				'border' : '1px solid red',
				'box-shadow' : '0px 0px 2px red'
			});
			$(this).removeClass('validated');
		} else {
			/* Right Birth Date Format ( mm/dd/yyyy) */
			$(this).css({
				'border' : '1px solid green',
				'box-shadow' : '0px 0px 2px green'
			});
			$(this).addClass('validated');
		}
	});

	/* Submit Final Validation */
	$('.formValidation').on('submit', function() {
		var validation = 1;
		/* Check if all input fields have been correctly filled */
		$(this).find("input:not(input[type=radio], input[type=checkbox])").each(function() {
			if (!$(this).hasClass('validated')) {
				validation = 0;
			}
		});
		/* Check Sex Radiobox */
		if ($('.sexValidation input:radio:checked').length == 0) {
			/* No Sex Chosen */
			validation = 0;
		}
		/* Check Terms&Conditions Checkbox */
		if (!$('.termsValidation').is(':checked')) {
			/* No Terms Accepted */
			validation = 0;
		}

		if (validation == 0) {
			validation = 1;
			return false;
		}

	});

});

/*Credit Card Information Sliding Down & Up on Change Event*/

$().ready(function() {
	$('.creditCardSlider').hide();
	$('.payment_method').on('change', function() {
		if ($(this).val() == "Credit Card") {
			$('.creditCardSlider').show();
		} else {
			$('.creditCardSlider').hide();
		}
	});
	$('button[type=reset]').on('click', function() {
		$('.creditCardSlider').hide();
	});
});

/* Bootstrap Carousel */

$('.carousel').carousel({
	interval : 8000,
	pause : "hover"
});

/* Ecommerce single item carousel */

$('.ecarousel').carousel({
	interval : 8000,
	pause : "hover"
});

/* Navigation Menu */

ddlevelsmenu.setup("ddtopmenubar", "topbar");

/* Dropdown Select */

/* Navigation (Select box) */

// Create the dropdown base

$("<select />").appendTo(".navis");

// Create default option "Go to..."

$("<option />", {
	"selected" : "selected",
	"value" : "",
	"text" : "Menu"
}).appendTo(".navis select");

// Populate dropdown with menu items

$(".navi a").each(function() {
	var el = $(this);
	$("<option />", {
		"value" : el.attr("href"),
		"text" : el.text()
	}).appendTo(".navis select");
});

$(".navis select").change(function() {
	window.location = $(this).find("option:selected").val();
});

/* Most Popular carousel (CarouFredSel) */

/* Carousel */

$('#carousel_container_mp').carouFredSel({
	responsive : true,
	width : '100%',
	direction : 'left',
	scroll : {
		items : 1,
		delay : 2000,
		duration : 500,
		pauseOnHover : "true"
	},
	prev : {
		button : "#car_prev_mp",
		key : "left"
	},
	next : {
		button : "#car_next_mp",
		key : "right"
	},
	items : {
		visible : {
			min : 1,
			max : 4
		}
	}
});

/* New Arrival carousel (CarouFredSel) */

/* Carousel */

$('#carousel_container_na').carouFredSel({
	responsive : true,
	width : '100%',
	direction : 'left',
	scroll : {
		items : 1,
		delay : 2000,
		duration : 500,
		pauseOnHover : "true"
	},
	prev : {
		button : "#car_prev_na",
		key : "left"
	},
	next : {
		button : "#car_next_na",
		key : "right"
	},
	items : {
		visible : {
			min : 1,
			max : 4
		}
	}
});




/* Brands carousel (CarouFredSel) */

/* Carousel */

$('#carousel_container_br').carouFredSel({
        responsive : true,
        width : '100%',
        direction : 'left',
        scroll : {
                items : 4,
                delay : 2000,
                duration : 500,
                pauseOnHover : "true"
        },
        prev : {
                button : "#car_prev_br",
                key : "left"
        },
        next : {
                button : "#car_next_br",
                key : "right"
        },
        items : {
                visible : {
                        min : 1,
                        max : 4
                }
        }
});








/* Scroll to Top */

$(".totop").hide();

$(function() {
	$(window).scroll(function() {
		if ($(this).scrollTop() > 300) {
			$('.totop').slideDown();
		} else {
			$('.totop').slideUp();
		}
	});

	$('.totop a').click(function(e) {
		e.preventDefault();
		$('body,html').animate({
			scrollTop : 0
		}, 500);
	});

});

/* Support */

$("#slist a").click(function(e) {
	e.preventDefault();
	$(this).next('p').toggle(200);
});

/* Careers */

$('#myTab a').click(function(e) {
	e.preventDefault();
	$(this).tab('show');
});
/* Countdown */

$(function() {
	launchTime = new Date();
	launchTime.setDate(launchTime.getDate() + 365);
	$("#countdown").countdown({
		until : launchTime,
		format : "dHMS"
	});
});

/* Ecommerce sidebar */

$(document).ready(function() {

	$('.sidey .nav').navgoco({
		accordion : true
	});
	$('.datepicker').datepicker({
		'format' : 'yyyy/mm/dd'
	});

	$('button.close').click(function() {
		$('div.alert').hide('slow');
	});
});

