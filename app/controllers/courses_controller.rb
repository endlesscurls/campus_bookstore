class CoursesController < ApplicationController
  def index
    @courses = Course.all

    render("courses/index.html.erb")
  end

  def show
    @class_schedule = ClassSchedule.new
    @course_material = CourseMaterial.new
    @course = Course.find(params[:id])

    render("courses/show.html.erb")
  end

  def new
    @course = Course.new

    render("courses/new.html.erb")
  end

  def create
    @course = Course.new

    @course.course_name = params[:course_name]
    @course.course_code = params[:course_code]
    @course.professor = params[:professor]

    save_status = @course.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/courses/new", "/create_course"
        redirect_to("/courses")
      else
        redirect_back(:fallback_location => "/", :notice => "Course created successfully.")
      end
    else
      render("courses/new.html.erb")
    end
  end

  def edit
    @course = Course.find(params[:id])

    render("courses/edit.html.erb")
  end

  def update
    @course = Course.find(params[:id])

    @course.course_name = params[:course_name]
    @course.course_code = params[:course_code]
    @course.professor = params[:professor]

    save_status = @course.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/courses/#{@course.id}/edit", "/update_course"
        redirect_to("/courses/#{@course.id}", :notice => "Course updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Course updated successfully.")
      end
    else
      render("courses/edit.html.erb")
    end
  end

  def destroy
    @course = Course.find(params[:id])

    @course.destroy

    if URI(request.referer).path == "/courses/#{@course.id}"
      redirect_to("/", :notice => "Course deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Course deleted.")
    end
  end
end
