class Lesson < ApplicationRecord
  has_many :answers
  has_many :words, through: :answers
  belongs_to :user
  belongs_to :category
end
