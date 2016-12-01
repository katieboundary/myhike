
get '/sessions/new' do
  erb :'sessions/new'
end


post '/sessions' do
  user = User.authenticate(params)
  if user
    session['user_id'] = user.id
    redirect "/users/#{user.id}"
  else
    @error = "Login Failed"
    erb :'/sessions/new'
  end
end

delete '/sessions/:id' do
  session['user_id'] = nil
  redirect '/'
end

# @errors = @user.errors.full_messages
#     erb :'/users/new'
