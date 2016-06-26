class TeachersController < ApplicationController
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]
  before_action :set_new_teacher, only: [:new]

  def index
    @teachers = Teacher.all.includes(:person)
    respond_to do |format|
      format.html
      format.json { render json: TeacherDatatable.new(view_context, {teachers: @teachers}) }
    end
  end

  def show
  end

  def new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher , notice: 'Professor cadastrado com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @teacher.update(teacher_params)
        format.html { redirect_to @teacher , notice: 'Alterações realizadas com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @teacher.destroy
    respond_to do |format|
      format.html { redirect_to teachers_path, notice: "O Professor #{@teacher.person.name} foi removido com sucesso" }
    end
  end

  def search_teachers
    respond_to do |format|
      if request.xhr?
        teachers = Teacher.search(params[:text_search]).includes(:person)
        format.json { render json: teachers, :include => [:person]}
      end
    end
  end

  private
  def set_teacher
    @teacher = Teacher.where(id: params[:id]).present? ? Teacher.find(params[:id]) : (redirect_to "/404")
  end

  def set_new_teacher
    @teacher = Teacher.new
    person = @teacher.build_person
    address = person.build_address
    document = person.build_document
    identity_document = document.build_identity_document
    certificate = document.build_certificate
  end

  def teacher_params
    params.require(:teacher).permit(:registration_number, :time_load, :subject, :admission_date, :notes, :qualifications,
                                    person_attributes: [:name, :phone, :cellphone, :email, :birthdate, :genre, :ethnicity, :nationality, :naturalness, :religion,:photo_url,
                                      address_attributes: [:address, :zipcode, :number, :complement, :state, :city, :country, :neighborhood],
                                      document_attributes: [:cpf,
                                        identity_document_attributes: [:identity_number, :dispatch_date, :dispatcher_organ, :federation_unit],
                                        certificate_attributes: [:type_of, :term_number, :sheet_number, :book, :federation_unit, :emission_date, :notarys_office]
                                      ]
                                    ])
  end

end
