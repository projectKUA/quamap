class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :qua, index: true
      t.integer :total_score
      t.integer :quality_score
      t.integer :convinience_score
      t.integer :cost_score
      t.integer :sight_score
      t.string :comment
      t.binary :photo_data
      t.string :photo_title

      t.timestamps
    end
  end
end
