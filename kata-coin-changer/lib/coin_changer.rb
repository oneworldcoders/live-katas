class Change
    def money(value)
      change_returned = []
      [50,20,10,5,1].each do |coin|
        if value >= coin
          change_returned << [coin] * (value/coin)
          value -= (coin * (value/coin)) 
        end
      end
      change_returned.flatten
    end
end