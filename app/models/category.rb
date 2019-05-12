class Category < ApplicationRecord
    has_many :words
    validates :title,:description , presence: true
end
