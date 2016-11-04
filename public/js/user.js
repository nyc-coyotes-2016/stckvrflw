$(document).ready(function(){

$("#ask_question").on("click", ".add-question", function(event){

event.preventDefault();
$(this).hide();
  $.ajax({
    type: "GET",
    url: "/questions/new"}).done(function(response){
    $("#ask_question").append(response);
  });

});


});
