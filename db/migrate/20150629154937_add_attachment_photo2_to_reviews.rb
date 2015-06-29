class AddAttachmentPhoto2ToReviews < ActiveRecord::Migration
  def self.up
    change_table :reviews do |t|
      t.attachment :photo2
    end
  end

  def self.down
    remove_attachment :reviews, :photo2
  end
end
