var user = {
	init:function(){
		user.registerEvents();
	},
	registerEvents: function () {
		$('.block').off('click').on('click', function (e) {
			e.preventDefault();
			var btn = $(this);
			var id = btn.data('id');
			$.ajax({
				url: "ChangeStatusUser?id=" + id,
				data: { id: id },
				dataType: "json",
				type: "post",
				success: function (response) {
					
					if(response== false){
						btn.text("Click mở");
						btn.removeClass("btn-success");
						btn.addClass("btn-danger")
						
					}else{
						btn.text("Click khóa");
						btn.removeClass("btn-danger")
						btn.addClass("btn-success");
					}											
				}
			});

		});
	}
}
user.init();

