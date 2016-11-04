$(document).ready(function() {

    $(document).on('submit', ".vote", function(event){
      event.preventDefault();
      var params = $(this).serializeArray();
      var url = '';
      var data = {};
      for (var i =0; i<params.length; i ++){
        url += '/' + params[i].name + '/' + params[i].value
      }
      url += "/votes"
      if ($(this).hasClass('upvote')){data["vote_direction"] = 1;}
      else{data["vote_direction"] = -1;}

      var current = $(this);
      $.ajax({
            url: url,
            method: "post",
            data: data
          }).done(function(response){
            current.siblings('div.current_votes').text(response["points"]);

          });
    });

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

      temp.siblings('div.comments').append(response);
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


      temp.siblings('div.comments2').append(response);
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
    debugger
    $.ajax({
          url: url,
          method: "post",
          data: data
    }).done(function(response){
      // debugger;

      temp.parent().siblings('div.answerwrapper').append(response);
      temp.trigger('reset');
    })
    .fail(function(response){

    });

  });


});
