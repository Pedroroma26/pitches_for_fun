class CreatePitches < ActiveRecord::Migration[7.0]
  def change
    create_table :pitches do |t|
      t.string :name
      t.integer :price
      t.string :location
      t.string :type
      t.boolean :available

      t.timestamps
    end
  end
end
