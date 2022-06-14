class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
    if @book.save
      flash[:success] = "Create is successfully"
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success] = "Edit is successfully"
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  def destroy
    p params["id"]
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end
end
