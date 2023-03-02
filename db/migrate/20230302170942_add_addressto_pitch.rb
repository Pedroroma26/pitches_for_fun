class AddAddresstoPitch < ActiveRecord::Migration[7.0]
  def change
    add_column :pitches, :address, :string
  end
end
