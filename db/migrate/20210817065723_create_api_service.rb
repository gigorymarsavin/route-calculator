class CreateApiService < ActiveRecord::Migration[5.2]
  def change
    create_table :api_services do |t|
      t.string :service
    end
  end
end
