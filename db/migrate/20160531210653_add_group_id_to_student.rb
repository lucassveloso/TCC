class AddGroupIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :group_id, :integer
  end
end
