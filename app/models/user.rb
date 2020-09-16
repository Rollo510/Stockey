class User < ActiveRecord::Base
    has_many :owned_stocks
    has_many :stocks, through: :owned_stocks
    validates_presence_of :username, :email, :password
    validates :username, uniqueness: true
    has_secure_password


end
