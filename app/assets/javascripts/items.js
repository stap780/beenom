$(document).ready(function() {

	$('#images').sortable({
    axis: 'x',
    handle: '.sort-image',
    update: function() {
//       alert('updated!');
				$.post($(this).data('update-url'), $(this).sortable('serialize'));
    }
  });

});
