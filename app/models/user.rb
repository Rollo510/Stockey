class User < ActiveRecord::Base
    has_many :owned_stocks
    has_many :stocks, through: :owned_stocks
    validates_presence_of :username, :email, :password
    has_secure_password
    # validates :username, presence: true
    # validates :username, uniquenes: true


end
