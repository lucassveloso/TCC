class KinshipDatatable < AjaxDatatablesRails::Base
  include Rails.application.routes.url_helpers
  include ActionView::Helpers::UrlHelper

  def sortable_columns
    if options[:student?]
      @sortable_columns ||= %w(Kinship.kinship Person.name Person.genre Student.nis_number SchoolClass.number)
    else
      @sortable_columns ||= %w(Kinship.kinship Person.name Person.genre Person.phone Person.cellphone)
    end
  end

  def searchable_columns
    if options[:student?]
      @searchable_columns ||= %w(Kinship.kinship Person.name Person.genre Student.nis_number SchoolClass.number)
    else
      @searchable_columns ||= %w(Kinship.kinship Person.name Person.genre Person.phone Person.cellphone)
    end
  end

  private

  def data
    records.map do |record|
      if options[:student?]
        [
        record.kinship,
        link_to(record.student.person.name, student_path(record.student)),
        record.student.person.genre,
        record.student.nis_number,
        record.student.school_class.nil? ? '' :  link_to(record.student.school_class.number, school_class_path(record.student.school_class))
        ]
      else
        [
        record.kinship,
        link_to(record.guardian.person.name, guardian_path(record.guardian)),
        record.guardian.person.genre,
        record.guardian.person.phone,
        record.guardian.person.cellphone
        ]
      end
    end
  end

  def get_raw_records
    options[:kinships]
  end
end