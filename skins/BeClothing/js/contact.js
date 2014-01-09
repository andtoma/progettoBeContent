$(document).ready(function() {

	$('#contact_form').on('submit', function(e) {

		e.preventDefault();

		$.ajax({
			url : "send_message.php",
			type : "post",
			data : $('#contact_form').serialize(),
			success : function(responce) {
				$(".mymodal_title").html("Success");
				$(".text-modal").html("<i class='icon-exclamation-sign'></i>&nbsp;Message has been successfully sent");
				$("#mymodal").modal("show");
				$('#contact_form').trigger('reset');
			}
		});
	});
});
