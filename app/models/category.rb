class Category < ApplicationRecord
  has_many :words
  validates :title,:description , presence: true, length:{maximum: 50 },
                                                  uniqueness: true
end
