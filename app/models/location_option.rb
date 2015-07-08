# == Schema Information
#
# Table name: location_options
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#  kind        :string
#  location_id :integer
#
# Indexes
#
#  index_location_options_on_location_id  (location_id)
#

class LocationOption < ActiveRecord::Base
  has_and_belongs_to_many :locations
end
