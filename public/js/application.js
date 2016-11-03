$(document).ready(function() {
  $(document).on('click', "#question_comment", function(event){
  event.preventDefault();
  $(this).siblings('form').removeClass('hidden');
  $(this).addClass('hidden');
  });

  $(document).on('submit', ".submitform", function(event){
    data = $(this).serialize();
    url = $(this).attr("action");
    event.preventDefault();

    $.ajax({
          url: url,
          method: "post",
          data: data
    }).done(function(response){
      debugger
    })
    .fail(function(response){

    });

  });

});
