class AddCoordinatesToPitches < ActiveRecord::Migration[7.0]
  def change
    add_column :pitches, :latitude, :float
    add_column :pitches, :longitude, :float
  end
end
