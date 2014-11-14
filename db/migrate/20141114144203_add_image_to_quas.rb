class AddImageToQuas < ActiveRecord::Migration
  def change
    add_column :quas, :image1_caption, :string
    add_column :quas, :image1, :binary
    add_column :quas, :image2_caption, :string
    add_column :quas, :image2, :binary
    add_column :quas, :image3_caption, :string
    add_column :quas, :image3, :binary
  end
end
