
[1mFrom:[0m /mnt/c/Users/Cinna/development/flatiron/labs/rails-amusement-park-onl01-seng-pt-072720/app/models/ride.rb:14 Ride#take_ride:

     [1;34m7[0m: [32mdef[0m [1;34mtake_ride[0m
     [1;34m8[0m:     [1;34m# accounts for the user not having enough tickets[0m
     [1;34m9[0m:     [1;34m# accounts for the user not being tall enough[0m
    [1;34m10[0m:     [1;34m# for the user not being tall enough and not having enough tickets[0m
    [1;34m11[0m:     [1;34m# updates ticket number[0m
    [1;34m12[0m:     [1;34m# updates the user's nausea[0m
    [1;34m13[0m:     [1;34m# updates the user's happiness[0m
 => [1;34m14[0m:     binding.pry
    [1;34m15[0m:     @user = [1;36mself[0m.user
    [1;34m16[0m:     @attraction = [1;36mself[0m.attraction
    [1;34m17[0m:     [32mif[0m (@user.tickets < @attraction.tickets) && (@user.height < @attraction.min_height)
    [1;34m18[0m:         [31m[1;31m"[0m[31mSorry. You do not have enough tickets to ride the #{@attraction.name}[0m[31m. You are not tall enough to ride the #{@attraction.name}[0m[31m.[1;31m"[0m[31m[0m
    [1;34m19[0m:     [32melsif[0m @user.tickets < @attraction.tickets
    [1;34m20[0m:         [31m[1;31m"[0m[31mSorry. You do not have enough tickets to ride the #{@attraction.name}[0m[31m.[1;31m"[0m[31m[0m
    [1;34m21[0m:     [32melsif[0m @user.height < @attraction.min_height
    [1;34m22[0m:         [31m[1;31m"[0m[31mSorry. You are not tall enough to ride the #{@attraction.name}[0m[31m.[1;31m"[0m[31m[0m
    [1;34m23[0m:     [32melse[0m
    [1;34m24[0m:         @user.tickets -= @attraction.tickets
    [1;34m25[0m:         @user.nausea += @attraction.nausea_rating
    [1;34m26[0m:         @user.happiness += @attraction.happiness_rating
    [1;34m27[0m:         @user.save
    [1;34m28[0m:         @attraction.save
    [1;34m29[0m:         [31m[1;31m"[0m[31mThanks for riding the #{@attraction.name}[0m[31m![1;31m"[0m[31m[0m
    [1;34m30[0m:     [32mend[0m
    [1;34m31[0m: [32mend[0m

