get '/users' do
  @users = User.all #define instance variable users for view to use

  erb :'users/index.html' # show links for creating a user and signing in a returning user
end

# return an HTML form for creating a new user
get '/users/new' do
  erb :'users/new.html' #show new users view
end

post '/users' do
  @user = User.new(params[:user]) #create new user
  if @user.save #saves new user or returns false if unsuccessful
    redirect "/users/#{@user.id}" #redirect back to users index page
  else
    erb :'users/new.html' # show new users view again(potentially displaying errors)
  end
end

get '/users/:id' do
  #gets params from url
  @user = User.find(params[:id]) #define instance variable for view
  erb :'users/show.html' #show single user view
end

# return an HTML form for editing a user
get '/users/:id/edit' do
  #get params from url
  @user = User.find(params[:id]) #define intstance variable for view
  erb :'users/edit.html' #show edit user view
end
