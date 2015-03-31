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
  validate :validate_ticket_count, :on => :create
  validate :validate_user, :on => :create
  validate :validate_time, :on => :create
  def validate_ticket_count
     if self.sale.tickets.count >= self.sale.quantity
       errors.add(:id, 'Error - Max ticket limit reached for this sale')
     end
  end

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
   def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |product|
        csv << product.attributes.values_at(*column_names)
      end
    end
  end
end
