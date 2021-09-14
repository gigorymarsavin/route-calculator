class AddOrgIdToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :organisation_id, :integer
  end
end
