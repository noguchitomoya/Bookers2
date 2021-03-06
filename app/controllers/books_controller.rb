class BooksController < ApplicationController
    before_action :authenticate_user!, only: [:new,:create,:index,:show,:edit,:update,:destroy]
    before_action :correct_user,   only: [:edit, :update]


    def new
        @book = Book.new
    end
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id

        if @book.save
            redirect_to book_path(@book), notice: "Book was successfully created."
        else
            @books=Book.all
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
    
    def top
    end

    def about
    end
      
    
    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
          redirect_to book_path(@book.id), notice: "Book was successfully updated."
        else 
          render :edit
        end 
    end

    def destroy
        @book = Book.find(params[:id])
        @book.destroy
        redirect_to books_path
    end
    

    private
    def book_params
        params.require(:book).permit(:title, :body)
    end

    def correct_user
  
        book = Book.find(params[:id])

           redirect_to books_path unless current_user.id ==book.user.id

    end
end
