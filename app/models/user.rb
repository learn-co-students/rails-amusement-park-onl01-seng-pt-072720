class User < ActiveRecord::Base
    has_secure_password
    has_many :rides
    has_many :attractions, through: :rides

    def mood
        # returns 'sad' when the user is more nauseous than happy
        # returns 'happy' when the user is more happy than nauseous
        # binding.pry
        if self.nausea.to_i > self.happiness.to_i # `.to_i` is used to account for nil values; we could also validate that every user has a nausea + happiness level, but the example website had an admin without a mood listed
            "sad"
        else
            "happy"
        end
    end
end
