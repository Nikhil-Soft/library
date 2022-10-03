class BooksController < ApplicationController
  
  def index
    @books = Book.all
  end

  def new
    @author = Author.find_by(id: params[:author_id])
    @book = @author.books.build   
  end

  def create
    @author = Author.find_by(id: params[:author_id])
    @book = @author.books.build(books_params)
    if @book.save
      redirect_to author_books_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @book = Book.find(params[:id])
  end


  private

  def books_params
    params.require(:book).permit(:name, :decription , :price )
  end

end