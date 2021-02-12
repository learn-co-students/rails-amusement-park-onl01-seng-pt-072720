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
        # binding.pry
        @user = self.user
        @attraction = self.attraction
        if (@user.tickets < @attraction.tickets) && (@user.height < @attraction.min_height)
            "Sorry. You do not have enough tickets to ride the #{@attraction.name}. You are not tall enough to ride the #{@attraction.name}."
        elsif @user.tickets < @attraction.tickets
            "Sorry. You do not have enough tickets to ride the #{@attraction.name}."
        elsif @user.height < @attraction.min_height
            "Sorry. You are not tall enough to ride the #{@attraction.name}."
        else
            @user.update(tickets: @user.tickets - @attraction.tickets, nausea: @user.nausea += @attraction.nausea_rating, happiness: @user.happiness += @attraction.happiness_rating)
            "Thanks for riding the #{@attraction.name}!"
        end
    end
end
