class SchoolClassesController < ApplicationController
  before_action :set_school_class, only: [:show, :edit, :update, :destroy]

  def index
    respond_to do |format|
      format.html
      format.json { render json: SchoolClassesDatatable.new(view_context) }
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render json: StudentDatatable.new(view_context, {students: set_students}) }
    end
  end

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.new(school_class_params)
    add_students
    respond_to do |format|
      if @school_class.save
        format.html { redirect_to @school_class , notice: 'Turma cadastrada com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    add_students
    respond_to do |format|
      if @school_class.update(school_class_params)
        format.html { redirect_to @school_class , notice: 'Alterações realizadas com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @school_class.students.empty? && @school_class.teachers.empty?
        @school_class.destroy
        format.html { redirect_to school_classes_path, notice: "A Turma #{@school_class.number} foi removida com sucesso" }
      else
         format.html { redirect_to @school_class, flash: { error: "A Turma #{@school_class.number} não pode ser removida, existem alunos e/ou professores alocados" }}
      end
    end
  end

  def search_students
    respond_to do |format|
      if request.xhr?
        students = Student.search(params[:text_search]).includes(:person, :school_class)
        format.json { render json: students, :include => [:person,:school_class]}
      end
    end
  end

  private
  def set_school_class
    @school_class = SchoolClass.where(id: params[:id]).present? ? SchoolClass.find(params[:id]) : (redirect_to "/404")
  end

  def school_class_params
    params.require(:school_class).permit(:number, :classroom, :grade, :notes)
  end

  def set_students
    Student.where(id: @school_class.students.map(&:id)).joins(:person, :school_class)
  end

  def add_students
    @school_class.students = []
    @school_class.students << Student.find(params[:students_ids].values) if params[:students_ids]
  end
end
