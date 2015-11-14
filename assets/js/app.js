$(function() {
  $.get('../reference-panel.html',function(data){
    var path = location.pathname.toLowerCase().split('/');
    var lessonid = path[path.length-2];  // eg "lesson5a-prefixes"

    if (lessonid) {
      var $referenceContent = $(data).find('#'+lessonid).children();

      if ($referenceContent.length > 0) {
        // fill content
        $('#js-reference-panel-content').html($referenceContent);

        // show reference panel
        $('#js-reference-panel').removeClass('hide');
      }
    }
  });

  // show reference panel checkbox
  $('#show-reference-panel-content').change(function(){
    $('#js-reference-panel-content').toggleClass('hide',!this.checked);
  });
});
