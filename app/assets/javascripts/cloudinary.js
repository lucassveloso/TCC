var CLOUDINARY = CLOUDINARY || {}

CLOUDINARY.imageDefault = "http://res.cloudinary.com/dhvbjsqh6/image/upload/v1466149536/avatar_person.png";

CLOUDINARY.setUploadWidget = function setUploadWidget(){
  $("#btn-delete-image").hide();
  $("#btn-delete-image").on("click",CLOUDINARY.deleteCurrentImage);
  CLOUDINARY.setImageDefault();
  if($('#upload_widget_opener').length){
    $('#upload_widget_opener').cloudinary_upload_widget({
      cloud_name: 'dhvbjsqh6',
      upload_preset: 'a3xist58',
      multiple: false,
      cropping: 'server',
      cropping_aspect_ratio: 1,
      folder: 'person_photos',
      client_allowed_formats: ['png','jpg','jpeg'],
      button_class: 'btn btn-primary btn-upload-image',
      button_caption: 'Enviar Imagem',
      theme: 'white',
      text:{
        "sources.local.title": "Meus Arquivos",
        "sources.local.drop_file": "Arraste o arquivo aqui",
        "sources.local.drop_or": "Ou",
        "sources.local.select_file": "Selecione",
        "sources.url.title": "Endereço Web",
        "sources.url.note": "URL pública de imagem:",
        "sources.url.upload": "Enviar",
        "sources.url.error": "Por favor, informe uma URL válida.",
        "sources.camera.title": "Câmera",
        "sources.camera.note": "Tenha certeza que seu navegador permite o uso da câmera:",
        "sources.camera.capture": "Capturar",
        "progress.uploading": "Enviando...",
        "progress.upload_cropped": "Enviar",
        "progress.processing": "Processando...",
        "progress.retry_upload": "Tente novamente",
        "progress.use_succeeded": "OK",
        "progress.failed_note": "Algumas imagens falharam no envio."
      }
      },function(error, result){
          var publicId = result[0].public_id;
          var imageUrl = result[0].url;

          var imageSize = "/c_fit,w_200/";

          var urlPart1 = imageUrl.slice(0,48);
          var urlPart2 = imageUrl.slice(49,imageUrl.length);

          var imageUrlFinal = urlPart1.concat(imageSize).concat(urlPart2);

          $( ".cloudinary-thumbnails" ).hide();
          $( "#img_photo_person" ).replaceWith("<img src='"+ imageUrlFinal+ "' id='img_photo_person' class='img-responsive img-thumbnail'/>" );

          $("#photo_url").val(imageUrlFinal);

          $(".btn-upload-image").hide();
          $("#btn-delete-image").show();
      }
    );
  }
}

CLOUDINARY.setImageDefault = function setImageDefault(){
  if($("#img_photo_person").attr('src')==""){
    $("#img_photo_person").replaceWith("<img src='"+ CLOUDINARY.imageDefault + "' id='img_photo_person' class='img-responsive img-thumbnail'/>");
    $("#photo_url").val(CLOUDINARY.imageDefault);
  }
}

CLOUDINARY.deleteCurrentImage = function deleteCurrentImage(){
  $("#img_photo_person").replaceWith("<img src='"+ CLOUDINARY.imageDefault + "' id='img_photo_person' class='img-responsive img-thumbnail'/>");
  $("#photo_url").val(CLOUDINARY.imageDefault);
  $( ".cloudinary-delete" ).trigger( "click" );
  $(".btn-upload-image").show();
  $("#btn-delete-image").hide();
}