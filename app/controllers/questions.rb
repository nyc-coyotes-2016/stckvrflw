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
  comment = Comment.new(user: current_user, text: params["text"], commentable: curr_question)
  if request.xhr?
    if comment.save
      status 200
      # binding.pry
      erb :'_partials/_comment_partial', layout: false, locals: { comment: comment, question: curr_question, answer: nil }
    else
      status 410
    end
  end
end

post '/questions/:id/answers/:answer_id/comments' do
  curr_question = Question.find(params[:id])

  curr_ans= Answer.find(params[:answer_id])
  comment = Comment.new(user: current_user, text: params["text"], commentable: curr_ans)
  if request.xhr?
    if comment.save
      status 200
      erb :'_partials/_comment_partial', layout: false, locals: { comment: comment, question: curr_question, answer: curr_ans }
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
      erb :'_partials/_answer_partial' , layout: false, locals: { answer: new_answer, question: curr_question }
    else
      status 999
    end
  end
end
