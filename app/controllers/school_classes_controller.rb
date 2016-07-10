class SchoolClassesController < ApplicationController
  before_action :authorize
  before_action :set_school_class, only: [:show, :edit, :update, :destroy]

  def index
    @school_classes = SchoolClass.all
    respond_to do |format|
      format.html
      format.json { render json: SchoolClassDatatable.new(view_context, {school_classes: @school_classes}) }
    end
  end

  def show
  end

  def new
    @school_class = SchoolClass.new
  end

  def create
    @school_class = SchoolClass.new(school_class_params)
    add_students
    add_teachers
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
    respond_to do |format|
      if @school_class.update(school_class_params)
        add_students
        add_teachers
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

  def search_school_classes
    respond_to do |format|
      if request.xhr?
        school_classes = SchoolClass.search(params[:text_search])
        format.json { render json: school_classes}
      end
    end
  end

  def show_students
    respond_to do |format|
      format.json { render json: StudentDatatable.new(view_context, {students: set_students})}
    end
  end

  def show_teachers
    respond_to do |format|
      format.json { render json: TeacherDatatable.new(view_context, {teachers: set_teachers})}
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
    @school_class = SchoolClass.find(params[:school_class_id])
    Student.where(id: @school_class.students.map(&:id)).joins(:person, :school_class)
  end

  def set_teachers
    @school_class = SchoolClass.find(params[:school_class_id])
    Teacher.where(id: @school_class.teachers.map(&:id)).joins(:person)
  end

  def add_students
    @school_class.students = []
    @school_class.students << Student.find(params[:students_ids].values) if params[:students_ids]
  end

  def add_teachers
    @school_class.teachers = []
    @school_class.teachers << Teacher.find(params[:teachers_ids].values) if params[:teachers_ids]
  end
end
