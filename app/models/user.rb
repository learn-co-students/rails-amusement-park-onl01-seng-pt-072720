class User < ActiveRecord::Base
    has_many :rides 
    has_many :attractions, through: :rides 

    validates :happiness, presence: true 
    validates :nausea, presence: true

    has_secure_password
    
    def mood 
        unless admin
            happiness > nausea ? "happy" : "sad"
        end 
    end 
end