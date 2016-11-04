get '/questions/new' do
  require_login
  if request.xhr?
    erb :'_partials/_new_question', layout: false
  else
  erb :'questions/new'
  end
end

post '/questions' do
    require_login
    question = Question.new(params[:question])
    question[:user_id]=current_user.id
    if question.save
      redirect '/'
    else
      @errors=question.errors.full_messages
      erb :'questions/new'
    end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  erb :'questions/show'
end

get '/questions/:id/edit' do
  require_login
  @question = Question.find_by(id: params[:id])
  erb :'questions/edit'
end

put '/questions/:id' do
    require_login
    # binding.pry
    @question = Question.find_by(id: params[:id])
    @question[:user_id]=current_user.id
    if @question.update(params[:question])
      redirect '/users/:id'
    else
      @errors=question.errors.full_messages
      erb :'questions/edit'
    end
end

delete '/questions/:id' do
  require_login
  @question = Question.find_by(id: params[:id])
  @question.destroy
  redirect '/users/:id'
end

# get '/questions/best/:id' do
#     require_login
#     @question = Question.find_by(id: params[:id])
#     @answer = Answer.find_by(id: params[:id])
#     if owner?
#     @answer.best = true
#     redirect "/questions/#{params[:id]}"
#   end
# end


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
