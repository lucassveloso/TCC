class StudentsController < ApplicationController

  def index
    @search_results_students = search_students(params[:text_search])
    @search_results_students = "Sua pesquisa não encontrou resultados" if @search_results_students.empty?
  end

  def search_students(text_search)
    text_search.blank? ? Student.all.includes(:person) : Student.search(params[:text_search]).includes(:person)
  end
end
