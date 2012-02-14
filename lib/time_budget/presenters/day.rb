require "time_budget/decorators/hours_and_minutes"
require "core_ext/enumerable"
require "date"

module TimeBudget
  module Presenters
    class Day
      DAY_DURATION = 60*60*24

      attr_reader :activities

      def initialize(number, activities = [])
        @number = number
        @activities = activities
      end

      def name
        Date::ABBR_DAYNAMES[@number]
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

      def self.this_week
        (0..6).map &method(:for_day_number)
      end

      def self.for_day_number(day_number)
        self.new(day_number, Presenters::Activity.for_day(day_number))
      end
    end
  end
end
