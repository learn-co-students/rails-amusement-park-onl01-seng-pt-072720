class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction
    validates :user_id, presence: true
    validates :attraction_id, presence: true

    def take_ride
        # accounts for the user not having enough tickets
        # accounts for the user not being tall enough
        # for the user not being tall enough and not having enough tickets
        # updates ticket number
        # updates the user's nausea
        # updates the user's happiness
        if (self.user.tickets < self.attraction.tickets) && (self.user.height < self.attraction.min_height)
            "Sorry. You do not have enough tickets to ride the #{attraction.name}. You are not tall enough to ride the #{attraction.name}."
        elsif self.user.tickets < self.attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{attraction.name}."
        elsif self.user.height < self.attraction.min_height
            "Sorry. You are not tall enough to ride the #{attraction.name}."
        else
            self.user.tickets -= self.attraction.tickets
            self.user.nausea += self.attraction.nausea_rating
            self.user.happiness += self.attraction.happiness_rating
            self.user.save
            self.attraction.save
        end
    end
end
