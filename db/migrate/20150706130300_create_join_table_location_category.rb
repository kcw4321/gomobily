class CreateJoinTableLocationCategory < ActiveRecord::Migration
  def change
    create_join_table :locations, :categories do |t|
      t.index [:location_id, :category_id]
      t.index [:category_id, :location_id]
    end
  end
end
