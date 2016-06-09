class PassPhotoUrlStudentToPerson < ActiveRecord::Migration
  def change
    add_column :people, :photo_url, :string
    remove_column :students, :photo_url
  end
end
