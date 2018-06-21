class StudentsController < ApplicationController
  def index
    @students = Student.page(params[:page]).per(10)
  end

  def show
    @student = Student.find(params[:id])
  end
end
