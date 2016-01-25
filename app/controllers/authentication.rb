get '/login' do
  erb :login, :layout => false
end

post '/login' do
  user_params = params[:user]
  user = User.find_by(email: user_params[:email].downcase)
  if user && user.authenticate(user_params[:password])
    sign_in user
    flash[:success] = "Welcome! you sign in successfully"
    redirect '/'
  else
    flash[:error] = "Invalid email/password combination"
    redirect '/login'
  end
end

delete '/logout' do
  sign_out
  redirect '/login'
end
