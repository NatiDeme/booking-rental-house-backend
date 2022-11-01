class AddNameToTours < ActiveRecord::Migration[7.0]
  def change
    add_column :tours, :name, :string
  end
end
