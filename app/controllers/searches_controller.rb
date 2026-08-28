class SearchesController < ApplicationController

  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
  
    if @model  == "user"
      @records = User.search_for(@content, @method)
      @users = @records
    else
      @records = Book.search_for(@content, @method)
      @books = @records
    end
  end

  def search_tag
    @book = Book.new
    @user = Current.user
    
    if params[:category].present?
      @books = Book.where(category: params[:category])
      @word = params[:category]
    elsif params[:search_category].present? 
      @books = Book.where("category LIKE ?", "%#{params[:search_category]}%") 
      @word = params[:search_category] 
    else
      @books = Book.allend 
    end
  end
end
