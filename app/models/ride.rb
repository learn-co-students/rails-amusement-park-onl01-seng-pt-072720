class Ride < ActiveRecord::Base
    belongs_to :user
    belongs_to :attraction

    def can_ride
        tickets_check, height_check = false
        if self.user.tickets >= self.attraction.tickets
            tickets_check = true
        end

        if self.user.height >= self.attraction.min_height
            height_check = true
        end
        return [tickets_check, height_check]
    end

    def take_ride
        tickets_check, height_check = can_ride
        if height_check && tickets_check
            go_on_ride
        elsif height_check && !tickets_check
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
        elsif !height_check && tickets_check
            "Sorry. You are not tall enough to ride the #{self.attraction.name}."
        else 
            "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
        end
    end

    def go_on_ride
        tickets_left = self.user.tickets - self.attraction.tickets
        new_nausea = self.user.nausea + self.attraction.nausea_rating
        new_happiness = self.user.happiness + self.attraction.happiness_rating

        self.user.update(
            :nausea => new_nausea,
            :happiness => new_happiness,
            :tickets => tickets_left
        )
        "Thanks for riding the #{self.attraction.name}!"
    end


end
