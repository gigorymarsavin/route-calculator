class AddPriceSizeDistationToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :price, :float
    add_column :packages, :distance, :float
    add_column :packages, :size, :float
  end
end
