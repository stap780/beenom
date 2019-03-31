$(document).ready(function() {

	$('#images').sortable({
    axis: 'y',
    handle: '.sort-image',
    update: function() {
//       alert('updated!');
				$.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });

});
