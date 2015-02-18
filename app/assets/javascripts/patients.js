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

$(document).ready(function(){
  $('ul.patient_list > li').hide();
  $('li.section_1').show();
$("ul.link_list > li > a").click(function() {
  $("ul.patient_list > li").hide()
  var patient_list = $(this).attr("number")
  $("li.section_" + patient_list).show()
})
})

$(document).on('click', '.patientsearch-button', function(){
  hospital_id = $(".hospital-id").val()
  var search = $(".patient-search").val()
  $.ajax({
    type: 'GET',
    url: '/hospitals/' + hospital_id + '/patients/search_results',
    dataType: 'script',
    data: {q: search}
  })
});

$(document).on('click', '.checkup-patient', function(){
  hospital_id = $("#hospital_id").val()
  patient_id = $("#patient_id").val()
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/checkup_patient'
  })
});

$(document).on('click', '.xray-patient', function(){
  hospital_id = $("#hospital_id").val()
  patient_id = $("#patient_id").val()
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/xray_patient'
  })
});

$(document).on('click', '.surgery-patient', function(){
  hospital_id = $("#hospital_id").val()
  patient_id = $("#patient_id").val()
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/surgery_patient'
  })
});

$(document).on('click', '.discharge-patient', function(){
  hospital_id = $("#hospital_id").val()
  patient_id = $("#patient_id").val()
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/discharge_patient'
  })
});

$(document).on('click', '.waitingroom-patient', function(){
  hospital_id = $("#hospital_id").val()
  patient_id = $("#patient_id").val()
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/waiting_room_patient'
  })
});

$(document).on('click', '.billpay-patient', function(){
  hospital_id = $("#hospital_id").val()
  patient_id = $("#patient_id").val()
  $.ajax({
    type: 'PATCH',
    url: '/hospitals/' + hospital_id + '/patients/' + patient_id + '/bill_pay_patient'
  })
});


