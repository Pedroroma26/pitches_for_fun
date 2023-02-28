class AddDefaultValueToAvailable < ActiveRecord::Migration[7.0]
  def change
    change_column :pitches, :available, :boolean, default: true
  end
end
