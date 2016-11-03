$(document).ready(function() {
  $(document).on('click', "#question_comment", function(event){
  event.preventDefault();
  $(this).siblings('form').removeClass('hidden');
  $(this).addClass('hidden');
  });

    $(document).on('click', "#answer_comment", function(event){
    event.preventDefault();
    $(this).siblings('form').removeClass('hidden');
    $(this).addClass('hidden');
    });

  $(document).on('submit', ".submitform", function(event){

    var temp = $(this)
    data = $(this).serialize();
    url = $(this).attr("action");
    event.preventDefault();

    $.ajax({
          url: url,
          method: "post",
          data: data
    }).done(function(response){

      var text = "<div>\
          AMAZING COMMENT: "+response["comment_text"]+"<br>\
          COMMENT BY: "+response["user_name"]+"\
      </div>"
      temp.siblings('div.comments').append(text);
      temp.siblings('button').removeClass('hidden');
      temp.addClass('hidden');
      temp.trigger('reset');
    })
    .fail(function(response){

    });

  });
  $(document).on('submit', ".submitform2", function(event){

    var temp = $(this)
    data = $(this).serialize();
    url = $(this).attr("action");
    event.preventDefault();

    $.ajax({
          url: url,
          method: "post",
          data: data
    }).done(function(response){

      var text = "<div>\
          AMAZING COMMENT: "+response["comment_text"]+"<br>\
          COMMENT BY: "+response["user_name"]+"\
      </div>"
      temp.siblings('div.comments2').append(text);
      temp.siblings('button').removeClass('hidden');
      temp.addClass('hidden');
      temp.trigger('reset');
    })
    .fail(function(response){

    });

  });

});
