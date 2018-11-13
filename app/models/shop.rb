class Shop < ActiveRecord::Base
    validates :mentor, presence: true
end
