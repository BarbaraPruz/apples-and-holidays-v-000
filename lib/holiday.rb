require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  # If I don't know season for 4th of july:
  #holiday_hash.each { | season, days_hash |
  #  if days_hash.has_key?(:fourth_of_july)
  #    return days_hash[:fourth_of_july][1]
  #  end
  #}
  # but since I know summer -
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each { | holiday, supply_hash |
    supply_hash << supply
  }
end

def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  # For those of us who don't know season for memorial day -
  #holiday_hash.each { | season, days_hash |
  #  if days_hash.has_key?(:memorial_day)
  #     days_hash[:memorial_day] << supply
  #  end
  #}
  # otherwise
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  holiday_hash[season][holiday_name] = supply_array
  holiday_hash
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  # Test problem: following passes test but is probably actually wrong (including holidays and not just supplies)
  #holiday_hash[:winter].values.flatten
  holiday_hash[:winter].map { | holiday, supplies |
    supplies}.flatten
end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.
  holiday_hash.each { | season, days_hash |
    puts "#{season.to_s.capitalize}:"
    days_hash.each { | day, supplies |
      puts "  #{day.to_s.gsub(/_/," ").split.map(&:capitalize).join(' ')}: #{supplies.join(", ")}"
    }
  }
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  bbq_list = []
  holiday_hash.each { | season, days_hash |
    days_hash.each { | day, supplies |
      if supplies.include? "BBQ"
        bbq_list << day
      end
    }
  }
  bbq_list
end
