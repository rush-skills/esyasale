# == Schema Information
#
# Table name: sales
#
#  id         :integer          not null, primary key
#  start      :datetime
#  end        :datetime
#  quantity   :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Sale < ActiveRecord::Base
  belongs_to :user
  has_many :tickets 
  validate :validate_ticket_count
  validates :quantity, :presence => true
  validates :end, :presence => true
  validates :start, :presence => true
  def validate_ticket_count
     if self.tickets.count >= self.quantity
       errors.add(:id, 'Error - Max ticket limit reached for this sale')
     end
  end
end
