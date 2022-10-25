class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.date :date
      t.timestamps
    end
    add_reference :reservations, :user, index: true
    add_reference :reservations, :tours, index: true
  end
end
