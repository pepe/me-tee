$(document).ready(function(){
  $(document).pngFix();	
  $("a[rel^='lightbox']").prettyPhoto({
    theme: 'dark_square', /* light_rounded / dark_rounded / light_square / dark_square */
    animationSpeed: 'fast',
    allowresize: 'true'
  });
  
  $('#startup').trigger('click');

  hideMessage();
  $(".hidden").css("display","block");
  $("#faces-carousel").jcarousel({
      visible: 5,
      buttonNextHTML: '<img class="next-arrow" src="/images/arrow_next.gif" alt="" />',
      buttonPrevHTML: '<img class="prev-arrow" src="/images/arrow_prev.gif" alt="" />'
  });
  $("#hobbies-carousel").jcarousel({
    visible: 5,
    buttonNextHTML: '<img class="next-arrow" src="/images/arrow_next.gif" />',
    buttonPrevHTML: '<img class="prev-arrow" src="/images/arrow_prev.gif" />'
  });
  $("#jobs-carousel").jcarousel({
    visible: 5,
    buttonNextHTML: '<img class="next-arrow" src="/images/arrow_next.gif" />',
    buttonPrevHTML: '<img class="prev-arrow" src="/images/arrow_prev.gif" />'
  });
    
  // initializing clicking on icons
  $("#hobbies-carousel-container a").click(function () {
    var newIcon = $(this).children(':first').clone();
    newIcon = resizeIcon(newIcon);
    $.get(this.href, function(data) {
      $("#hobbies-placeholder").children().replaceWith(newIcon);
    });
    return false});

  $("#faces-carousel-container a").click(function () {
    var newIcon = $(this).children(':first').clone();
    newIcon = resizeIcon(newIcon);
    $.get(this.href, function(data) {
      $("#faces-placeholder").children().replaceWith(newIcon);
    });
    return false});

  $("#jobs-carousel-container a").click(function () {
    var newIcon = $(this).children(':first').clone();
    newIcon = resizeIcon(newIcon);
    $.get(this.href, function(data) {
      $("#jobs-placeholder").children().replaceWith(newIcon);
    });
    return false});
    
  //initializing carousel switching
  $("#hobbies-placeholder").click(function(){
    switchCarousel("hobbies");
  });
  $("#faces-placeholder").click(function(){
    switchCarousel("faces");
  });
  $("#jobs-placeholder").click(function(){
    switchCarousel("jobs");
  });
  
  //initializing hover for order button
  $(".square-btn-submit").mouseover(function(){
    $(".square-btn-submit").addClass("square-btn-submit-hover");
  });

  $(".square-btn-submit").mouseout(function(){
    $(".square-btn-submit").removeClass("square-btn-submit-hover");
  });

  $("#size").change(function(){$.get('/' + this.value)});

  showDefault();
  validateRequired();
  
});	

//shows default carousel after page loading
function showDefault(){
  hideAll();
  $("#hobbies-carousel-container").fadeIn();
  $(".hobbies-carousel-arrow").fadeIn();
  $("#hobbies-carousel-title").fadeIn();
  
}

//hides all carousel parts
function hideAll(){
  $("#hobbies-carousel-container").hide();
  $(".hobbies-carousel-arrow").hide();
  $("#hobbies-carousel-title").hide();
  $("#faces-carousel-container").hide();
  $(".faces-carousel-arrow").hide();
  $("#faces-carousel-title").hide();
  $("#jobs-carousel-container").hide();
  $(".jobs-carousel-arrow").hide();
  $("#jobs-carousel-title").hide();  
}


//hides all others and displays selected carousel
function switchCarousel(name){
  hideAll();
  $("#"+name+"-carousel-container").fadeIn();
  $("."+name+"-carousel-arrow").fadeIn();
  $("#"+name+"-carousel-title").fadeIn();
}

function hideMessage() {
  setTimeout("jQuery('#message').slideUp()", 15000)
}

function resizeIcon(icon) {
  icon.attr('width', 89);
  icon.attr('height', 91);
  return icon;
}
