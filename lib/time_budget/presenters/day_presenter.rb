require "time_budget/decorators/hours_and_minutes"

module TimeBudget
  module Presenters
    class DayPresenter
      DAY_DURATION = 60*60*24

      attr_reader :name, :activities

      def initialize(name, activities = [])
        @name = name
        @activities = activities.map { |a| ActivityPresenter.new(a) }
      end

      def has_time_available?
        (DAY_DURATION - activities_duration) > 0
      end

      def activities_duration
        @activities.inject(0) { |total, activity| total += activity.duration }
      end

      def hours_and_minutes_available
        available_duration = DAY_DURATION - activities_duration

        Decorators::HoursAndMinutes.new(available_duration).hours_and_minutes
      end

      def hours_available
        available_duration = DAY_DURATION - activities_duration
        "%02d" % Decorators::HoursAndMinutes.new(available_duration).hours
      end

      def minutes_available
        available_duration = DAY_DURATION - activities_duration
        "%02d" % Decorators::HoursAndMinutes.new(available_duration).minutes
      end
    end
  end
end
