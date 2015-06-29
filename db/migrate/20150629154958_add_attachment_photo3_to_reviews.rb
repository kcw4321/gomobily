class AddAttachmentPhoto3ToReviews < ActiveRecord::Migration
  def self.up
    change_table :reviews do |t|
      t.attachment :photo3
    end
  end

  def self.down
    remove_attachment :reviews, :photo3
  end
end
