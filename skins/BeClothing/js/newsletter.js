$(document).ready(function() {

	$('#newsletter_form').on('submit', function(e) {
		e.preventDefault();
		$.ajax({
			url : "newsletter-subscribe.php",
			type : "post",
			data : $('#newsletter_form').serialize()+"&ok=2",
			success : function(responce) {
				if (responce == "OK") {
					$(".title").html("Success");
					$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;Thanks for subscribing to our newsletter.");
					$("#mymodal").modal("show");
					$('#newsletter_form').trigger('reset');
				} else {
					$(".title").html("Error");
					$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;You already registered!");
					$("#mymodal").modal("show");
					$('#newsletter_form').trigger('reset');
				}
			}
		});
	});
});
