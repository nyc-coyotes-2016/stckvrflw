
get '/questions/new' do
  require_login
  erb :'questions/new'
end

post '/questions' do
    require_login

    question = Question.new(params[:question])
    question[:user_id]=current_user.id
    if question.save
      status 200
      redirect '/'
    else
      @errors=question.errors.full_messages
      erb :'questions/new'
    end
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
      status 200
      redirect '/users/:id'
    else
      @errors=question.errors.full_messages
      erb :'questions/edit'
    end
end
