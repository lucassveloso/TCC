class StudentsController < ApplicationController

  def index
    @students_result = Student.all
  end
end
