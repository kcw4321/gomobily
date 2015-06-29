class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :description
      t.string :telephone
      t.string :website
      t.string :email
      t.attachment :photo
      t.string :street
      t.string :city
      t.string :postcode
      t.string :location_category
      t.boolean :validated
      t.boolean :wheelchair_access
      t.boolean :step_free_access
      t.boolean :automatic_doors
      t.boolean :disabled_parking
      t.boolean :accessible_toilets
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
