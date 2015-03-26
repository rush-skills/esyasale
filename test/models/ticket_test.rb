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

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
