class Activity < ApplicationRecord
  belongs_to :user
  belongs_to :action, polymorphic: true

end
