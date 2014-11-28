class AddTitleToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :title, :string
    add_column :reviews, :nickname, :string
    add_column :reviews, :email, :string
  end
end
