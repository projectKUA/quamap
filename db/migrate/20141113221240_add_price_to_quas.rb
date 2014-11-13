class AddPriceToQuas < ActiveRecord::Migration
  def change
    add_column :quas, :stay_required, :boolean
    add_column :quas, :price, :integer
  end
end
