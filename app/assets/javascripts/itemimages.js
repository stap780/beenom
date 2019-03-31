$(document).ready(function() {
  function tool_tip() {
     $('[data-toggle="tooltip"]').tooltip();
  }
  function pop_over() {
     $('[data-toggle="popover"]').popover();
  }


  $('#new_itemimage').fileupload({
   dataType: 'script',
   add: function(e, data) {
     //console.log('upload');
     var file, types;
     types = /(\.|\/)(gif|jpe?g|png|mov|mpeg|mpeg4|avi)$/i;
     file = data.files[0];
     if (types.test(file.type) || types.test(file.name)) {
       data.context = $(tmpl("template-upload", file));
       //console.log(data.context);
       $('#new_itemimage').append(data.context);
       data.submit();
     } else {
       alert(file.name + " is not a gif, jpg or png image file");
     }
   },
   progress: function(e, data) {
     var progress;
     if (data.context) {
       progress = parseInt(data.loaded / data.total * 100, 10);
       data.context.find('.bar').css('width', progress + '%');
     }
   },
   done: function (e, data) {
      $('.upload').css('display','none');
      tool_tip();  // Call function again for AJAX loaded content
      pop_over();

   }

 });




});
