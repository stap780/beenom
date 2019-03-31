// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require autocomplete-rails
//= require bootstrap
//= require bootstrap-sprockets
//= require bootstrap/bootstrap-rails-tooltip
//= require bootstrap/bootstrap-rails-popover
//= require cocoon
//= require jquery-fileupload/basic
//= require jquery-fileupload/vendor/tmpl
//= require jquery.ui.touch-punch
//= require_tree .


$(document).ready(function(){

      $('.dropdown-toggle').dropdown();

			$('[data-toggle="popover"]').popover({
				container: 'body'
			});

			$(".alert" ).fadeOut(5000);

		$('#selectAll').click(function(){
		  if (this.checked){
		    $(':checkbox').each(function(){
		      this.checked = true;
		    });
		  } else {
		    $(':checkbox').each(function(){
		      this.checked = false;
		    });
		  }
		});



});


function pseudoDelete(obj){
	//console.log(obj);
		var target = "#itemimage_"+obj
		if (confirm('Вы точно хотите удалить')) {
			var url = "/itemimages/"+obj
			$(target).remove();
			$.ajax({
				dataType: "json",
				type: "DELETE",
				url: url
			})
		}

}
