class RemoveTitleFromReviews < ActiveRecord::Migration
  def change
    remove_column :reviews, :title, :string
  end
end
