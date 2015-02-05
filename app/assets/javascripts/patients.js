$(document).ready( function() {

  $(".testname").fadeOut(5000);
  $( ".first-name, .last-name, .description" ).blur(function() {
    if( $(".first-name").val() != "" && $(".last-name").val() != "" && 
      $(".description").val() != "") {
        console.log("Remove disabled");
        $(".submit-stuff").removeClass('disabled');
    }
  });
});






