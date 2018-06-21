class AuthorshipsController < ApplicationController
  def index
    @authorships = Authorship.page(params[:page]).per(10)

    render("authorships/index.html.erb")
  end

  def show
    @authorship = Authorship.find(params[:id])

    render("authorships/show.html.erb")
  end

  def new
    @authorship = Authorship.new

    render("authorships/new.html.erb")
  end

  def create
    @authorship = Authorship.new

    @authorship.books_id = params[:books_id]
    @authorship.authors_id = params[:authors_id]

    save_status = @authorship.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/authorships/new", "/create_authorship"
        redirect_to("/authorships")
      else
        redirect_back(:fallback_location => "/", :notice => "Authorship created successfully.")
      end
    else
      render("authorships/new.html.erb")
    end
  end

  def edit
    @authorship = Authorship.find(params[:id])

    render("authorships/edit.html.erb")
  end

  def update
    @authorship = Authorship.find(params[:id])

    @authorship.books_id = params[:books_id]
    @authorship.authors_id = params[:authors_id]

    save_status = @authorship.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/authorships/#{@authorship.id}/edit", "/update_authorship"
        redirect_to("/authorships/#{@authorship.id}", :notice => "Authorship updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Authorship updated successfully.")
      end
    else
      render("authorships/edit.html.erb")
    end
  end

  def destroy
    @authorship = Authorship.find(params[:id])

    @authorship.destroy

    if URI(request.referer).path == "/authorships/#{@authorship.id}"
      redirect_to("/", :notice => "Authorship deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Authorship deleted.")
    end
  end
end
