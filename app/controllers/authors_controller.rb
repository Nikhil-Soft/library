class AuthorsController < ApplicationController
  
  def index
    @authors = Author.all
  end

  def new
    @author = Author.new  
  end
  def create
    @author = Author.new(authors_params)
    if @author.save
      redirect_to @author
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @author = Author.find(params[:id])
    @book = @author.books
  end

  private

  def authors_params
    params.require(:author).permit(:name, :phone_number , :bio )
  end

end
