$(document).ready(function() {


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
      $('.pseudoDelete').click(function() {
        if (confirm('Вы точно хотите удалить')) {
          var imageId = $(this).closest( "li" ).attr('id').replace("itemimage_", "");
          var url = "/itemimages/"+imageId
          $(this).closest( "li" ).remove();
          $.ajax({
            type: "DELETE",
            url: url
          })
        }
      });

   }
 });



// if(window.location.href.indexOf("edit") > -1) {
//   console.log('edit');
//   $('#new_itemimage').change(function(event) {
//       var files = event.target.files;
//       console.log(files);
//       for (var i = 0, f; f = files[i]; i++) {
//         var image = files[i];
//         // here's the file size
//         //console.log(image.size);
//         var reader = new FileReader();
//         reader.onload = function(file) {
//           var img = new Image();
//           //console.log(file);
//           img.src = file.target.result;
//           console.log(img.src);
//           var html = "<li class='itemimage'><span class='sort-image ui-sortable-handle'><a href='' target='_blank'>"+img.outerHTML+"</a><div class='actions'><a confirm=''Точно удалить?'' rel='nofollow' data-method='delete' href=''><i class='fa fa-trash fa-2x' aria-hidden='true'></i></a></div></span></li>";
//           //console.log(html);
//           $('#images').append(html);
//         }
//         reader.readAsDataURL(image);
//         //console.log(files);
//       }
//
//     });
//
// } else {
//     console.log('no edit');
//    $('#new_itemimage').fileupload({
//     dataType: 'script',
//     add: function(e, data) {
// 	    //console.log('upload');
//       var file, types;
//       types = /(\.|\/)(gif|jpe?g|png|mov|mpeg|mpeg4|avi)$/i;
//       file = data.files[0];
//       if (types.test(file.type) || types.test(file.name)) {
//         data.context = $(tmpl("template-upload", file));
//         //console.log(data.context);
//         $('#new_itemimage').append(data.context);
//         data.submit();
//       } else {
//         alert(file.name + " is not a gif, jpg or png image file");
//       }
//     },
//     progress: function(e, data) {
//       var progress;
//       if (data.context) {
//         progress = parseInt(data.loaded / data.total * 100, 10);
//         data.context.find('.bar').css('width', progress + '%');
//       }
//     },
//     done: function (e, data) {
//        $('.upload').css('display','none');
//     }
//   });
// }



});
