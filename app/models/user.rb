class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
end


# == Schema Information
# Schema version: 20101022172528
#
# Table name: users
#
#  id                  :integer         primary key
#  email               :string(255)     default(""), not null
#  encrypted_password  :string(128)     default(""), not null
#  password_salt       :string(255)     default(""), not null
#  remember_token      :string(255)
#  remember_created_at :timestamp
#  sign_in_count       :integer         default(0)
#  current_sign_in_at  :timestamp
#  last_sign_in_at     :timestamp
#  current_sign_in_ip  :string(255)
#  last_sign_in_ip     :string(255)
#  created_at          :timestamp
#  updated_at          :timestamp
#

