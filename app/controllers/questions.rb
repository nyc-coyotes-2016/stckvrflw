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
