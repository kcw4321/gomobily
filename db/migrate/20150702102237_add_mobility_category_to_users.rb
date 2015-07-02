class AddMobilityCategoryToUsers < ActiveRecord::Migration
  def change
    add_column :users, :mobility_category, :string
  end
end
