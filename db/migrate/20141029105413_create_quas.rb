class CreateQuas < ActiveRecord::Migration
  def change
    create_table :quas do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.string :quality
      t.string :effect
      t.string :url

      t.timestamps
    end
  end
end
