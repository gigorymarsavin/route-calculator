class CreatePackages < ActiveRecord::Migration[5.2]
  def change
    create_table :packages do |t|
      t.string :name
      t.string :surname
      t.string :midname
      t.integer :phone
      t.string :email
      t.integer :weight
      t.integer :length
      t.integer :width
      t.integer :height
      t.string :addr_from
      t.string :addr_to

      t.timestamps
    end
  end
end
