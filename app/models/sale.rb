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
  has_many :tickets, dependent: :destroy
  validates :quantity, :presence => true
  validates :end, :presence => true
  validates :start, :presence => true
  
  def to_s
    "Sale on " + self.start.to_s(:short) +" for "+ self.quantity.to_s + " tickets"
  end
end
