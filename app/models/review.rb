# == Schema Information
#
# Table name: reviews
#
#  id                  :integer          not null, primary key
#  title               :string
#  content             :text
#  rating              :integer
#  user_id             :integer
#  location_id         :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  photo1_file_name    :string
#  photo1_content_type :string
#  photo1_file_size    :integer
#  photo1_updated_at   :datetime
#  photo2_file_name    :string
#  photo2_content_type :string
#  photo2_file_size    :integer
#  photo2_updated_at   :datetime
#  photo3_file_name    :string
#  photo3_content_type :string
#  photo3_file_size    :integer
#  photo3_updated_at   :datetime
#
# Indexes
#
#  index_reviews_on_location_id  (location_id)
#  index_reviews_on_user_id      (user_id)
#

class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :location
end
