class TeacherDatatable < AjaxDatatablesRails::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  def sortable_columns
    @sortable_columns ||= %w(Person.name Teacher.subject Teacher.registration_number Teacher.time_load)
  end

  def searchable_columns
    @searchable_columns ||= %w(Person.name Teacher.subject Teacher.registration_number Teacher.time_load)
  end

  private

  def data
    records.map do |record|
      [
        link_to(record.person.name, teacher_path(record)),
        record.subject,
        record.registration_number,
        record.time_load
      ]
    end
  end

  def get_raw_records
    options[:teachers]
  end
end
