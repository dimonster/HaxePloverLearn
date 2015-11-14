$(function() {
  $('#show-reference-panel').change(function(){
    $('#js-reference-panel').toggleClass("hide",!this.checked);
  });

  $.get('../reference-panel.html',function(data){
    var $referenceContent = $(data).find('#lesson5a-prefixes');
    console.log($referenceContent);
    $('#js-reference-panel').html($referenceContent);
  });

});

