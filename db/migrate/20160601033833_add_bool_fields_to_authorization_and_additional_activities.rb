class AddBoolFieldsToAuthorizationAndAdditionalActivities < ActiveRecord::Migration
  def change
    add_column :authorizations, :authorized, :boolean
    add_column :additional_activities, :participating, :boolean
  end
end
