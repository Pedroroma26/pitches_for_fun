class PitchReferencesUser < ActiveRecord::Migration[7.0]
  def change
    add_reference :pitches, :users
  end
end
