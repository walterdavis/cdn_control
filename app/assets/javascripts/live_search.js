jQuery(function($){
  if($('#q')){
    var last = '';
    var libs = $('.lib');
    $('#q').on('keyup', function(evt){
      var found = $(this).val().toLowerCase();
      if(found != last){
        last = found;
        libs.each(function(idx, elm){
          if($(elm).attr('data-keyword').toLowerCase().match(last)){
            $(elm).show();
          }else{
            $(elm).hide();
          }
        });
      }
      if(found.length){
        $('#clear').show();
      }else{
        $('#clear').hide();
      }
    });
    $('#clear').on('click',function(evt){
      evt.preventDefault();
      $('#q').val('');
      $(this).hide();
      libs.show();
    });
    $('#clear').hide();
  }
});
