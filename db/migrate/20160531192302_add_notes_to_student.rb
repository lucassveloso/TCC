class AddNotesToStudent < ActiveRecord::Migration
  def change
    add_column :students, :notes, :string
  end
end
