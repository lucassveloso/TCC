class CreateAuthorizations < ActiveRecord::Migration
  def change
    create_table :authorizations do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
