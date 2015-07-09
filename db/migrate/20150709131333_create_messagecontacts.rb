class CreateMessagecontacts < ActiveRecord::Migration
  def change
    create_table :messagecontacts do |t|

      t.timestamps null: false
    end
  end
end
