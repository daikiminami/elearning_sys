class Word < ApplicationRecord
  has_many :choices , dependent: :destroy
  accepts_nested_attributes_for :choices, allow_destroy: true
  belongs_to :category
  
  validates :content, presence: true, length:{maximum: 50 },
                                      uniqueness: true

  validate :correct_validation

    def correct_validation
      array=choices.collect{|a| a.correct}
      array_true_count=array.count(true)
      if array_true_count != 1
        errors.add(:content,"Please,check only one")
      else
      end
    end
end
