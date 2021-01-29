class User < ActiveRecord::Base
    has_secure_password
    validates :password_digest, presence: true
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        #byebug
        unless admin
            if nausea > happiness
                'sad'
            else
                'happy'
            end
        end
    end
end
