class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :destroy]
  before_action :set_school_classes, only: [:new, :edit, :create]
  before_action :set_authorizations, :set_additional_activities, only: [:show, :new, :edit, :create]

  def index
    respond_to do |format|
      format.html
      format.json { render json: StudentDatatable.new(view_context) }
    end
  end

  def show
  end

  def new
    @student = Student.new
    @student.build_person
  end

  def create
    @student = Student.new(student_params)
    respond_to do |format|
      if @student.save
        format.html { redirect_to @student , notice: 'Aluno cadastrado com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def destroy
  end

  private
  def set_student
    @student = Student.where(id: params[:id]).present? ? Student.find(params[:id]) : (redirect_to "/404")
  end

  def student_params
    params.require(:student).permit(:nis_number, :entry_date, :special_needs, :teaching_step, :photo_url,
                                    :notes, :bolsa_familia, :school_class_id, additional_activity_ids: [],
                                    authorization_ids: [], person_attributes: [:name, :phone, :cellphone,
                                    :email, :birthdate, :genre, :ethnicity, :nationality, :naturalness, :religion])
  end

  def set_school_classes
    @school_classes = SchoolClass.all
  end

  def set_authorizations
    @authorizations = Authorization.all
  end

  def set_additional_activities
    @additional_activities = AdditionalActivity.all
  end
end
