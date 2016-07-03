class GuardianDatatable < AjaxDatatablesRails::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  def sortable_columns
    @sortable_columns ||= %w(Person.name Person.genre Guardian.students.length)
  end

  def searchable_columns
    @searchable_columns ||= %w(Person.name Person.genre Guardian.students.length)
  end

  private

  def data
    records.map do |record|
      [
        link_to(record.person.name, guardian_path(record)),
        record.person.genre,
        record.students.length
      ]
    end
  end

  def get_raw_records
    options[:guardians]
  end
end