get '/sessions/new' do
  erb :'sessions/new'
end

post '/sessions' do
user = User.find_by(email: params[:email])
# binding.pry
  if user && user.authenticate(params[:password])
    status 200
    session[:user_id]=user.id
    redirect "/users/#{user.id}"
  else
      erb :'sessions/new'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end
