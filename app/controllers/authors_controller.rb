class AuthorsController < ApplicationController
  def index
    @q = Author.ransack(params[:q])
    @authors = @q.result(:distinct => true).includes(:authorships).page(params[:page]).per(10)

    render("authors/index.html.erb")
  end

  def show
    @authorship = Authorship.new
    @author = Author.find(params[:id])

    render("authors/show.html.erb")
  end

  def new
    @author = Author.new

    render("authors/new.html.erb")
  end

  def create
    @author = Author.new

    @author.name = params[:name]

    save_status = @author.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/authors/new", "/create_author"
        redirect_to("/authors")
      else
        redirect_back(:fallback_location => "/", :notice => "Author created successfully.")
      end
    else
      render("authors/new.html.erb")
    end
  end

  def edit
    @author = Author.find(params[:id])

    render("authors/edit.html.erb")
  end

  def update
    @author = Author.find(params[:id])

    @author.name = params[:name]

    save_status = @author.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/authors/#{@author.id}/edit", "/update_author"
        redirect_to("/authors/#{@author.id}", :notice => "Author updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Author updated successfully.")
      end
    else
      render("authors/edit.html.erb")
    end
  end

  def destroy
    @author = Author.find(params[:id])

    @author.destroy

    if URI(request.referer).path == "/authors/#{@author.id}"
      redirect_to("/", :notice => "Author deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Author deleted.")
    end
  end
end
