class BooksController < ApplicationController
  def index
    @q = Book.ransack(params[:q])
    @books = @q.result(:distinct => true).includes(:course_materials, :authorships).page(params[:page]).per(10)

    render("books/index.html.erb")
  end

  def show
    @authorship = Authorship.new
    @course_material = CourseMaterial.new
    @book = Book.find(params[:id])

    render("books/show.html.erb")
  end

  def new
    @book = Book.new

    render("books/new.html.erb")
  end

  def create
    @book = Book.new

    @book.name = params[:name]
    @book.edition = params[:edition]

    save_status = @book.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/books/new", "/create_book"
        redirect_to("/books")
      else
        redirect_back(:fallback_location => "/", :notice => "Book created successfully.")
      end
    else
      render("books/new.html.erb")
    end
  end

  def edit
    @book = Book.find(params[:id])

    render("books/edit.html.erb")
  end

  def update
    @book = Book.find(params[:id])

    @book.name = params[:name]
    @book.edition = params[:edition]

    save_status = @book.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/books/#{@book.id}/edit", "/update_book"
        redirect_to("/books/#{@book.id}", :notice => "Book updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Book updated successfully.")
      end
    else
      render("books/edit.html.erb")
    end
  end

  def destroy
    @book = Book.find(params[:id])

    @book.destroy

    if URI(request.referer).path == "/books/#{@book.id}"
      redirect_to("/", :notice => "Book deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Book deleted.")
    end
  end
end
