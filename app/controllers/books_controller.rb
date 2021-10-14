class BooksController < ApplicationController
    def show
        @book = Book.find(params[:id])
    end
    
    def index
        @books = Book.all
        @book = Book.new
    end
    
    def create
        @book = Book.new(book_params)
        if @book.save
            flash[:notice] = "successfully"
            redirect_to book_path(@book)
        else
            @books = Book.all
            render 'index'
        end
    end
    
    def edit
        @book = Book.find(params[:id])
    end
    
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "successfully"
            redirect_to book_path(@book)
        else
            render 'edit'
        end
    end
    
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path, notice: "Book was succesfully delete."
    end
    
    private
    def book_params
        params.require(:book).permit(:title, :body)
    end
end
