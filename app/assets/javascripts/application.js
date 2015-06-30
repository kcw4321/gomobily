//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets

//= require_tree ./app


// Please do not put any code in here. Create a new .js file in
// app/assets/javascripts/app instead, and put your code there
$(function() {
  $('.star_rating').click(function() {
    var star = $(this);
    var form_id = $(this).attr('data-form-id');
    var stars = $(this).attr('data-stars');
    var location_id = form_id.slice(0, form_id.indexOf("_"))

    for(i=1; i<=5; i++){
      if(i <= stars){
        $('#' + location_id + '_rating_' + i).addClass('on');
      } else {
        $('#' + location_id + '_rating_' + i).removeClass('on');
      }
    }

    $('#' + location_id + '_rating_stars').val(stars)


  });
});
