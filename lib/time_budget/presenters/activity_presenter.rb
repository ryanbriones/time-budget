require "time_budget/decorators/hours_and_minutes_decorator"

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
        Decorators::HoursAndMinutesDecorator.new(duration).hours_and_minutes
      end
    end
  end
end
