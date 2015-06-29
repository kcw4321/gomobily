class AddAttachmentPhoto1ToReviews < ActiveRecord::Migration
  def self.up
    change_table :reviews do |t|
      t.attachment :photo1
    end
  end

  def self.down
    remove_attachment :reviews, :photo1
  end
end
