class UsersController < ApplicationController

  allow_unauthenticated_access only: [:new, :create] 
 
  def new
    @user = User.new
  end
 
  def create
    @user = User.new(user_params)
    if @user.save
      #ユーザー新規登録が成功したら、Home画面へリダイレクトする
      redirect_to new_session_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books

  def edit
    @user = current_user
  end

  def updete
    @user = current_user
    if @user.update(user_params)
      redirect_to books_path, notice: 'プロフィール画像を更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end
 
  private
 
  def user_params
    params.require(:user).permit(:name, :email_address, :password, :password_confirmation, :image)
  end
end
