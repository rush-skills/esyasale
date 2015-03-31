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
  validates :quantity, :presence => true
  validates :end, :presence => true
  validates :start, :presence => true
  
  def to_s
    self.start.strftime("Sale on %d/%m/%y %H:%M for ") + self.quantity.to_s + " tickets"
  end
end
