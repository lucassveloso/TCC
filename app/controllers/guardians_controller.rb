class GuardiansController < ApplicationController
  before_action :set_guardian, only: [:show, :edit, :update, :destroy]
  before_action :set_new_guardian, only: [:new]

  def index
    @guardians = Guardian.includes(:person).references(:person)
    respond_to do |format|
      format.html
      format.json { render json: GuardianDatatable.new(view_context, {guardians: @guardians}) }
    end
  end

  def show
  end

  def new
  end

  def create
    @guardian = Guardian.new(guardian_params)
    add_kinships if params[:students_ids]
    respond_to do |format|
      if @guardian.save
        format.html { redirect_to @guardian , notice: 'Responsável cadastrado com sucesso' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @guardian.update(guardian_params)
        add_kinships if params[:students_ids]
        format.html { redirect_to @guardian , notice: 'Alterações realizadas com sucesso' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @guardian.destroy
    respond_to do |format|
      format.html { redirect_to guardians_path, notice: "O Responsável #{@guardian.person.name} foi removido com sucesso" }
    end
  end

  def search_guardians
    respond_to do |format|
      if request.xhr?
        guardians = Guardian.search(params[:text_search]).includes(:person)
        format.json { render json: guardians, :include => [:person]}
      end
    end
  end

  def show_students
    respond_to do |format|
      format.json { render json: KinshipDatatable.new(view_context, {kinships: set_kinships, student?: true})}
    end
  end

  private
  def set_guardian
    @guardian = Guardian.where(id: params[:id]).present? ? Guardian.find(params[:id]) : (redirect_to "/404")
  end

  def set_new_guardian
    @guardian = Guardian.new
    person = @guardian.build_person
    address = person.build_address
    document = person.build_document
    identity_document = document.build_identity_document
    certificate = document.build_certificate
  end

  def guardian_params
    params.require(:guardian).permit(:students_ids, :kinships, person_attributes: [:name, :phone, :cellphone, :email, :birthdate, :genre, :ethnicity, :nationality, :naturalness, :religion,:photo_url,
                                      address_attributes: [:address, :zipcode, :number, :complement, :state, :city, :country, :neighborhood],
                                      document_attributes: [:cpf,
                                        identity_document_attributes: [:identity_number, :dispatch_date, :dispatcher_organ, :federation_unit],
                                        certificate_attributes: [:type_of, :term_number, :sheet_number, :book, :federation_unit, :emission_date, :notarys_office]
                                      ]
                                    ])
  end

  def set_kinships
    @guardian = Guardian.find(params[:guardian_id])
    @guardian.kinships.includes(student: [:person, :school_class]).references(:student)
  end

  def add_kinships
    @guardian.kinships = []
    params[:students_ids].each do |index, id_student|
      @guardian.kinships.push(Kinship.new(student:Student.find(id_student), kinship: params[:kinships][index]))
    end
  end
end
