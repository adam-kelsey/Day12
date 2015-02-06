$(document).ready(function(){
  $('ul.patient_list > li').hide();
  $('li.section_1').show();

$("ul.link_list > li > a").click(function() {
  $("ul.patient_list > li").hide()
  var patient_list = $(this).attr("med_num")
  $("li.section_" + patient_list).show()
})
})