class StudentDatatable < AjaxDatatablesRails::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  def sortable_columns
    @sortable_columns ||= %w(Person.name Person.genre Student.nis_number SchoolClass.number)
  end

  def searchable_columns
    @searchable_columns ||= %w(Person.name Person.genre Student.nis_number SchoolClass.number)
  end

  private

  def data
    records.map do |record|
      [
        link_to(record.person.name, student_path(record)),
        record.person.genre,
        record.nis_number,
        record.school_class.nil? ? '' : link_to(record.school_class.number, school_class_path(record.school_class))
      ]
    end
  end

  def get_raw_records
    options[:students]
  end
end
