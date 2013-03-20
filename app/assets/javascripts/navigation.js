jQuery(function($){
  var found = false
  $('ul.nav li').each(function(idx){
    var a = $(this).find('a');
    if(window.location.href == a.prop('href')){
      $(this).addClass('active');
      found = true;
    }else if(! found && window.location.href.match(a.prop('href'))){
      $(this).addClass('active');
    }
  });
  if(!found && window.location.pathname == '/') $('ul.nav.main li:first-child').addClass('active');
});
