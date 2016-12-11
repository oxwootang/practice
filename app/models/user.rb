require 'bcrypt'

class User < ActiveRecord::Base
  # Remember to create a migration!
  include BCrypt

  validates :full_name, presence: true
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :password, presence: true

  # users.password_hash in the database is a :string
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  # creating an account
  def create
  @user = User.new(params[:user])
  @user.password = params[:password]
  @user.save!
  end

  # authenticating a user
  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      give_token
    else
      redirect '/login'
    end
  end

end
