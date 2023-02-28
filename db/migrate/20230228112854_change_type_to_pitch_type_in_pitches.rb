class ChangeTypeToPitchTypeInPitches < ActiveRecord::Migration[7.0]
  def change
    rename_column :pitches, :type, :pitch_type
  end
end
