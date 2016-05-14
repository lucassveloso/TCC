class StudentDatatable < AjaxDatatablesRails::Base

  def sortable_columns
    @sortable_columns ||= %w(Person.name Person.genre Student.nis_number)
  end

  def searchable_columns
    @searchable_columns ||= %w(Person.name Person.genre Student.nis_number)
  end

  private

  def data
    records.map do |record|
      [
        record.person.name,
        record.person.genre,
        record.nis_number
      ]
    end
  end

  def get_raw_records
    Student.joins(:person)
  end
end
