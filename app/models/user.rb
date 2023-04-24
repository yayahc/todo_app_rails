class User < ApplicationRecord
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6, allow_nil: true }
    has_many :todos

    def password
        @password
    end

    def password=(raw)
        @password = raw
        self.password_digest = BCrypt::Password.create(raw)
    end

    def is_password?(raw)
        BCrypt::Password.new(password_digest).is_password?(raw)
    end

end