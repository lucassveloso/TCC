class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]
  before_action :set_school_classes, only: [:new, :edit, :create]
  before_action :set_authorizations, :set_additional_activities, only: [:show, :new, :edit, :create]
  before_action :set_new_student, only: [:new]

  def index
    @students = Student.all.includes(:person, :school_class)
    respond_to do |format|
      format.html
      format.json { render json: StudentDatatable.new(view_context, {students: @students}) }
    end
  end

  def show
  end

  def new
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

  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student , notice: 'Alterações realizadas com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_path, notice: "O Aluno #{@student.person.name} foi removido com sucesso" }
    end
  end

  private
  def set_student
    @student = Student.where(id: params[:id]).present? ? Student.find(params[:id]) : (redirect_to "/404")
  end

  def set_new_student
    @student = Student.new
    person = @student.build_person
    address = person.build_address
    document = person.build_document
    identity_document = document.build_identity_document
    certificate = document.build_certificate
  end

  def student_params
    params.require(:student).permit(:nis_number, :entry_date, :special_needs, :teaching_step, :notes, :bolsa_familia, :school_class_id,
                                    additional_activity_ids: [],authorization_ids: [],
                                    person_attributes: [:name, :phone, :cellphone, :email, :birthdate, :genre, :ethnicity, :nationality, :naturalness, :religion,:photo_url,
                                      address_attributes: [:address, :zipcode, :number, :complement, :state, :city, :country, :neighborhood],
                                      document_attributes: [:cpf,
                                        identity_document_attributes: [:identity_number, :dispatch_date, :dispatcher_organ, :federation_unit],
                                        certificate_attributes: [:type_of, :term_number, :sheet_number, :book, :federation_unit, :emission_date, :notarys_office]
                                      ]
                                    ])
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
