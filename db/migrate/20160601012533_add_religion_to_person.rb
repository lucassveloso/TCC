class AddReligionToPerson < ActiveRecord::Migration
  def change
    add_column :people, :religion, :string
  end
end
