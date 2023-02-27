class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :comment
      t.references :pitch, null: false, foreign_key: true

      t.timestamps
    end
  end
end
