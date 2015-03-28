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
  belongs_to :sale
  validates_associated :sale

  validate :validate_user, :on => :create
  validate :validate_time, :on => :create
  def validate_user
    unless Ticket.where(user_id: self.user_id).empty?
       errors.add(:id, 'Error - You have already booked a ticket')
     end
  end

  def validate_time
    unless self.sale.start < Time.now and Time.now < self.sale.end
      errors.add(:id, 'Error - Sale not running')
    end
  end
  belongs_to :user
  def status
  	if paid
  		"Paid"
  	elsif blocked
  		"Blocked"
  	else
  		"Booked"
  	end
  end
end
