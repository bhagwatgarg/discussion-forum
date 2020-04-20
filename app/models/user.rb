class User < ApplicationRecord
	has_secure_password
  	has_many :friends, :class_name => "User", :foreign_key => "friend_id"
  	has_many :userposts, dependent: :destroy
  	validates :username, presence: true, uniqueness: true
  	validates :name, presence: true
end