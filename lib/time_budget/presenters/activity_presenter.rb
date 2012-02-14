require "time_budget/decorators/hours_and_minutes"

module TimeBudget
  module Presenters
    class ActivityPresenter
      def initialize(activity)
        @activity = activity
      end

      def title
        @activity.title
      end

      def duration
        @activity.duration
      end

      def hours_and_minutes
        Decorators::HoursAndMinutes.new(duration).hours_and_minutes
      end

      def hours
        "%02d" % Decorators::HoursAndMinutes.new(duration).hours
      end

      def minutes
        "%02d" % Decorators::HoursAndMinutes.new(duration).minutes
      end
    end
  end
end
