# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  sale_id    :integer
#  user_id    :integer
#  paid       :boolean
#  blocked    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ticket < ActiveRecord::Base
  belongs_to :sale, counter_cache: true
  validates_associated :sale
  belongs_to :user

end
