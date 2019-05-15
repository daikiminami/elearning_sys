class Category < ApplicationRecord
  has_many :words
  has_many :users, through: :lessons
  has_many :lessons
  accepts_nested_attributes_for :lessons
  validates :title,:description , presence: true, length:{maximum: 50 },
                                                  uniqueness: true
end
