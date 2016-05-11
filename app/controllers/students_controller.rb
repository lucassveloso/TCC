class StudentsController < ApplicationController

  def index
    if params[:text_search].blank?
       @student_search_results = Student.all.includes(:person)
    else
       @student_search_results = Student.search(params[:text_search]).includes(:person)
    end
  end
end
