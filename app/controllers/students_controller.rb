class StudentsController < ApplicationController

  def index
    @search_results_students = search_students(params[:text_search])
  end

  def search_students(text_search)
    text_search.blank? ? Student.all.includes(:person) : Student.search(params[:text_search]).includes(:person)
  end
end
