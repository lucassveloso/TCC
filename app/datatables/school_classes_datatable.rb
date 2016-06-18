class SchoolClassesDatatable < AjaxDatatablesRails::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  def sortable_columns
    @sortable_columns ||= %w(SchoolClass.number SchoolClass.classroom SchoolClass.grade)
  end

  def searchable_columns
    @searchable_columns ||= %w(SchoolClass.number SchoolClass.classroom SchoolClass.grade)
  end

  private

  def data
    records.map do |record|
      [
        link_to(record.number, school_class_path(record)),
        record.classroom,
        record.grade
      ]
    end
  end

  def get_raw_records
    SchoolClass.all
  end
end
