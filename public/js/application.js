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

      var text = "<div class='comment_container'>\
          <p class='comment'>"+response["comment_text"]+"</p>\
          <p class='username'>-"+response["user_name"]+"</p>\
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
          "+response["points"]+ " POINTS" + response["comment_text"] + "\
           " + response["user_name"]+"\
      </div>"
      temp.siblings('div.comments2').append(text);
      temp.siblings('button').removeClass('hidden');
      temp.addClass('hidden');
      temp.trigger('reset');
    })
    .fail(function(response){

    });

  });

  $(document).on('submit', ".answer_form", function(event){

    var temp = $(this)
    data = $(this).serialize();
    url = $(this).attr("action");
    event.preventDefault();

    $.ajax({
          url: url,
          method: "post",
          data: data
    }).done(function(response){
      // debugger;
      var text = "<div class=\"answers\" id=\"answer"+response["answer_id"]+"\">\
        "+response["points"]+" POINTS\
        "+response["text"] +"\
        Answer By: "+response["username"]+"\
        <button id=\"answer_comment\">Add Comment</button>\
        <form class=\'hidden submitform2\' method = \'post\' action=\'/questions/"+response["question_id"]+"/answers/"+response["answer_id"]+"/comments'>\
          <textarea name=\'text\' rows=5 cols=20> </textarea>\
          <input type=\'submit\' value=\"ANSWER COMMENT SUBMIT BUTT\">\
        </form>\
        <div class=\'comments2\'>\
      </div>\
      </div>";
      temp.parent().siblings('div.answerwrapper').append(text);
      temp.trigger('reset');
    })
    .fail(function(response){

    });

  });


});
