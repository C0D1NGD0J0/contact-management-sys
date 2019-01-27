$(document).on('turbolinks:load', function(){
	$("#add-new-group").hide();
	$("#add-group-btn").click(function(){
		$("#add-new-group").slideToggle(function(){
			$("#new_group").focus();
		});
		return false;
	});

	$("#save-group-btn").click(function(e){
		e.preventDefault();
		const newGroup = $("#new_group");
		const inputGroup = newGroup.closest('.input-group');

		$.ajax({
			url: '/groups',
			method: "post",
			data: { group: { name: $("#new_group").val() } },
			success: function(group){
				if(group.id != null){
					inputGroup.removeClass('has-error');
					inputGroup.next('.text-danger').remove();
					
					let newOption = $('<option />').attr('value', group.id).attr('selected', true).text(group.name);
					$('#contact_group_id').append(newOption);
					newGroup.val("");
				};
			},
			error: function(xhr){
				const errors = xhr.responseJSON;
				const error = errors.join(", ");
				if(error){
					
					inputGroup.next('.text-danger').detach();
					inputGroup.addClass('has-error').after(`<p class="text-danger">${error}</p>`);
				}
			}
		});
	});
});