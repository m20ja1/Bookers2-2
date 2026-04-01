class UsersController < ApplicationController
before_action :is_matching_login_user, only: [ :edit, :update ]
allow_unauthenticated_access only: [ :new, :create ]

  def index
    @users = User.all
    @book = Book.new
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      start_new_session_for @user
      redirect_to user_path(@user), notice: "Welcome! You have signed up successfully."
    else
    render :new, status: :unprocessable_entity
    end
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new

    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: "You have updated user successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def followings
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:id])
    @users = user.followers
  end

  def search
  @user = User.find(params[:id])
  @books = @user.books
  if params[:created_at].present?
    @search_book = @books.where(created_at: params[:created_at].to_date.all_day)
  else
    @search_book = @books.none
  end

  # Turbo Streamで結果エリアのみを書き換え
  render turbo_stream: turbo_stream.replace("search_result", partial: "users/search_result", locals: { search_book: @search_book })
end


 private
 def user_params
params.require(:user).permit(:name, :introduction, :profile_image, :email_address, :password, :password_confirmation)
 end
end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == Current.user.id
      redirect_to user_path(Current.user)
    end
  end
