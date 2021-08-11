class AddPriceSizeDistationToPackage < ActiveRecord::Migration[5.2]
  def change
    add_column :packages, :price, :float
    add_column :packages, :distantion, :float
    add_column :packages, :size, :float
  end
end
