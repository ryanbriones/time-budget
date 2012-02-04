require "delegate"

module TimeBudget
  module Decorators
    class HoursAndMinutesDecorator < SimpleDelegator
      def hours_and_minutes
        an_hour = 60*60
        number_of_hours = (self/an_hour.to_f).floor
        number_of_minutes = ((self-(an_hour*number_of_hours))/60).floor

        output = ""
        if number_of_hours > 0
          output << "#{number_of_hours}"
        end

        if number_of_minutes > 0
          output << ":#{number_of_minutes}"
        end

        output
      end
    end
  end
end
