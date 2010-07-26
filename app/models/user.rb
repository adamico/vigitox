class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :http_authenticatable, :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :rememberable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
end

# == Schema Information
#
# Table name: users
#
#  id                  :integer         not null, primary key
#  email               :string(255)     default(""), not null
#  encrypted_password  :string(128)     default(""), not null
#  password_salt       :string(255)     default(""), not null
#  remember_token      :string(255)
#  remember_created_at :datetime
#  sign_in_count       :integer         default(0)
#  current_sign_in_at  :datetime
#  last_sign_in_at     :datetime
#  current_sign_in_ip  :string(255)
#  last_sign_in_ip     :string(255)
#  created_at          :datetime
#  updated_at          :datetime
#

