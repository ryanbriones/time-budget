require "delegate"

module TimeBudget
  module Decorators
    class HoursAndMinutesDecorator < SimpleDelegator
      ONE_HOUR_IN_SECONDS = 60*60

      def hours_and_minutes
        output = ""
        if hours > 0
          output << "#{hours}"
        end

        if minutes > 0
          output << ":#{minutes}"
        end

        output
      end

      def hours
        (self/ONE_HOUR_IN_SECONDS.to_f).floor
      end

      def minutes
        ((self-(ONE_HOUR_IN_SECONDS*hours))/60).floor
      end
    end
  end
end
