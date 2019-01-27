$(function(){
	$("#add-new-group").hide();
	$("#add-group-btn").click(function(){
		$("#add-new-group").slideToggle(function(){
			$("#new_group").focus();
		});
		return false;
	});

	$("#save-group-btn").click(function(e){
		e.preventDefault();
		let newGroup = $("#new_group");
		
		$.ajax({
			url: '/groups',
			method: "post",
			data: { group: { name: $("#new_group").val() } },
			success: function(res){
				console.log(res);
			},
			error: function(xhr){
				const errors = xhr.responseJSON;
				const error = errors.join(", ");
				if(error){
					newGroup.closest('.input-group').addClass('has-error').after(`<p class="text-danger">${error}</p>`);
				}
			}
		});
	});
});