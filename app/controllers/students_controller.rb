class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: StudentDatatable.new(view_context) }
    end
  end

  def show
  end

  def edit
  end

  def destroy
  end

  private
  def set_student
    @student = Student.where(id: params[:id]).present? ? Student.find(params[:id]) : (redirect_to "/404")
  end
end
