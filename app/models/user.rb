class User < ApplicationRecord
  before_save { email.downcase! }

  has_many :categories, through: :lessons
  has_many :lessons

  validates :name, presence: true, length: {maximum: 50 }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true,format:{with: EMAIL_REGEX}, 
                                    length:{maximum: 255 },
                                    uniqueness:{case_sensitive: false}

  has_secure_password
  validates :password, length:{minimum: 6 },
                        allow_nil:true
  mount_uploader :avatar, AvatarUploader

def follow(other_user)
  Relationship.create(
    follower_id: id,
    followed_id: other_user.id
  )
end

def active_relationships
  Relationship.where(follower_id: id)
end

def passive_relationships
  Relationship.where(followed_id: id)
end

def relationship(other_user)
  active_relationships.find_by(followed_id: other_user.id)
end

def following
  ids = active_relationships.pluck(:followed_id)
  User.where(id: ids)
end

def followers
  ids = passive_relationships.pluck(:follower_id)
  User.where(id: ids)
end

end