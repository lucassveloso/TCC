class StudentsController < ApplicationController

  def index
    respond_to do |format|
      format.html
      format.json { render json: StudentDatatable.new(view_context) }
    end
  end

end
