# == Schema Information
#
# Table name: messagecontacts
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  telephone   :string
#  description :string
#  title       :string
#  email       :string
#  city        :string
#

class Messagecontact < ActiveRecord::Base
  belongs_to :user
end
