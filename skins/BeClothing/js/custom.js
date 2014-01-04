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
		var val="";
		switch($('.month').filter('.active').text()){
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
		switch($('.day').filter('.active').text()){
			case '1':
				val += "0";
				val += $('.day').filter('.active').text()
				break;
			case '2':
				val += "0";
				val += $('.day').filter('.active').text()
				break;
			case '3':
				val += "0";
				val += $('.day').filter('.active').text()
				break;
			case '4':
				val += "0";
				val += $('.day').filter('.active').text()
				break;
			case '5':
				val += "0";
				val += $('.day').filter('.active').text()
				break;
			case '6':
				val += "0";
				val += $('.day').filter('.active').text()
				break;
			case '7':
				val += "0";
				val += $('.day').filter('.active').text()
				break;
			case '8':
				val += "0";
				val += $('.day').filter('.active').text()
				break;
			case '9':
				val += "0";
				val += $('.day').filter('.active').text()
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
	$('.formValidation').on('submit',function(){
		var validation = 1;
		/* Check if all input fields have been correctly filled */
		$(this).find("input:not(input[type=radio], input[type=checkbox])").each(function(){
			if(!$(this).hasClass('validated')){
				validation = 0;
			}
		});
		/* Check Sex Radiobox */
		if($('.sexValidation input:radio:checked').length == 0){
			/* No Sex Chosen */
			validation = 0;
		}
		/* Check Terms&Conditions Checkbox */
		if(!$('.termsValidation').is(':checked')){
			/* No Terms Accepted */
			validation = 0;
		}
		
		if(validation == 0){
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
		items : 2,
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
		items : 2,
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
	e.preventDefault()
	$(this).tab('show')
})
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
	$('.datepicker').datepicker();
	$('button.close').click(function() {
		$('div.alert').hide('slow');
	});
});
