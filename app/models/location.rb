# == Schema Information
#
# Table name: locations
#
#  id                 :integer          not null, primary key
#  name               :string
#  description        :text
#  telephone          :string
#  website            :string
#  email              :string
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#  street             :string
#  city               :string
#  postcode           :string
#  location_category  :string
#  validated          :boolean
#  wheelchair_access  :boolean
#  step_free_access   :boolean
#  automatic_doors    :boolean
#  disabled_parking   :boolean
#  accessible_toilets :boolean
#  user_id            :integer
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  latitude           :float
#  longitude          :float
#
# Indexes
#
#  index_locations_on_user_id  (user_id)
#

class Location < ActiveRecord::Base
  belongs_to :user
  has_many :reviews

  has_attached_file :photo,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :photo,
    content_type: /\Aimage\/.*\z/

  scope :validated, -> { where(validated: true) }
end
