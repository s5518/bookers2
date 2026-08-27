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

end
