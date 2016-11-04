get '/' do
  @questions = Question.all
  erb :'questions/index'

end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

post '/questions/:id/comments' do

  curr_question = Question.find(params[:id])
  new_comment = Comment.new(user: current_user, text: params["text"], commentable: curr_question)
  if request.xhr?
    if new_comment.save
      status 200
      content_type :json
      {comment_text: new_comment.text, user_name: new_comment.user.username}.to_json
    else
      status 410
    end
  end
end

post '/questions/:id/answers/:answer_id/comments' do

  curr_ans= Answer.find(params[:answer_id])
  new_comment = Comment.new(user: current_user, text: params["text"], commentable: curr_ans)
  if request.xhr?
    if new_comment.save
      status 200
      content_type :json
      {points: new_comment.votes.pluck(:vote_direction).sum, comment_text: new_comment.text, user_name: new_comment.user.username}.to_json
    else
      status 410
    end
  end
end

post '/questions/:id/answer' do
  curr_question = Question.find(params[:id])
  new_answer = Answer.new(text: params["text"], question: curr_question, user: current_user)
  if request.xhr?
    if new_answer.save
      status 200
      content_type :json
      {points: new_answer.votes.pluck(:vote_direction).sum, answer_id: new_answer.id, text: new_answer.text, question_id: curr_question.id,  username: new_answer.user.username}.to_json
    else
      status 999
    end
  end
end
