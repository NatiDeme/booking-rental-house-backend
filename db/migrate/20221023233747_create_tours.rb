class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.string :image
      t.string :city
      t.string :description
      t.integer :price
      t.time :duration
      t.timestamps
    end
    add_reference :tours, :user, index: true
  end
end
