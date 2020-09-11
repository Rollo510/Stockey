class List < ActiveRecord::Base
    has_many :stocks
    belongs_to :user
end
