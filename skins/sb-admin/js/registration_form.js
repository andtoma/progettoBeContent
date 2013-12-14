$().ready(function(){
					/*
					For every step, first element is not valid at the beginning
					*/
					
					//email initial validation
					$('input[name=email]').css({
									'box-shadow':'red 0px 0px 3px',
									'border': '0px rgba(0,0,0,1)',
									'border-style': 'outset',
									'background':'url("skins/sb-admin/images/validation_error.png") no-repeat 95% 50%',
									'-webkit-transition':'0s',
									'background-color':'white'
								});
								
					//name initial validation
					$('input[name=name]').css({
									'box-shadow':'red 0px 0px 3px',
									'border': '0px rgba(0,0,0,1)',
									'border-style': 'outset',
									'background':'url("skins/sb-admin/images/validation_error.png") no-repeat 95% 50%',
									'-webkit-transition':'0s',
									'background-color':'white'
									
								});
					//country initial validation			
					$('input[name=country]').css({
									'box-shadow':'red 0px 0px 3px',
									'border': '0px rgba(0,0,0,1)',
									'border-style': 'outset',
									'background':'url("skins/sb-admin/images/validation_error.png") no-repeat 95% 50%',
									'-webkit-transition':'0s',
									'background-color':'white'
									
								});						
					
					// email format verification function
					function IsEmail(email) {
						var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
						return regex.test(email);
					}
					
					// empty field function
					function IsEmpty(field){
						return field=="";
					}
					
					// password matching function
					function IsPassword(password, repeat_password){
						return password==repeat_password;
					}
					
					// plain text test function
					function IsName(name){
						var regex = /^([a-zA-Z])+$/;
						if(!IsEmpty(name)){
							return regex.test(name);
						}
						return 0;
					}
					
					// zip-code test function
					function IsZipCode(zip_code){
						var regex = /[0-9-()+]{1,20}/; 
						if(!IsEmpty(zip_code)){
							return regex.test(zip_code);
						}
						return false;
					}
					
					// address test function
					function IsAddress(address){
						var regex = /([a-zA-Z0-9]*\s)*/;
						if(!IsEmpty(address)){	
							return regex.test(address);
						}
					}
										
					// address validation
					$('.mandatory input[name=address]').keyup(function(){
						var address = $(this).val();
						console.log(address);
						if(IsAddress(address)){
							if($(this).attr('class')!='valid'){
									$(this).attr('class','valid');
								}
							$(this).css({
								'box-shadow':'green 0px 0px 3px',
								'border': '0px rgba(0,0,0,1)',
								'border-style': 'outset',
								'background':'url("skins/sb-admin/images/validation_consense.png") no-repeat 95% 50%',
								'-webkit-transition':'0s',
								'background-color':'white'
								});
									
								} else { 
									$(this).css({
										'box-shadow':'red 0px 0px 3px',
										'border': '0px rgba(0,0,0,1)',
										'border-style': 'outset',
										'background':'url("skins/sb-admin/images/validation_error.png") no-repeat 95% 50%',
										'-webkit-transition':'0s',
										'background-color':'white'
										});
									}
								});
										
					// zip code validation
					$('.mandatory input[name=zip_code]').keyup(function(){
						var zip_code = $(this).val();
						if(IsZipCode(zip_code)){
							if($(this).attr('class')!='valid'){
									$(this).attr('class','valid');
								}
							$(this).css({
								'box-shadow':'green 0px 0px 3px',
								'border': '0px rgba(0,0,0,1)',
								'border-style': 'outset',
								'background':'url("skins/sb-admin/images/validation_consense.png") no-repeat 95% 50%',
								'-webkit-transition':'0s',
								'background-color':'white'
								});	
						} else { 
							$(this).css({
									'box-shadow':'red 0px 0px 3px',
									'border': '0px rgba(0,0,0,1)',
									'border-style': 'outset',
									'background':'url("skins/sb-admin/images/validation_error.png") no-repeat 95% 50%',
									'-webkit-transition':'0s',
									'background-color':'white'
								});
							}
					});
					
					// plain text validation ( not empty and no numbers )
					$('.mandatory input[type=text]:not([name=email],[name=zip_code],[name=phone],[name=address])').keyup(function(){ // all text inputs except email field
						var name = $(this).val();
						if (IsName(name)){
								if($(this).attr('class')!='valid'){
									$(this).attr('class','valid');
								}
								$(this).css({
									'box-shadow':'green 0px 0px 3px',
									'border': '0px rgba(0,0,0,1)',
									'border-style': 'outset',
									'background':'url("skins/sb-admin/images/validation_consense.png") no-repeat 95% 50%',
									'-webkit-transition':'0s',
									'background-color':'white'

								});	
							}
							else {
								$(this).css({
									'box-shadow':'red 0px 0px 3px',
									'border': '0px rgba(0,0,0,1)',
									'border-style': 'outset',
									'background':'url("skins/sb-admin/images/validation_error.png") no-repeat 95% 50%',
									'-webkit-transition':'0s',
									'background-color':'white'
								});
							}
					});
					
					
					// email validation
					$('input[name=email]').keyup(function(){
							var email = $(this).val();
							if (IsEmail(email)){
								if($(this).attr('class')!='valid'){
									$(this).attr('class','valid');
								}
								$(this).css({
									'box-shadow':'green 0px 0px 3px',
									'border': '0px rgba(0,0,0,1)',
									'border-style': 'outset',
									'background':'url("skins/sb-admin/images/validation_consense.png") no-repeat 95% 50%',
									'-webkit-transition':'0s',
									'background-color':'white'

								});
							}
							else {
								$(this).css({
									'box-shadow':'red 0px 0px 3px',
									'border': '0px rgba(0,0,0,1)',
									'border-style': 'outset',
									'background':'url("skins/sb-admin/images/validation_error.png") no-repeat 95% 50%',
									'-webkit-transition':'0s',
									'background-color':'white'
								});
							}});
					
					// password emptyness validation		
					$('input[name=password]').keyup(function(){
						if(!IsEmpty($(this).val())){
						if($(this).attr('class')!='valid'){
									$(this).attr('class','valid');
								}
							$(this).css({
									'box-shadow':'green 0px 0px 3px',
									'border': '0px rgba(0,0,0,1)',
									'border-style': 'outset',
									'background':'url("skins/sb-admin/images/validation_consense.png") no-repeat 95% 50%',
									'-webkit-transition':'0s',
									'background-color':'white'
								});
						} else {
							$(this).css({
									'box-shadow':'red 0px 0px 3px',
									'border': '0px rgba(0,0,0,1)',
									'border-style': 'outset',
									'background':'url("skins/sb-admin/images/validation_error.png") no-repeat 95% 50%',
									'-webkit-transition':'0s',
									'background-color':'white'
								});
						}
					});
					
					// password and repeat_password correspondence validation		
					$('input[name=repeat_password]').keyup(function(){
						if(IsPassword($('input[name=password]').val(),$(this).val()) && !IsEmpty($('input[name=password]').val())){
						if($(this).attr('class')!='valid'){
									$(this).attr('class','valid');
								}
							$(this).css({
									'box-shadow':'green 0px 0px 3px',
									'border': '0px rgba(0,0,0,1)',
									'border-style': 'outset',
									'background':'url("skins/sb-admin/images/validation_consense.png") no-repeat 95% 50%',
									'-webkit-transition':'0s',
									'background-color':'white'
								});	
							} else {
							$(this).css({
									'box-shadow':'red 0px 0px 3px',
									'border': '0px rgba(0,0,0,1)',
									'border-style': 'outset',
									'background':'url("skins/sb-admin/images/validation_error.png") no-repeat 95% 50%',
									'-webkit-transition':'0s',
									'background-color':'white'
								});
							}
					});	
					
					
					// form filling by geoComplete and street_number custom binding
					$("#geocomplete_small, #geocomplete_big").geocomplete({
						details: "form",
						detailsAttribute: "data-geo"
						}).bind("geocode:result", function(event, result){
							var arrAddress = result.address_components;
							$.each(arrAddress, function (i, address_component) {
									console.log('address_component:'+i);
									if (address_component.types[0] == "street_number"){
									$('input[name=address]').val($('input[name=address]').val()+' '+address_component.long_name);
									}
							});
						// force keyup event on input named country for validation	
						$('.main-login input').trigger('keyup');
							
						});
					
					// resizing window width on load and resize
					var small_a = 0;
					var small_b = 0;
					
					$('.main-login #geocontainer').css('display','none');
					
					$(window).bind('resize load', function () { 
						$('.main-login').first().find('input').first().focus();
						//grande a medio
						if($(window).width() <= 960 && !small_a){
							small_a=1; // medio
							$('#temp').remove();
							$('.guest-login').hide();
							var section = $('.main-login')
								.filter(function(){
									return $(this).parent().css('display') != 'none';
								})
								.first()
								.parent();
							var header = $('.main-login')
								.filter(function(){
									return $(this).parent().css('display') != 'none';
								})
								.first()
								.parent()
								.find('.guest-login')
								.find('h4')
								.html();					
							$(section)
							.prepend('<h4 id=\"temp\">'+header+'</h4>')
							.css({
								'margin-top':'-40px'
							});
							$('.guest-login #geocomplete_big').css('display','none');
							$('.main-login #geocontainer').css('display','block');
							$('.main-login #geocomplete_small').css({
								'margin-left':'150px',
								'margin-bottom':'20px',
								'margin-top':'-25px'
							});
							$('.main-login #geocontainer h5').css({
								'text-align':'center',
								'margin-left':'155px',
								'width':'276px'
							});
							$('.main-login').css({
								'width':'690px'
							});
						}	
						//medio a piccolo
						if($(window).width() <= 752 && !small_b){
							small_b=1; // PICCOLO
							$('.main-login').css({
								'width':'auto',
								'padding-left':'15px',
								'padding-right':'15px'
							});
							$('.main-login #geocontainer').css({
								'margin-left':'0px',
								'margin-right':'0px',
								'width':'auto'
							});
							$('.main-login #geocomplete_small').css({
								'width':'256px',
								'margin-left':'0px',
								'margin-right':'0px',
								'margin-bottom':'10px'
								
							});
							$('.main-login label').css({
								'margin-left':'0px',
								'text-align':'left'
							});
							$('input[name=later]').css({
								'margin-left':'40px'
							});
							$('input[name=newsletter]').css({
								'margin-left':'-150px'
							}); 
							$('.main-login #geocontainer h5').css({
								'text-align':'center',
								'margin-left':'0px'
								});
							$('.main-login .sign-in').css({
								'margin-right':'0px'								
							});
							
						}
						//medio a grande
						if($(window).width() > 960 && small_a){
							small_a=0;
							$('#temp').remove();
							// mostro informazioni sulla sinistra
							$('.guest-login').show();							
							$('.main-login').css({
								'width':'500px',
								'padding-right': '5px',
								'padding-left': '30px',
								'margin-right': '60px'
								});
							$('.main-login #geocontainer').css('display','none');
							$('.guest-login #geocomplete_big').css('display','block');	
							$('.main-login .sign-in').css({
								'margin-right':'70px'								
							});
							$('.main-login label').css({
								'width':'120px'								
							});
						}
						//piccolo torno medio
						if($(window).width() > 752 && small_b){
							small_b=0;
							//rimuovo header inserito
							
							$('.main-login').css({
								'width':'690px',
								'padding-left':'30px',
								'padding-right':'5px'
							});							
							$('.main-login label').css({
								'width':'120px'
							});
							$('.main-login .sign-in').css({
								'margin-right':'70px'
							});
							$('.main-login #geocomplete_small').css({
								'margin-left':'150px',
								'margin-bottom':'20px',
								'margin-top':'-25px',
								'-webkit-transition':'0s'
							});
							$('.main-login #geocontainer h5').css({
								'text-align':'center',
								'margin-left':'155px',
								'width':'276px'
							});

						}	
					});
					// dynamic step sections id setting 
					var value = 1;
					$('section section').each(function(){
						if (value != 1) {
						$(this).css('display', 'none');	
						}						
						$(this).attr('id', value.toString());
						value = value + 1;
					});
					
					// every button except the last are #next
					$('button').each(function(){
						var bool = $(this).closest('section').attr('id');
						if (bool != (value-1).toString()) {
							$(this).attr('id', 'next'); // ID
							$(this).prop('type', 'button'); // Button Type Button, Last Submit	
						} else {
							$(this).attr('id','submit'); // ID
							$(this).text('Submit');
						}
					});
				
					$('.sign-in #submit').click(function(){
						var index = $(this).closest('section').attr('id');
							var marked_index = '#'+index;
							var int_index = parseInt(index);
							var next_int_index = int_index + 1;
							var next_marked_index = '#'+next_int_index.toString(); 
							var valids = $(marked_index+' '+'.valid').length;
							console.log(valids);
							var mandatory = $(marked_index+' '+'.mandatory').length;
							console.log(mandatory);
							if( valids == mandatory ){
								return true;
							} else {
								return false;
							}
					});
					
					
					// every click on #next buttons slide to next step	
					$('.sign-in #next').click(
						function(){
							var index = $(this).closest('section').attr('id');
							var marked_index = '#'+index;
							var int_index = parseInt(index);
							var next_int_index = int_index + 1;
							var next_marked_index = '#'+next_int_index.toString(); 
							var valids = $(marked_index+' '+'.valid').length;
							console.log(valids);
							var mandatory = $(marked_index+' '+'.mandatory').length;
							console.log(mandatory);
							if( valids == mandatory ){
								$(next_marked_index).fadeIn('slow');
								$(next_marked_index).find('input').first().focus();
								$(marked_index).hide();
							}
							if(small_a){
								$('section #temp').remove();
								var header_next_marked = $(next_marked_index)
								.find('.guest-login')
								.first()
								.find('h4')
								.first()
								.html();
								$(next_marked_index).parent().find(next_marked_index).prepend('<h4 id="temp">'+header_next_marked+'</h4>');
								$(next_marked_index).css('margin-top','-40px');
							}
						});
						
					// show the jQuery UI datepicker, overlay menu if window bottom is small				
					$(function() {					
						$('#datepicker').datepicker({
							changeMonth: true,
							changeYear: true,
							yearRange: '1920:2013',
							dateFormat: 'dd-mm-yy',
							deafultDate: '15-02-1991', 
							beforeShow: function() {
								setTimeout(function(){
									$('.ui-datepicker').css({
										'z-index': '99999999999999'
										});
									}, 0);
								}
							});
						});
											
					// Billing Information Not Now
					$('input:checkbox[name=later]').change(function(){
						 
						 $(this).closest('section').find('input').each( function(){								
							
							if($(this).attr('name') != 'later'){
								
								if(!$(this).prop('disabled')){
									
									$(this).attr('disabled','disabled');			
									$(this).css({
										'background-color':'rgba(204,204,204,0.5)',
										'box-shadow':'none',
										'background-image':'none'
									});
									$(this).val('');
								} else {
									$(this).removeAttr('disabled');	
									$(this).css({
										'background-color':'white',
									});
									if( $(this).attr('name') == "country"){
										$(this).focus();
										$(this).css({
											'box-shadow':'red 0px 0px 3px',
											'border': '0px rgba(0,0,0,1)',
											'border-style': 'outset',
											'background':'url("skins/sb-admin/images/validation_error.png") no-repeat 95% 50%',
											'-webkit-transition':'0s',
											'background-color':'white'
										});
									}
								}		
							}
						});
					});
				});					
