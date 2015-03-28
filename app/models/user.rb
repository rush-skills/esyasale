# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default("0"), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime
#  updated_at             :datetime
#  name                   :string
#  role                   :integer
#  provider               :string
#  uid                    :string
#

class User < ActiveRecord::Base
  enum role: [:user, :admin]
  after_initialize :set_default_role, :if => :new_record?
  has_one :ticket
  has_many :sale

  def to_s
    name.to_s + " | " + email.to_s
  end
  def set_default_role
    self.role ||= :user
  end

  def self.from_omniauth(auth)
    if true || auth.info.email.split("@").last == "iiitd.ac.in"
  	  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  	    user.email = auth.info.email
  	    # user.password = Devise.friendly_token[0,20]
  	    user.name = auth.info.name   # assuming the user model has a name
  	    # user.image = auth.info.image # assuming the user model has an image
  	  end
    else
      Rails.logger.warn "Non IIITD access from "+ auth.info.email.to_s
      nil
    end
	end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :database_authenticatable, :registerable, :recoverable, :rememberable,:validatable, 
  devise :trackable, :omniauthable, :omniauth_providers => [:google_oauth2]


end
