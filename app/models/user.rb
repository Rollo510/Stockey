class User < ActiveRecord::Base
    has_many :lists
    has_many :stocks
    validates_presence_of :name, :email, :password
    has_secure_password
    validates :username, presence: true
    validates :username, uniquenes: true


    def password=(pass)
        password = string
        # user.create(username:"alex2", password:"password")
    end

end
