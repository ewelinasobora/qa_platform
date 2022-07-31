class AddDefaultViewsNUmber < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :views, :integer, default: 0
  end
end
