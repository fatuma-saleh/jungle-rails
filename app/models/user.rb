class User < ActiveRecord::Base
  has_secure_password
  validates :first_name,:last_name, presence: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, confirmation: true, length: {minimum: 6}

  


end
