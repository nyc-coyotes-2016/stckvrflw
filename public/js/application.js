$(document).ready(function() {
  $(document).on('click', "#question_comment", function(event){
  event.preventDefault();
  $(this).siblings('form').removeClass('hidden');
  $(this).addClass('hidden');
});

});



// $.ajax({
//       url: "/questions/id/comments/new",
//       method: "post"
//     })
