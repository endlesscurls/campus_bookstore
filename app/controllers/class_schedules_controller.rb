class ClassSchedulesController < ApplicationController
  before_action :current_student_must_be_class_schedule_students, :only => [:edit, :update, :destroy]

  def current_student_must_be_class_schedule_students
    class_schedule = ClassSchedule.find(params[:id])

    unless current_student == class_schedule.students
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @class_schedules = ClassSchedule.all

    render("class_schedules/index.html.erb")
  end

  def show
    @class_schedule = ClassSchedule.find(params[:id])

    render("class_schedules/show.html.erb")
  end

  def new
    @class_schedule = ClassSchedule.new

    render("class_schedules/new.html.erb")
  end

  def create
    @class_schedule = ClassSchedule.new

    @class_schedule.courses_id = params[:courses_id]
    @class_schedule.students_id = params[:students_id]

    save_status = @class_schedule.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/class_schedules/new", "/create_class_schedule"
        redirect_to("/class_schedules")
      else
        redirect_back(:fallback_location => "/", :notice => "Class schedule created successfully.")
      end
    else
      render("class_schedules/new.html.erb")
    end
  end

  def edit
    @class_schedule = ClassSchedule.find(params[:id])

    render("class_schedules/edit.html.erb")
  end

  def update
    @class_schedule = ClassSchedule.find(params[:id])

    @class_schedule.courses_id = params[:courses_id]
    @class_schedule.students_id = params[:students_id]

    save_status = @class_schedule.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/class_schedules/#{@class_schedule.id}/edit", "/update_class_schedule"
        redirect_to("/class_schedules/#{@class_schedule.id}", :notice => "Class schedule updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Class schedule updated successfully.")
      end
    else
      render("class_schedules/edit.html.erb")
    end
  end

  def destroy
    @class_schedule = ClassSchedule.find(params[:id])

    @class_schedule.destroy

    if URI(request.referer).path == "/class_schedules/#{@class_schedule.id}"
      redirect_to("/", :notice => "Class schedule deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Class schedule deleted.")
    end
  end
end
