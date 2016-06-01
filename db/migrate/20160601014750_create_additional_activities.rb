class CreateAdditionalActivities < ActiveRecord::Migration
  def change
    create_table :additional_activities do |t|
      t.string :activity

      t.timestamps null: false
    end
  end
end
