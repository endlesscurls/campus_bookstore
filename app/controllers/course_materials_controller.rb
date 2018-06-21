class CourseMaterialsController < ApplicationController
  def index
    @course_materials = CourseMaterial.page(params[:page]).per(10)

    render("course_materials/index.html.erb")
  end

  def show
    @course_material = CourseMaterial.find(params[:id])

    render("course_materials/show.html.erb")
  end

  def new
    @course_material = CourseMaterial.new

    render("course_materials/new.html.erb")
  end

  def create
    @course_material = CourseMaterial.new

    @course_material.book_id = params[:book_id]
    @course_material.course_id = params[:course_id]

    save_status = @course_material.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/course_materials/new", "/create_course_material"
        redirect_to("/course_materials")
      else
        redirect_back(:fallback_location => "/", :notice => "Course material created successfully.")
      end
    else
      render("course_materials/new.html.erb")
    end
  end

  def edit
    @course_material = CourseMaterial.find(params[:id])

    render("course_materials/edit.html.erb")
  end

  def update
    @course_material = CourseMaterial.find(params[:id])

    @course_material.book_id = params[:book_id]
    @course_material.course_id = params[:course_id]

    save_status = @course_material.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/course_materials/#{@course_material.id}/edit", "/update_course_material"
        redirect_to("/course_materials/#{@course_material.id}", :notice => "Course material updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Course material updated successfully.")
      end
    else
      render("course_materials/edit.html.erb")
    end
  end

  def destroy
    @course_material = CourseMaterial.find(params[:id])

    @course_material.destroy

    if URI(request.referer).path == "/course_materials/#{@course_material.id}"
      redirect_to("/", :notice => "Course material deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Course material deleted.")
    end
  end
end
