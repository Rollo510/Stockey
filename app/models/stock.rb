class Stock < ActiveRecord::Base
    has_many :owned_stocks
    has_many :users, through: :owned_stocks
end



