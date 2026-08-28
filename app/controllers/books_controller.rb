class BooksController < ApplicationController
  before_action :is_matching_login_user, only: [:edit, :update]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = Current.user.id
    if @book.save
      flash[:notice] = "You have created book successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = Current.user
      render "users/show", status: :unprocessable_entity
    end
  end

  def index
    @books = Book.all
    @user = Current.user
    @book = Book.new

    if params[:latest]
      @books = Book.all.order(created_at: :desc)
    elsif params[:star_count]
      @books = Book.all.order(star: :desc)
    else
      @books = Book.all
    end
  end

  def show
    @book_detail = Book.find(params[:id])
    @book = @book_detail
    @user = @book_detail.user
    @book = Book.new
    @post_comment = PostComment.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully"
      redirect_to book_path(@book.id)
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
    params.require(:book).permit(:title, :body, :star)
  end

  def is_matching_login_user
    @book_detail = Book.find(params[:id])
    unless @book_detail.user.id == Current.user.id
      redirect_to books_path
    end
  end

end
