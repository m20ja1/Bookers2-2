class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]


  def index
    @books = Book.includes(:favorites).sort_by { |x| x.favorites.size }.reverse
    @book = Book.new

    @books_count_by_day = (0..6).map do |n|
        Book.where(created_at: n.day.ago.all_day).count
      end.reverse

  end


  def show
    @book = Book.find(params[:id])
    @new_book = Book.new
    @book.update_column(:view_count, @book.view_count + 1)
  end


  def create
    @book = Book.new(book_params)
    @book.user_id = Current.user.id
    if @book.save
      redirect_to book_path(@book), notice: "You have created book successfully."
    else
      @books = Book.all
      render :index, status: :unprocessable_entity
    end
  end


  def edit
    @book = Book.find(params[:id])
  end


  def update
      @book = Book.find(params[:id])
    if @book.update(book_update_params)
      redirect_to book_path(@book.id), notice: "You have updated book successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end


  private
  
  def book_params
    params.require(:book).permit(:title, :body, :score)
  end

  def book_update_params
    params.require(:book).permit(:title, :body)
  end

  
  def is_matching_login_user
  book = Book.find(params[:id])
  unless book.user.id == Current.user.id
    redirect_to books_path
  end
  end




end
