class User < ApplicationRecord
  before_save { email.downcase! }

  validates :name, presence: true, length: {maximum: 50 }

  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true,format:{with: EMAIL_REGEX}, 
                                    length:{maximum: 255 },
                                    uniqueness:{case_sensitive: false}

  has_secure_password
  validates :password, length:{minimum: 6 },
                        allow_nil:true
end