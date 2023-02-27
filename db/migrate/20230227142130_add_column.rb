class AddColumn < ActiveRecord::Migration[7.0]
  def change
    add_column :pitches, :name, :string
  end
end
