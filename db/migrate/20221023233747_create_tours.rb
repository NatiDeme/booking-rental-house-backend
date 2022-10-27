class CreateTours < ActiveRecord::Migration[7.0]
  def change
    create_table :tours do |t|
      t.string :image
      t.string :city
      t.string :description
      t.decimal :price
      t.decimal :duration
      t.string :email
      t.string :password_digest
      t.timestamps
    end
    add_reference :tours, :user, index: true
  end
end
