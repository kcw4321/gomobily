class AddTelephoneToMessageContact < ActiveRecord::Migration
  def change
    add_column :messagecontacts, :telephone, :string
    add_column :messagecontacts, :description, :string
    add_column :messagecontacts, :title, :string
    add_column :messagecontacts, :email, :string
    add_column :messagecontacts, :city, :string
  end
end
