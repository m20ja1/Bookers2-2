class BookCommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = Current.user.book_comments.new(book_comment_params)
    comment.book_id = book.id
    comment.save
    redirect_back(fallback_location: books_path)
  end

  def show
    @book = Book.find(params[:id])
    @book = Book.new
  end

  def destroy
    comment = Current.user.book_comments.find(params[:id])
    comment.destroy
    redirect_back(fallback_location: books_path)
  end


  private

  def book_comment_params
    params.require(:book_comment).permit(:comment)
  end
end
